using DJYM_WebApplication.DTOs;
using DJYM_WebApplication.Models;
using DJYM_WebApplication.Servicios.Comun;
using Servicios_PD.Clases;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;

namespace DJYM_WebApplication.Servicios
{
    public class SrvUsuario
    {
        private readonly CRUD<USUARIO> Crud;
        private readonly USUARIO Usuario;
        private readonly DBSuper_DJYMEntities DJYM = new DBSuper_DJYMEntities();

        public Resultado<string> IniciarSesion()
        {
            try
            {
                Resultado<USUARIO> resultadoUsuario = ConsultarUsuarioPorNombreUsuario();
                if (!resultadoUsuario.Exito)
                    return new Resultado<string>("Usuario no encontrado");

                USUARIO usuarioBD = resultadoUsuario.Value;

                bool contrasenaValida = ValidarClave(Usuario.Clave, usuarioBD.Clave, usuarioBD.Salt);
                if (!contrasenaValida)
                {
                    return new Resultado<string>("La contraseña es incorrecta");
                }

                EMPLEADO empleado = usuarioBD.EMPLEADO;
                if (empleado == null)
                {
                    return new Resultado<string>("Empleado no asociado al usuario.");
                }

                // Obtener la descripción del cargo
                string descripcionCargo = empleado.CARGO.Descripcion;
                if (string.IsNullOrEmpty(descripcionCargo))
                {
                    return new Resultado<string>("El empleado no tiene un cargo asignado.");
                }

                return new Resultado<string>("") { MensajeExito = descripcionCargo };
            }
            catch (Exception ex)
            {
                return new Resultado<string>(ex.Message);
            }
        }

        public SrvUsuario() { Crud = new CRUD<USUARIO>(); }
        public SrvUsuario(USUARIO Usuario)
        {
            Crud = new CRUD<USUARIO> { Entidad = Usuario };
            this.Usuario = Usuario;
        }

        // Método para buscar al usuario en la base de datos por nombre de usuario
        private Resultado<USUARIO> ConsultarUsuarioPorNombreUsuario()
        {
            // Aquí debes implementar la lógica de búsqueda del usuario en la base de datos
            // Basado en el nombre de usuario. Por ejemplo:
            var usuario = DJYM.DbSet_USUARIO.FirstOrDefault(u => u.Nombre == Usuario.Nombre);

            if (usuario != null)
            {
                return new Resultado<USUARIO>(usuario);
            }
            else
            {
                return new Resultado<USUARIO>("Usuario no encontrado");
            }
        }

        private bool ValidarClave(string claveIngresada, string claveGuardada, string salt)
        {
            // Convertir el salt de la base de datos a un array de bytes
            byte[] saltBytes = Convert.FromBase64String(salt);

            // Cifrar la clave ingresada con el salt de la base de datos
            SrvCypher cypher = new SrvCypher() { Clave = claveIngresada };
            cypher.Salt = salt; // Asignamos el salt almacenado
            string claveCifrada = cypher.HashPassword(claveIngresada, saltBytes);

            // Comparar si la clave cifrada ingresada es igual a la almacenada en la base de datos
            return claveCifrada == claveGuardada;
        }

        public Resultado<USUARIO> Insertar() 
        {
            try
            {
                EMPLEADO empleado = new EMPLEADO { Documento = Usuario.DocumentoEmpleado };
                var resultadoEmpleado = new SrvEmpleado(empleado).ValidarExistenciaYDispobilidadDeEmpleado();
                if (!resultadoEmpleado.Exito)
                    return new Resultado<USUARIO>(resultadoEmpleado.MensajeError);

                SrvCypher Cypher = new SrvCypher() { Clave = Usuario.Clave };
                if (!Cypher.CifrarClave())
                {
                    string mensajeError = "No se pudo cifrar la clave, por lo tanto no se creó el usuario";
                    return new Resultado<USUARIO>(mensajeError);
                }

                Usuario.Clave = Cypher.ClaveCifrada;
                Usuario.Salt = Cypher.Salt;
                Crud.Entidad = Usuario;
                return Crud.Insertar();
            }
            catch(Exception ex)
            {
                return new Resultado<USUARIO>(ex.Message);
            }
        } 

        public Resultado<USUARIO> ConsultarXId() => Crud.ConsultarXId();

        public Resultado<IQueryable> Consultar() => Crud.Consultar();

        public Resultado<USUARIO> Actualizar() => Crud.Actualizar();

        public Resultado<USUARIO> Eliminar() => Crud.Eliminar();
    }
}
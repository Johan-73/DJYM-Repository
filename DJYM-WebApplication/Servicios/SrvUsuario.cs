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
        private USUARIO Usuario;

        public SrvUsuario() { Crud = new CRUD<USUARIO>(); }
        public SrvUsuario(USUARIO Usuario)
        {
            Crud = new CRUD<USUARIO> { Entidad = Usuario };
            this.Usuario = Usuario;
        }

        public Resultado<USUARIO> Insertar() 
        {
            try
            {
                SrvCypher Cypher = new SrvCypher() { Clave = Usuario.Clave};
                if (!Cypher.CifrarClave())
                {
                    string mensajeError = "No se pudo cifrar la clave, por lo tanto no se creó el usuario";
                    return new Resultado<USUARIO>(mensajeError);
                }

                Usuario.Clave = Cypher.ClaveCifrada;
                Usuario.Salt = Cypher.Salt;
                Crud.Entidad = Usuario;
                var resultado = Crud.Insertar();

                Resultado<Dictionary<USUARIO, EMPLEADO>> resultado2 = new SrvEmpleado().AsignarUsuario(Usuario, Usuario.Id);

                return new Resultado<USUARIO>("");
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
using DJYM_WebApplication.DTOs;
using DJYM_WebApplication.Models;
using DJYM_WebApplication.Servicios.Comun;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;

namespace DJYM_WebApplication.Servicios
{
    public class SrvEmpleado
    {
        private readonly CRUD<EMPLEADO> Crud;
        private readonly DBSuper_DJYMEntities DJYM;
        private EMPLEADO Empleado;

        public SrvEmpleado() { Crud = new CRUD<EMPLEADO>(); }
        public SrvEmpleado(EMPLEADO Empleado)
        {
            Crud = new CRUD<EMPLEADO> { Entidad = Empleado };
            this.Empleado = Empleado;
        }


        public Resultado<Dictionary<USUARIO, EMPLEADO>> AsignarUsuario(USUARIO usuario, int documentoEmpleado)
        {
            try
            {
                EMPLEADO empleado = DJYM.Set<EMPLEADO>().Find(documentoEmpleado);
                if (Empleado == null)
                {
                    string mensajeError = "El empleado no existe en la base de datos";
                    return new Resultado<Dictionary<USUARIO, EMPLEADO>>(mensajeError);
                }

                Empleado.USUARIOs.Add(usuario);
                DJYM.SaveChanges();

                var diccionario = new Dictionary<USUARIO, EMPLEADO> { {usuario, empleado }, };
                string mensajeExito = "Se le asignó al empleado el usuario exitosamente";
                return new Resultado<Dictionary<USUARIO, EMPLEADO>>(diccionario) { MensajeExito = mensajeExito};
            }
            catch (Exception ex)
            {
                return new Resultado<Dictionary<USUARIO, EMPLEADO>>(ex.Message);
            }  
        }

        public Resultado<EMPLEADO> Insertar() => Crud.Insertar();

        public Resultado<EMPLEADO> ConsultarXId() => Crud.ConsultarXId();

        public Resultado<IQueryable> Consultar() => Crud.Consultar();

        public Resultado<EMPLEADO> Actualizar() => Crud.Actualizar();

        public Resultado<EMPLEADO> Eliminar() => Crud.Eliminar();
    }
}
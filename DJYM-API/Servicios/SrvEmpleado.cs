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
    public class SrvEmpleado
    {
        private readonly CRUD<EMPLEADO> Crud;

        public SrvEmpleado() { Crud = new CRUD<EMPLEADO>(); }
        public SrvEmpleado(EMPLEADO Empleado)
        {
            Crud = new CRUD<EMPLEADO> { Entidad = Empleado };
        }

        public Resultado<USUARIO> ValidarExistenciaYDispobilidadDeEmpleado()
        {
            try
            {
                Resultado<EMPLEADO> resultadoEmpleado = ConsultarXId();
                if (!resultadoEmpleado.Exito)
                    return new Resultado<USUARIO>(resultadoEmpleado.MensajeError);

                EMPLEADO empleado = resultadoEmpleado.Value;
                if (empleado.USUARIOs.FirstOrDefault() != null)
                {
                    string mensajeError = $"El empleado con documento {empleado.Documento} ya tiene un usuario";
                    return new Resultado<USUARIO>(mensajeError);
                }

                return new Resultado<USUARIO>(new USUARIO());
            }
            catch (Exception ex)
            {
                return new Resultado<USUARIO>(ex.Message);
            }
        }

        public Resultado<EMPLEADO> Insertar() => Crud.Insertar();

        public Resultado<EMPLEADO> ConsultarXId() => Crud.ConsultarXId();

        public Resultado<IQueryable> Consultar() => Crud.Consultar();

        public Resultado<EMPLEADO> Actualizar() => Crud.Actualizar();

        public Resultado<EMPLEADO> Eliminar2() => Crud.Eliminar();

        public Resultado<EMPLEADO> Eliminar()
        {
            try
            {
                var resultadoEmpleado = ConsultarXId();
                if (!resultadoEmpleado.Exito)
                    return resultadoEmpleado;

                var empleado = resultadoEmpleado.Value;
                if (empleado.USUARIOs.Any())
                {
                    SrvUsuario srvUsuario = new SrvUsuario(empleado.USUARIOs.FirstOrDefault());
                    var resultadoUsuario = srvUsuario.Eliminar();
                    if (!resultadoUsuario.Exito)
                        return new Resultado<EMPLEADO>(resultadoUsuario.MensajeError);
                }

                return Crud.Eliminar();
            }
            catch (Exception ex) { return new Resultado<EMPLEADO>(ex.Message);  }
        }
    }
}
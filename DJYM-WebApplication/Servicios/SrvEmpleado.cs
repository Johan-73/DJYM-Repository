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

        public SrvEmpleado() { Crud = new CRUD<EMPLEADO>(); }
        public SrvEmpleado(EMPLEADO Empleado)
        {
            Crud = new CRUD<EMPLEADO> { Entidad = Empleado };
        }

        public Resultado<EMPLEADO> Insertar() => Crud.Insertar();

        public Resultado<EMPLEADO> ConsultarXId() => Crud.ConsultarXId();

        public Resultado<IQueryable<EMPLEADO>> Consultar() => Crud.Consultar();

        public Resultado<EMPLEADO> Actualizar() => Crud.Actualizar();

        public Resultado<EMPLEADO> Eliminar() => Crud.Eliminar();
    }
}
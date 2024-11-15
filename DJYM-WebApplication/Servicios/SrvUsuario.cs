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
    public class SrvUsuario
    {
        private readonly CRUD<USUARIO> Crud;

        public SrvUsuario() { Crud = new CRUD<USUARIO>(); }
        public SrvUsuario(USUARIO Usuario)
        {
            Crud = new CRUD<USUARIO> { Entidad = Usuario };
        }

        public Resultado<USUARIO> Insertar() => Crud.Insertar();

        public Resultado<USUARIO> ConsultarXId() => Crud.ConsultarXId();

        public Resultado<IQueryable> Consultar() => Crud.Consultar();

        public Resultado<USUARIO> Actualizar() => Crud.Actualizar();

        public Resultado<USUARIO> Eliminar() => Crud.Eliminar();
    }
}
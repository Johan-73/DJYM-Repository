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
    public class SrvPerfil
    {
        private readonly CRUD<PERFIL> Crud;

        public SrvPerfil() { Crud = new CRUD<PERFIL>(); }
        public SrvPerfil(PERFIL Perfil)
        {
            Crud = new CRUD<PERFIL> { Entidad = Perfil };
        }

        public Resultado<PERFIL> Insertar() => Crud.Insertar();

        public Resultado<PERFIL> ConsultarXId() => Crud.ConsultarXId();

        public Resultado<IQueryable> Consultar() => Crud.Consultar();

        public Resultado<PERFIL> Actualizar() => Crud.Actualizar();

        public Resultado<PERFIL> Eliminar() => Crud.Eliminar();
    }
}
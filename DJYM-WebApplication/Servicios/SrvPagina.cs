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
    public class SrvPagina
    {
        private readonly CRUD<PAGINA> Crud;

        public SrvPagina() { Crud = new CRUD<PAGINA>(); }
        public SrvPagina(PAGINA Pagina)
        {
            Crud = new CRUD<PAGINA> { Entidad = Pagina};
        }

        public Resultado<PAGINA> Insertar() => Crud.Insertar();

		public Resultado<PAGINA> ConsultarXId() => Crud.ConsultarXId();

		public Resultado<IQueryable> Consultar() => Crud.Consultar();

		public Resultado<PAGINA> Actualizar() => Crud.Actualizar();

        public Resultado<PAGINA> Eliminar() => Crud.Eliminar();
    }
}
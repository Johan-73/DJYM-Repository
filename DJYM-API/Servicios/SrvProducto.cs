using DJYM_WebApplication.DTOs;
using DJYM_WebApplication.Models;
using DJYM_WebApplication.Servicios.Comun;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DJYM_WebApplication.Servicios
{
    public class SrvProducto
    {
        private readonly CRUD<PRODUCTO> Crud;

        public SrvProducto() { Crud = new CRUD<PRODUCTO>(); }
        public SrvProducto(PRODUCTO Producto)
        {
            Crud = new CRUD<PRODUCTO> { Entidad = Producto };
        }

        public Resultado<PRODUCTO> Insertar() => Crud.Insertar();

        public Resultado<PRODUCTO> ConsultarXId() => Crud.ConsultarXId();

        public Resultado<IQueryable> Consultar() => Crud.Consultar();

        public Resultado<PRODUCTO> Actualizar() => Crud.Actualizar();

        public Resultado<PRODUCTO> Eliminar() => Crud.Eliminar();
    }
}
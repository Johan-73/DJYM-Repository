using DJYM_WebApplication.DTOs;
using DJYM_WebApplication.Models;
using DJYM_WebApplication.Servicios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace DJYM_WebApplication.Controllers
{
    [RoutePrefix("api/Productos")]
    public class ProductosController : ApiController
    {
        [HttpPost]
        [Route("Insertar")]
        public Resultado<PRODUCTO> Insertar([FromBody] PRODUCTO producto)
        {
            SrvProducto servicio = new SrvProducto(producto);
            return servicio.Insertar();
        }

        [HttpGet]
        [Route("ConsultarXId")]
        public Resultado<PRODUCTO> ConsultarXId([FromBody] PRODUCTO producto)
        {
            SrvProducto servicio = new SrvProducto(producto);
            return servicio.ConsultarXId();
        }

        [HttpGet]
        [Route("Consultar")]
        public Resultado<IQueryable> Consultar()
        {
            SrvProducto servicio = new SrvProducto();
            return servicio.Consultar();
        }

        [HttpPut]
        [Route("Actualizar")]
        public Resultado<PRODUCTO> Actualizar([FromBody] PRODUCTO producto)
        {
            SrvProducto servicio = new SrvProducto(producto);
            return servicio.Actualizar();
        }

        [HttpDelete]
        [Route("Eliminar")]
        public Resultado<PRODUCTO> Eliminar([FromBody] PRODUCTO producto)
        {
            SrvProducto servicio = new SrvProducto(producto);
            return servicio.Eliminar();
        }
    }
}
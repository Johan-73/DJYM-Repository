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
    [RoutePrefix("api/Paginas")]
    public class PaginasController : ApiController
    {
        [HttpPost]
        [Route("Insertar")]
        public Resultado<PAGINA> Insertar([FromBody] PAGINA pagina)
        {
            SrvPagina servicio = new SrvPagina(pagina);
            return servicio.Insertar();
        }

        [HttpGet]
        [Route("ConsultarXId")]
        public Resultado<PAGINA> ConsultarXId([FromBody] PAGINA pagina)
        {
            SrvPagina servicio = new SrvPagina(pagina);
            return servicio.ConsultarXId();
        }

        [HttpGet]
        [Route("Consultar")]
        public Resultado<IQueryable> Consultar()
        {
            SrvPagina servicio = new SrvPagina();
            return servicio.Consultar();
        }

        [HttpPut]
        [Route("Actualizar")]
        public Resultado<PAGINA> Actualizar([FromBody] PAGINA pagina)
        {
            SrvPagina servicio = new SrvPagina(pagina);
            return servicio.Actualizar();
        }

        [HttpDelete]
        [Route("Eliminar")]
        public Resultado<PAGINA> Eliminar([FromBody] PAGINA pagina)
        {
            SrvPagina servicio = new SrvPagina(pagina);
            return servicio.Eliminar();
        }
    }
}

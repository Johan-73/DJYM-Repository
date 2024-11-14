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
    [RoutePrefix("api/Perfiles")]
    public class PerfilesController : ApiController
    {
        [HttpPost]
        [Route("Insertar")]
        public Resultado<PERFIL> Insertar([FromBody] PERFIL perfil)
        {
            SrvPerfil srvPerfil = new SrvPerfil(perfil);
            return srvPerfil.Insertar();
        }

        [HttpGet]
        [Route("ConsultarXId")]
        public Resultado<PERFIL> ConsultarXId([FromBody] PERFIL perfil)
        {
            SrvPerfil srvPerfil = new SrvPerfil(perfil);
            return srvPerfil.ConsultarXId();
        }

        [HttpGet]
        [Route("Consultar")]
        public Resultado<IQueryable<PERFIL>> Consultar()
        {
            SrvPerfil srvPerfil = new SrvPerfil();
            return srvPerfil.Consultar();
        }

        [HttpPut]
        [Route("Actualizar")]
        public Resultado<PERFIL> Actualizar([FromBody] PERFIL perfil)
        {
            SrvPerfil srvPerfil = new SrvPerfil(perfil);
            return srvPerfil.Actualizar();
        }

        [HttpDelete]
        [Route("Eliminar")]
        public Resultado<PERFIL> Eliminar([FromBody] PERFIL perfil)
        {
            SrvPerfil srvPerfil = new SrvPerfil(perfil);
            return srvPerfil.Eliminar();
        }
    }
}

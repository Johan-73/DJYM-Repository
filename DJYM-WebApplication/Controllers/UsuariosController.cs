using DJYM_WebApplication.DTOs;
using DJYM_WebApplication.Models;
using DJYM_WebApplication.Servicios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace DJYM_WebApplication.Controllers
{
    [RoutePrefix("api/Usuarios")]
    public class UsuariosController : ApiController
    {
        [HttpPost]
        [Route("Insertar")]
        public Resultado<USUARIO> Insertar([FromBody] USUARIO usuario) 
        {
            SrvUsuario srvUsuario = new SrvUsuario(usuario);
            return srvUsuario.Insertar();
        }

        [HttpGet]
        [Route("ConsultarXId")]
        public Resultado<USUARIO> ConsultarXId([FromBody] USUARIO usuario)
        {
            SrvUsuario srvUsuario = new SrvUsuario(usuario);
            return srvUsuario.ConsultarXId();
        }

        [HttpGet]
        [Route("Consultar")]
        public Resultado<IQueryable> Consultar()
        {
            SrvUsuario srvUsuario = new SrvUsuario();
            return srvUsuario.Consultar();
        }

        [HttpPut]
        [Route("Actualizar")]
        public Resultado<USUARIO> Actualizar([FromBody] USUARIO usuario)
        {
            SrvUsuario srvUsuario = new SrvUsuario(usuario);
            return srvUsuario.Actualizar();
        }

        [HttpDelete]
        [Route("Eliminar")]
        public Resultado<USUARIO> Eliminar([FromBody] USUARIO usuario)
        {
            SrvUsuario srvUsuario = new SrvUsuario(usuario);
            return srvUsuario.Eliminar();
        }
    }
}
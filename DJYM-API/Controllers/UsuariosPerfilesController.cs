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
    [RoutePrefix("api/UsuariosPerfiles")]
    public class UsuariosPerfilesController : ApiController
    {
        [HttpPost]
        [Route("Insertar")]
        public Resultado<USUARIO_PERFIL> Insertar([FromBody] USUARIO_PERFIL usuarioPerfil, DBSuper_DJYMEntities context)
        {
            SrvUsuarioPerfil servicio = new SrvUsuarioPerfil(usuarioPerfil, context);
            return servicio.Insertar();
        }

        [HttpGet]
        [Route("ConsultarXId")]
        public Resultado<USUARIO_PERFIL> ConsultarXId([FromBody] USUARIO_PERFIL usuarioPerfil, DBSuper_DJYMEntities context)
        {
            SrvUsuarioPerfil servicio = new SrvUsuarioPerfil(usuarioPerfil, context);
            return servicio.ConsultarXId();
        }
         
        [HttpGet]
        [Route("Consultar")]
        public Resultado<IQueryable> Consultar()
        {
            SrvUsuarioPerfil servicio = new SrvUsuarioPerfil();
            return servicio.Consultar();
        }

        [HttpPut]
        [Route("Actualizar")]
        public Resultado<USUARIO_PERFIL> Actualizar([FromBody] USUARIO_PERFIL usuarioPerfil, DBSuper_DJYMEntities context)
        {
            SrvUsuarioPerfil servicio = new SrvUsuarioPerfil(usuarioPerfil, context);
            return servicio.Actualizar();
        }

        [HttpDelete]
        [Route("Eliminar")]
        public Resultado<USUARIO_PERFIL> Eliminar([FromBody] USUARIO_PERFIL usuarioPerfil, DBSuper_DJYMEntities context)
        {
            SrvUsuarioPerfil servicio = new SrvUsuarioPerfil(usuarioPerfil, context);
            return servicio.Eliminar();
        }
    }
}

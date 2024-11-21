using DJYM_WebApplication.DTOs;
using DJYM_WebApplication.Models;
using DJYM_WebApplication.Servicios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.Http;

namespace DJYM_WebApplication.Controllers
{
    [RoutePrefix("api/Usuarios")]
    public class UsuariosController : ApiController
    {
        [HttpPost]
        [Route("IniciarSesion")]
        public Resultado<string> IniciarSesion([FromBody] USUARIO usuario)
        {
            try
            {
                SrvUsuario srvUsuario = new SrvUsuario(usuario);
                return srvUsuario.IniciarSesion();
            }
            catch (Exception ex)
            {
                return new Resultado<string>(ex.Message);
            }
        }

        [HttpPost]
        [Route("Insertar")]
        public Resultado<USUARIO> Insertar([FromBody] USUARIO usuario) 
        {
            SrvUsuario servicio = new SrvUsuario(usuario);
            return servicio.Insertar();
        }

        [HttpGet]
        [Route("ConsultarXId")]
        public Resultado<USUARIO> ConsultarXId([FromBody] USUARIO usuario)
        {
            SrvUsuario servicio = new SrvUsuario(usuario);
            return servicio.ConsultarXId();
        }

        [HttpGet]
        [Route("Consultar")]
        public Resultado<IQueryable> Consultar()
        {
            SrvUsuario servicio = new SrvUsuario();
            return servicio.Consultar();
        }

        [HttpPut]
        [Route("Actualizar")]
        public Resultado<USUARIO> Actualizar([FromBody] USUARIO usuario)
        {
            SrvUsuario servicio = new SrvUsuario(usuario);
            return servicio.Actualizar();
        }

        [HttpDelete]
        [Route("Eliminar")]
        public Resultado<USUARIO> Eliminar([FromBody] USUARIO usuario)
        {
            SrvUsuario servicio = new SrvUsuario(usuario);
            return servicio.Eliminar();
        }
    }
}
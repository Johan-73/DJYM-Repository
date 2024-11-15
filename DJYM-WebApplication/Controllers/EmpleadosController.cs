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
    [RoutePrefix("api/Empleados")]
    public class EmpleadosController : ApiController
    {
        [HttpPost]
        [Route("Insertar")]
        public Resultado<EMPLEADO> Insertar([FromBody] EMPLEADO empleado) 
        {
            SrvEmpleado srvEmpleado = new SrvEmpleado(empleado);
            return srvEmpleado.Insertar();
        }

        [HttpGet]
        [Route("ConsultarXId")]
        public Resultado<EMPLEADO> ConsultarXId([FromBody] EMPLEADO empleado)
        {
            SrvEmpleado srvEmpleado = new SrvEmpleado(empleado);
            return srvEmpleado.ConsultarXId();
        }

        [HttpGet]
        [Route("Consultar")]
        public Resultado<IQueryable> Consultar()
        {
            SrvEmpleado srvEmpleado = new SrvEmpleado();
            return srvEmpleado.Consultar();
        }

        [HttpPut]
        [Route("Actualizar")]
        public Resultado<EMPLEADO> Actualizar([FromBody] EMPLEADO empleado)
        {
            SrvEmpleado srvEmpleado = new SrvEmpleado(empleado);
            return srvEmpleado.Actualizar();
        }

        [HttpDelete]
        [Route("Eliminar")]
        public Resultado<EMPLEADO> Eliminar([FromBody] EMPLEADO empleado)
        {
            SrvEmpleado srvEmpleado = new SrvEmpleado(empleado);
            return srvEmpleado.Eliminar();
        }
    }
}
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
    public class SrvUsuarioPerfil
    {
        private readonly DBSuper_DJYMEntities DJYM;
        private readonly USUARIO_PERFIL UsuarioPerfil;

        public SrvUsuarioPerfil() { DJYM = new DBSuper_DJYMEntities(); }

        public SrvUsuarioPerfil(USUARIO_PERFIL UsuarioPerfil, DBSuper_DJYMEntities context)
        {
            DJYM = context;
            this.UsuarioPerfil = UsuarioPerfil;
        }

        public Resultado<USUARIO_PERFIL> Insertar()
        {
            try
            {
                USUARIO usuario = new USUARIO { Id = UsuarioPerfil.IdUsuario };
                Resultado<USUARIO> resultadoUsuario = new SrvUsuario(usuario).ConsultarXId();

                PERFIL perfil = new PERFIL { Id = UsuarioPerfil.IdPerfil };
                Resultado<PERFIL> resultadoPerfil = new SrvPerfil(perfil).ConsultarXId();

                if (!resultadoUsuario.Exito || !resultadoPerfil.Exito)
                {
                    string mensajeError = "Usuario o perfil no existen en la base de datos";
                    return new Resultado<USUARIO_PERFIL>(mensajeError);
                }

                UsuarioPerfil.PERFIL = resultadoPerfil.Value;
                UsuarioPerfil.USUARIO = resultadoUsuario.Value;
                DJYM.Set<USUARIO_PERFIL>().Add(UsuarioPerfil);
                DJYM.SaveChanges();

                string mensajeExito = $"El {typeof(USUARIO_PERFIL).Name} se insertó correctamente de la tabla intermedia";
                return new Resultado<USUARIO_PERFIL>(UsuarioPerfil) { MensajeExito = mensajeExito };
            }
            catch (Exception ex)
            {
                return new Resultado<USUARIO_PERFIL>(ex.Message);
            }
        }

        public Resultado<USUARIO_PERFIL> ConsultarXId()
        {
            try
            {
                USUARIO_PERFIL entitidadConsultada = DJYM.Set<USUARIO_PERFIL>().Find(UsuarioPerfil.IdPerfil, UsuarioPerfil.IdUsuario);

                if (entitidadConsultada == null)
                {
                    string mensajeError = $"{typeof(USUARIO_PERFIL).Name} no existe en la base de datos";
                    return new Resultado<USUARIO_PERFIL>(mensajeError);
                }
                string mensajeExito = $"{typeof(USUARIO_PERFIL).Name} se consultó exitosamente";
                return new Resultado<USUARIO_PERFIL>(entitidadConsultada) { MensajeExito = mensajeExito };
            }
            catch (Exception ex)
            {
                return new Resultado<USUARIO_PERFIL>(ex.Message);
            }
        }

        public Resultado<IQueryable> Consultar()
        {
            try
            {
                string mensajeExito = $"L@s {typeof(USUARIO_PERFIL).Name}S se consultaron exitosamente";
                IQueryable entidadesQueryable = DJYM.Set<USUARIO_PERFIL>().AsQueryable();
                return new Resultado<IQueryable>(entidadesQueryable) { MensajeExito = mensajeExito };
            }
            catch (Exception ex)
            {
                return new Resultado<IQueryable>(ex.Message);
            }
        }

        public Resultado<USUARIO_PERFIL> Actualizar()
        {
            try
            {
                Resultado<USUARIO_PERFIL> resultado = ConsultarXId();
                if (!resultado.Exito)
                    return resultado;

                DJYM.Set<USUARIO_PERFIL>().AddOrUpdate(UsuarioPerfil);
                DJYM.SaveChanges();

                string mensajeExito = $"{typeof(USUARIO_PERFIL).Name} se actualizó exitosamente";
                return new Resultado<USUARIO_PERFIL>(UsuarioPerfil) { MensajeExito = mensajeExito };
            }
            catch (Exception ex)
            {
                return new Resultado<USUARIO_PERFIL>(ex.Message);
            }
        }

        public Resultado<USUARIO_PERFIL> Eliminar()
        {
            try
            {
                var registro = DJYM.Set<USUARIO_PERFIL>().FirstOrDefault(up =>
                    up.IdPerfil == UsuarioPerfil.IdPerfil &&
                    up.IdUsuario == UsuarioPerfil.IdUsuario);

                if (registro == null)
                {
                    string mensajeError = $"No se encontró un registro {typeof(USUARIO_PERFIL).Name} con IdPerfil={UsuarioPerfil.IdPerfil} e IdUsuario={UsuarioPerfil.IdUsuario}";
                    return new Resultado<USUARIO_PERFIL>(mensajeError);
                }

                DJYM.Set<USUARIO_PERFIL>().Remove(registro);
                DJYM.SaveChanges();

                string mensajeExito = $"El {typeof(USUARIO_PERFIL).Name} se eliminó correctamente de la tabla intermedia";
                return new Resultado<USUARIO_PERFIL>(registro) { MensajeExito = mensajeExito };
            }
            catch (Exception ex)
            {
                return new Resultado<USUARIO_PERFIL>(ex.Message);
            }
        }

    }
}
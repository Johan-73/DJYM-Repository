using DJYM_WebApplication.DTOs;
using DJYM_WebApplication.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;

namespace DJYM_WebApplication.Servicios
{
    public class SrvPerfil
    {
		private readonly DBSuper_DJYMEntities DJYM;
        public PERFIL Perfil { get; set; }

		public SrvPerfil()
		{
			DBSuper_DJYMEntities DJYM = new DBSuper_DJYMEntities();
		}

		public Resultado<PERFIL> Insertar()
        {
			try
			{
				PERFIL perfilInsertado = DJYM.DbSet_PERFIL.Add(Perfil);
				DJYM.SaveChanges();

				string mensajeExito = "El perfil se insertó exitosamene";
                Resultado<PERFIL> resultado = new Resultado<PERFIL>(perfilInsertado)
                {
                    MensajeExito = mensajeExito
                };
                return resultado;

            }
			catch (Exception ex)
			{
				return new Resultado<PERFIL>(ex.Message);
			}
        }

		public Resultado<PERFIL> ConsultarXId()
		{
			try
			{
                PERFIL perfilConsultado = DJYM.DbSet_PERFIL.FirstOrDefault(perfilDB => perfilDB.Id == Perfil.Id);
                string mensajeExito = "El perfil se consultó exitosamente";
                Resultado<PERFIL> resultado = new Resultado<PERFIL>(perfilConsultado)
                {
                    MensajeExito = mensajeExito
                };
				return resultado;
            }
			catch(Exception ex)
			{
				return new Resultado<PERFIL>(ex.Message);
			}
		}

		public Resultado<IQueryable<PERFIL>> Consultar()
		{
			try
			{
                IQueryable<PERFIL> perfilQueryable = DJYM.DbSet_PERFIL.AsQueryable();
				string mensajeExitoso = "Los perfiles se consultaron exitosamene ";
				Resultado<IQueryable<PERFIL>> resultado = new Resultado<IQueryable<PERFIL>>(perfilQueryable)
				{
					MensajeExito = mensajeExitoso
				};
				return resultado;
            }
			catch(Exception ex)
			{
				return new Resultado<IQueryable<PERFIL>>(ex.Message);
			}
		}

		public Resultado<PERFIL> Actualizar()
		{
			try
			{
                Resultado<PERFIL> resultadoPerfilConsultado = ConsultarXId(); 
                if (resultadoPerfilConsultado.Exito)
				{
					DJYM.DbSet_PERFIL.AddOrUpdate(Perfil);
					DJYM.SaveChanges();

                    PERFIL perfilConsultado = ConsultarXId().Value;
                    string mensajeExitoso = "El perfil se actualizó correctamente";
					Resultado<PERFIL> resultado = new Resultado<PERFIL>(perfilConsultado)
					{
						MensajeExito = mensajeExitoso
					};
					return resultado;
                }
				else
				{
					string mensajeError = $"El perfil con Id {Perfil.Id} no existe en la base de datos";
                    return new Resultado<PERFIL>(mensajeError);
                }
			}
			catch (Exception ex)
			{
				return new Resultado<PERFIL>(ex.Message);
			}
		}

		public Resultado<PERFIL> Eliminar()
		{
			try
			{
				if (ConsultarXId() != null)
				{
					PERFIL perfilEliminado = DJYM.DbSet_PERFIL.Remove(Perfil);
					DJYM.SaveChanges();
					string mensajeExitoso = "El perfil se eliminó exitosamente";
					Resultado<PERFIL> resultado = new Resultado<PERFIL>(perfilEliminado)
					{
						MensajeExito = mensajeExitoso
					};
					return resultado;
                }
				else
				{
					string mensajeError = $"El perfil con Id {Perfil.Id} no existe en la base de datos";
					return new Resultado<PERFIL>(mensajeError);
                }
			}
			catch (Exception ex)
			{
				return new Resultado<PERFIL>(ex.Message);
			}
		}
	}
}
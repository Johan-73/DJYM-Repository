using DJYM_WebApplication.DTOs;
using DJYM_WebApplication.Interfaces;
using DJYM_WebApplication.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Linq.Expressions;
using System.Web;

namespace DJYM_WebApplication.Servicios.Comun
{
    public class CRUD<TEntidad> where TEntidad : class, IEntidadConClavePrimaria
    {
        private readonly DBSuper_DJYMEntities DJYM = new DBSuper_DJYMEntities();
		public TEntidad Entidad { get; set; }


        public Resultado<TEntidad> Insertar()
        {
			try
			{
                TEntidad entidadInsertada = DJYM.Set<TEntidad>().Add(Entidad);
				DJYM.SaveChanges();

				string mensajeExitoso = $"{typeof(TEntidad).Name} se inserta exitosamene: ";
				Resultado<TEntidad> resultado = new Resultado<TEntidad>(entidadInsertada)
				{
					MensajeExito = mensajeExitoso,
				};
				return resultado;
            }
			catch (Exception ex)
			{
				return new Resultado<TEntidad>(ex.Message);
			}
		}

		public Resultado<TEntidad> ConsultarXId()
		{
			try
			{
                TEntidad entidadConsultada = DJYM.Set<TEntidad>().Find(Entidad.ClavePrimaria);
                if (entidadConsultada != null)
                {
                    string mensajeExitoso = $"{typeof(TEntidad).Name} se consulta exitosamente";
                    Resultado<TEntidad> resultado = new Resultado<TEntidad>(entidadConsultada)
                    {
                        MensajeExito = mensajeExitoso
                    };
                    return resultado;
                }
                else
                {
                    string mensajeError = $"{typeof(TEntidad).Name} no existe en la base de datos";
                    return new Resultado<TEntidad>(mensajeError);
                }
            }
			catch (Exception ex)
			{
				return new Resultado<TEntidad>(ex.Message);
			}
		}

        public Resultado<IQueryable> Consultar()
		{
			try
			{
                IQueryable<TEntidad> entidadQueryable = DJYM.Set<TEntidad>().AsQueryable();
				string mensajeExito = $"L@s {typeof(TEntidad).Name}S se consultaron exitosamente";
				Resultado<IQueryable> resultado = new Resultado<IQueryable>(entidadQueryable)
				{
					MensajeExito = mensajeExito
				};
				return resultado;
            }
			catch (Exception ex)
			{
				return new Resultado<IQueryable>(ex.Message);
			}
		}

		public Resultado<TEntidad> Actualizar()
		{
			try
			{
				if (ConsultarXId().Exito)
				{
					DJYM.Set<TEntidad>().AddOrUpdate(Entidad);
					DJYM.SaveChanges();

                    TEntidad entidadActualizada = ConsultarXId().Value;
					string mensajeExito = $"{typeof(TEntidad).Name} se actualiza exitosamente";
					Resultado<TEntidad> resultado = new Resultado<TEntidad>(entidadActualizada)
					{
						MensajeExito = mensajeExito
					};
					return resultado;
                }
				else
				{
					string mensajeError = $"{typeof(TEntidad).Name} con identificador {Entidad.ClavePrimaria} no existe en la base de datos";
					return new Resultado<TEntidad>(mensajeError);
				}
			}
			catch (Exception ex)
			{
				return new Resultado<TEntidad>(ex.Message);
			}
		}

		public Resultado<TEntidad> Eliminar()
		{
			try
			{
				Resultado<TEntidad> resultadoEntidadConsultada = ConsultarXId();
                if (resultadoEntidadConsultada.Exito)
				{
                    TEntidad entidadConsultada = resultadoEntidadConsultada.Value;
                    TEntidad entidadEliminada = DJYM.Set<TEntidad>().Remove(entidadConsultada);
					DJYM.SaveChanges();

					string mensajeExito = $"{typeof(TEntidad).Name} se elimina exitosamente";
					Resultado<TEntidad> resultado = new Resultado<TEntidad>(entidadEliminada)
					{
						MensajeExito = mensajeExito
					};
					return resultado;
				}
				else
				{
					string mensajeError = $"{typeof(TEntidad).Name} con identificador {Entidad.ClavePrimaria} no existe en la base de datos";
					return new Resultado<TEntidad>(mensajeError);
				}
			}
			catch (Exception ex)
			{
				return new Resultado<TEntidad>(ex.Message);
			}
		}
    }
}
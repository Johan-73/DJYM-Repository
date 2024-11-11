using DJYM_WebApplication.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;

namespace DJYM_WebApplication.Servicios
{
    public class SrvPagina
    {
		private DBSuper_DJYMEntities DJYM;
        public PAGINA pagina { get; set; }

		public SrvPagina()
		{
			DBSuper_DJYMEntities DJYM = new DBSuper_DJYMEntities();
		}

		public string Insertar()
        {
			try
			{
				PAGINA paginaInsertada = DJYM.DbSet_PAGINA.Add(pagina);
				DJYM.SaveChanges();
				return $"Se grabó la pagina {paginaInsertada.Titulo} con código {paginaInsertada.Codigo}";
			}
			catch (Exception ex)
			{
				return ex.Message;
			}
        }

		public PAGINA ConsultarXId()
		{
			try
			{
				return DJYM.DbSet_PAGINA.FirstOrDefault(paginaDB => paginaDB.Codigo == pagina.Codigo);
			}
			catch(Exception ex)
			{
				return ex.Mesage;
			}
		}

		public IQueryable<PAGINA> Consultar()
		{
			try
			{
				return DJYM.DbSet_PAGINA.AsQueryable();
			}
			catch(Exception ex)
			{
				return ex.Message;
			}
		}

		public string Actualizar()
		{
			try
			{
				if (ConsultarXId() != null)
				{
					DJYM.DbSet_PAGINA.AddOrUpdate(pagina);
					DJYM.SaveChanges();
					return $"Se actualizó la pagina con código {pagina.Codigo}";
				}
				else
				{
					return $"La pagina con código {pagina.Codigo} no existe en la base de datos";
				}
			}
			catch (Exception ex)
			{
				return ex.Message;
			}
		}

		public string Eliminar()
		{
			try
			{
				if (ConsultarXId() != null)
				{
					PAGINA paginaEliminada = DJYM.DbSet_PAGINA.Remove(pagina);
					DJYM.SaveChanges();
					return $"Se eliminó la pagina {paginaEliminada.Titulo} con código: {paginaEliminada.Codigo}"; ;
				}
				else
				{
					return $"La pagina con código {pagina.Codigo} no existe en la base de datos";
				}
			}
			catch (Exception ex)
			{
				return ex.Message;
			}
		}
	}
}
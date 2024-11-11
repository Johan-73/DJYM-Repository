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
		private DBSuper_DJYMEntities DJYM;
        public PERFIL perfil { get; set; }

		public Srv()
		{
			DBSuper_DJYMEntities DJYM = new DBSuper_DJYMEntities();
		}

		public string Insertar()
        {
			try
			{
				PERFIL perfilInsertado = DJYM.DbSet_PERFIL.Add(perfil);
				DJYM.SaveChanges();
				return $"Se grabó el perfil {perfilInsertado.Nombre} con Id: {perfilInsertado.Id}";
			}
			catch (Exception ex)
			{
				return ex.Message;
			}
        }

		public PERFIL ConsultarXId()
		{
			try
			{
				return DJYM.DbSet_PERFIL.FirstOrDefault(perfilDB => perfilDB.Id == perfil.Id);
			}
			catch(Exception ex)
			{
				return ex.Mesage;
			}
		}

		public IQueryable<PERFIL> Consultar()
		{
			try
			{
				return DJYM.DbSet_PERFIL.AsQueryable();
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
					DJYM.DbSet_PERFIL.AddOrUpdate(perfil);
					DJYM.SaveChanges();
					return $"Se actualizó el perfil con id {perfil.Id}";
				}
				else
				{
					return $"El perfil con Id {perfil.Id} no existe en la base de datos";
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
					PERFIL perfilEliminado = DJYM.DbSet_PERFIL.Remove(perfil);
					DJYM.SaveChanges();
					return $"Se eliminó el perfil {perfilEliminado.Nombre} con Id: {perfilEliminado.Id}"; ;
				}
				else
				{
					return $"El perfil con Id {perfil.Id} no existe en la base de datos";
				}
			}
			catch (Exception ex)
			{
				return ex.Message;
			}
		}
	}
}
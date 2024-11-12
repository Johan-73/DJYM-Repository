using DJYM_WebApplication.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;

namespace DJYM_WebApplication.Servicios
{
    public class SrvUsuario
    {
		private DBSuper_DJYMEntities DJYM;
        public USUARIO usuario { get; set; }

		public SrvUsario()
		{
			DBSuper_DJYMEntities DJYM = new DBSuper_DJYMEntities();
		}

		public string Insertar()
        {
			try
			{
				PERFIL usuarioInsertado = DJYM.DbSet_USUARIO.Add(usuario);
				DJYM.SaveChanges();
				return $"Se grabó el usuario {usuarioInsertado.Nombre} con Id: {usuarioInsertado.Id}";
			}
			catch (Exception ex)
			{
				return ex.Message;
			}
        }

		public USUARIO ConsultarXId()
		{
			try
			{
				return DJYM.DbSet_USUARIO.FirstOrDefault(usuarioDB => usuarioDB.Id == usuario.Id);
			}
			catch(Exception ex)
			{
				return ex.Mesage;
			}
		}

		public IQueryable<Usuario> Consultar()
		{
			try
			{
				return DJYM.DbSet_USUARIO.AsQueryable();
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
					DJYM.DbSet_USUARIO.AddOrUpdate(usuario);
					DJYM.SaveChanges();
					return $"Se actualizó el isuario con id {usuario.Id}";
				}
				else
				{
					return $"El usuario con Id {usuario.Id} no existe en la base de datos";
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
					PERFIL usuarioEliminado = DJYM.DbSet_USUARIO.Remove(usuario);
					DJYM.SaveChanges();
					return $"Se eliminó el usuario {usuarioEliminado.Nombre} con Id: {usuarioEliminado.Id}";
				}
				else
				{
					return $"El usuario con Id {usuario.Id} no existe en la base de datos";
				}
			}
			catch (Exception ex)
			{
				return ex.Message;
			}
		}
	}
}
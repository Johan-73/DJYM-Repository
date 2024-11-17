using DJYM_WebApplication.Models;
using DJYM_WebApplication.Servicios.Comun;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DJYM_WebApplication.Servicios
{
    public class SrvPaginaPerfil
    {
        private readonly DBSuper_DJYMEntities DJYM;
        private readonly PAGINA Pagina;
        private readonly PERFIL Perfil;

        public SrvPaginaPerfil(int codigoPagina, int idPerfil)
        {
            DJYM = new DBSuper_DJYMEntities();
            Pagina = DJYM.DbSet_PAGINA.Find(codigoPagina);
            Perfil = DJYM.DbSet_PERFIL.Find(idPerfil);
        }

        public string Insertar()
        {
            try
            {
                if (Pagina == null || Perfil == null)
                    return "Página o perfil no existen en la base de datos";

                Perfil.PAGINAs.Add(Pagina);
                DJYM.SaveChanges();
                return "Página agragada al perfil correctamente";
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
                if (Pagina == null || Perfil == null)
                    return "Página o perfil no existen en la base de datos";

                if (!Perfil.PAGINAs.Contains(Pagina))
                    return "El perfil no tiene acceso a esa página";

                Perfil.PAGINAs.Remove(Pagina);
                DJYM.SaveChanges();
                return "La página ha sido eliminada de perfil exitosamente";
            }
            catch (Exception ex) { return ex.Message; }
        }
    }
}
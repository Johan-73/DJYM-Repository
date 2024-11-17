using DJYM_WebApplication.DTOs;
using DJYM_WebApplication.Interfaces;
using DJYM_WebApplication.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;

namespace DJYM_WebApplication.Servicios.Comun
{
    public class CRUD<TEntidad> where TEntidad : class, IEntidadConClavePrimaria
    {
        private readonly DBSuper_DJYMEntities DJYM;
        public TEntidad Entidad { get; set; }
        public CRUD()
        {
            DJYM = new DBSuper_DJYMEntities();
        }

        public Resultado<TEntidad> Insertar()
        {
            try
            {
                if (ConsultarXId().Exito)
                {
                    string mensajeError = $"{typeof(TEntidad).Name} ya existe en la base de datos";
                    return new Resultado<TEntidad>(mensajeError);
                }

                DJYM.Set<TEntidad>().Add(Entidad);
                DJYM.SaveChanges();

                string mensajaExito = $"{typeof(TEntidad).Name} se insertó exitosamente";
                return new Resultado<TEntidad>(Entidad) { MensajeExito = mensajaExito };
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
                TEntidad entitidadConsultada = DJYM.Set<TEntidad>().Find(Entidad.ClavePrimaria);

                if (entitidadConsultada == null)
                {
                    string mensajeError = $"{typeof(TEntidad).Name} no existe en la base de datos";
                    return new Resultado<TEntidad>(mensajeError);
                }
                string mensajeExito = $"{typeof(TEntidad).Name} se consultó exitosamente";
                return new Resultado<TEntidad>(entitidadConsultada) { MensajeExito = mensajeExito };
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
                string mensajeExito = $"L@s {typeof(TEntidad).Name}S se consultaron exitosamente";
                IQueryable entidadesQueryable = DJYM.Set<TEntidad>().AsQueryable();
                return new Resultado<IQueryable>(entidadesQueryable) { MensajeExito = mensajeExito };
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
                Resultado<TEntidad> resultado = ConsultarXId();
                if (!resultado.Exito)
                    return resultado;

                DJYM.Set<TEntidad>().AddOrUpdate(Entidad);
                DJYM.SaveChanges();

                string mensajeExito = $"{typeof(TEntidad).Name} se actualizó exitosamente";
                return new Resultado<TEntidad>(Entidad) { MensajeExito = mensajeExito };
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
                Resultado<TEntidad> resultado = ConsultarXId();
                if (!resultado.Exito)
                    return resultado;

                DJYM.Set<TEntidad>().Remove(resultado.Value);
                DJYM.SaveChanges();

                string mensajeExito = $"{typeof(TEntidad).Name} se eliminó exitosamente";
                return new Resultado<TEntidad>(Entidad) { MensajeExito = mensajeExito };
            }
            catch (Exception ex)
            {
                return new Resultado<TEntidad>(ex.Message);
            }
        }
    }
}
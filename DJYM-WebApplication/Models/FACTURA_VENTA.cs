//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DJYM_WebApplication.Models
{
    using DJYM_WebApplication.Interfaces;
    using System;
    using System.Collections.Generic;
    
    public partial class FACTURA_VENTA : IEntidadConClavePrimaria
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public FACTURA_VENTA()
        {
            this.DETALLE_FACTURA_VENTA = new HashSet<DETALLE_FACTURA_VENTA>();
            this.REPORTE_VENTAS = new HashSet<REPORTE_VENTAS>();
        }
    
        public int Numero { get; set; }
        public Nullable<int> DocumentoCliente { get; set; }
        public Nullable<int> NumeroCajaRegistradora { get; set; }
        public Nullable<decimal> Total { get; set; }
        public Nullable<System.DateTime> Fecha { get; set; }
        public int ClavePrimaria => Numero; 

        public virtual CAJA_REGISTRADORA CAJA_REGISTRADORA { get; set; }
        public virtual CLIENTE CLIENTE { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DETALLE_FACTURA_VENTA> DETALLE_FACTURA_VENTA { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<REPORTE_VENTAS> REPORTE_VENTAS { get; set; }
    }
}

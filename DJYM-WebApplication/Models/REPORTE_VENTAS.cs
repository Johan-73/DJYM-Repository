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
    using System;
    using System.Collections.Generic;
    
    public partial class REPORTE_VENTAS
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public REPORTE_VENTAS()
        {
            this.FACTURA_VENTA = new HashSet<FACTURA_VENTA>();
        }
    
        public int NumeroReporte { get; set; }
        public Nullable<decimal> IngresosTotales { get; set; }
    
        public virtual REPORTE REPORTE { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FACTURA_VENTA> FACTURA_VENTA { get; set; }
    }
}

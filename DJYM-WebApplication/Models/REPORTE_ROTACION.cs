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
    
    public partial class REPORTE_ROTACION
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public REPORTE_ROTACION()
        {
            this.DETALLE_FACTURA_VENTA = new HashSet<DETALLE_FACTURA_VENTA>();
        }
    
        public int NumeroReporte { get; set; }
        public Nullable<int> CantidadProductosMasRotados { get; set; }
    
        public virtual REPORTE REPORTE { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DETALLE_FACTURA_VENTA> DETALLE_FACTURA_VENTA { get; set; }
    }
}

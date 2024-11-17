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
    using Newtonsoft.Json;
    using System;
    using System.Collections.Generic;
    
    public partial class PRODUCTO : IEntidadConClavePrimaria
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PRODUCTO()
        {
            this.DETALLE_FACTURA_COMPRA = new HashSet<DETALLE_FACTURA_COMPRA>();
            this.DETALLE_FACTURA_VENTA = new HashSet<DETALLE_FACTURA_VENTA>();
        }
    
        public int Codigo { get; set; }
        public Nullable<int> CodigoCategoria { get; set; }
        public string Nombre { get; set; }
        public Nullable<int> Stock { get; set; }
        public string Descripcion { get; set; }
        public Nullable<decimal> PrecioPublico { get; set; }
        public Nullable<decimal> PrecioProveedor { get; set; }
        [JsonIgnore]
        public int ClavePrimaria => Codigo;

        [JsonIgnore]
        public virtual CATEGORIA CATEGORIA { get; set; }
        [JsonIgnore]
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DETALLE_FACTURA_COMPRA> DETALLE_FACTURA_COMPRA { get; set; }
        [JsonIgnore]
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DETALLE_FACTURA_VENTA> DETALLE_FACTURA_VENTA { get; set; }
    }
}

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
    
    public partial class DETALLE_FACTURA_COMPRA
    {
        public int NumeroFacturaCompra { get; set; }
        public int CodigoProducto { get; set; }
        public Nullable<int> Cantidad { get; set; }
        public Nullable<decimal> Subtotal { get; set; }
    
        public virtual PRODUCTO PRODUCTO { get; set; }
        public virtual FACTURA_COMPRA FACTURA_COMPRA { get; set; }
    }
}
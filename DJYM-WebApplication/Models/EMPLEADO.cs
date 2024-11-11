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
    
    public partial class EMPLEADO
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public EMPLEADO()
        {
            this.FACTURA_COMPRA = new HashSet<FACTURA_COMPRA>();
            this.TURNOes = new HashSet<TURNO>();
            this.USUARIOs = new HashSet<USUARIO>();
        }
    
        public int Documento { get; set; }
        public Nullable<int> CodigoCargo { get; set; }
        public string Nombre { get; set; }
        public string Direccion { get; set; }
        public string NumeroCelular { get; set; }
        public Nullable<System.DateTime> FechaNacimiento { get; set; }
    
        public virtual CARGO CARGO { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FACTURA_COMPRA> FACTURA_COMPRA { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TURNO> TURNOes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<USUARIO> USUARIOs { get; set; }
    }
}
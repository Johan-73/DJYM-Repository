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
    
    public partial class PAGINA : IEntidadConClavePrimaria
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PAGINA()
        {
            this.PERFILs = new HashSet<PERFIL>();
        }
    
        public int Codigo { get; set; }
        public string Titulo { get; set; }
        public string URL { get; set; }
        [JsonIgnore]
        public int ClavePrimaria => Codigo;
        [JsonIgnore]
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PERFIL> PERFILs { get; set; }
    }
}

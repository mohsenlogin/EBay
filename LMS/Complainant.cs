//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LMS
{
    using System;
    using System.Collections.Generic;
    
    public partial class Complainant
    {
        public int Id { get; set; }
        public Nullable<int> PersonRef { get; set; }
        public Nullable<int> LegalPersonalityRef { get; set; }
        public Nullable<int> MunicipalityRef { get; set; }
        public int LegalDocumentRef { get; set; }
    
        public virtual LegalDocument LegalDocument { get; set; }
        public virtual LegalPersonality LegalPersonality { get; set; }
        public virtual Municipality Municipality { get; set; }
        public virtual Person Person { get; set; }
    }
}

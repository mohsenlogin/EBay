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
    
    public partial class PersonnelPost
    {
        public int Id { get; set; }
        public int PersonRef { get; set; }
        public int PostRef { get; set; }
    
        public virtual Person Person { get; set; }
        public virtual Personnel Personnel { get; set; }
        public virtual Post Post { get; set; }
    }
}
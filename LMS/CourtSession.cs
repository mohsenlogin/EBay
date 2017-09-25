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
    
    public partial class CourtSession
    {
        public int Id { get; set; }
        public int LegalDocumentRef { get; set; }
        public int AgentRef { get; set; }
        public System.DateTime CourtDate { get; set; }
        public Nullable<System.DateTime> RefereToExpertDate { get; set; }
        public string ExpertName { get; set; }
        public Nullable<System.DateTime> ExpertVerdictAnnounceDate { get; set; }
        public string FinalVerdict { get; set; }
        public Nullable<System.DateTime> FinalVerdictDate { get; set; }
        public Nullable<System.DateTime> ProtestVerdictDate { get; set; }
        public string Notes { get; set; }
        public string ReconsiderVote { get; set; }
    
        public virtual Agent Agent { get; set; }
        public virtual LegalDocument LegalDocument { get; set; }
    }
}
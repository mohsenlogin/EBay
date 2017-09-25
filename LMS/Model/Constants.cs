using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LMS.Model
{
    public class Constants
    {
        public enum ROLE_NAMES
        {
            CityAfairs
        }
        public struct ROLES
        {
            public static string LegalAgent = "کارشناس حقوقی";
            public static string CityAfairs = "کارشناس دفتر امور شهری";
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LMS.Controller
{
    public class Membership
    {
        private static LMSEntitiy lmsEntity = new LMSEntitiy();
        public static usp_getUserInfo_Result checkLogin(string username, string token)
        {
            return lmsEntity.usp_getUserInfo(username, token).FirstOrDefault();
            //return lmsEntity.User.Where(u=>u.Username == username && u.Pass == token).SingleOrDefault();            
        }
        public static List<UserRole> getRoles(int userId)
        {           
            return lmsEntity.UserRole.Where(ur => ur.UserRef == userId).ToList();
        }
        public static bool hasAccessToUrl(List<UserRole> roles, string url)
        {
            foreach(var userRole in roles){
                if (lmsEntity.RoleAccess.Where(ra => ra.RoleRef == userRole.Id && ra.PageUrl == url).SingleOrDefault() != null)
                {
                    return true;
                }
            }
            return false;            
        }
        public static User getUser(int id)
        {
            return lmsEntity.User.Where(u => u.Id == id).SingleOrDefault();
        }
        
    }
}
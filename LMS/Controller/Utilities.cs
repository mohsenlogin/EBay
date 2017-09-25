using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;

namespace LMS.Controller
{
    public class Utilities
    {
        public static DateTime convertPersianDateToGeorgian(string persianDate)
        {
            PersianCalendar persianCalendar = new PersianCalendar();
            char[] separator = {'/'};
            if (!string.IsNullOrEmpty(persianDate))
            {
                string[] dateParts = persianDate.Split(separator);
                if (dateParts.Length == 3)
                {
                    try
                    {
                        int year = int.Parse(dateParts[0]);
                        int month = int.Parse(dateParts[1]);
                        int day = int.Parse(dateParts[2]);
                        return new DateTime(year, month, day, persianCalendar);
                    }
                    catch (Exception e)
                    {
                        throw e;
                    }
                }
                else
                {
                    //error
                    throw new Exception("Jalali Date Format is not correcct");
                }
            }  else
            {
                //error
                throw new Exception("Jalali Date Format is not correcct");
            }
            
           
        }
        public static string convertGeorgianDateToPersian(DateTime dateTime)
        {            
            PersianCalendar pc = new PersianCalendar();
            return (string.Format("{0}/{1}/{2} {3}:{4}:{5}", pc.GetYear(dateTime), pc.GetMonth(dateTime), pc.GetDayOfMonth(dateTime),dateTime.Hour,dateTime.Minute,dateTime.Second));
        }
        public static string convertGeorgianDateToPersian(string dateTime)
        {
            DateTime dtDateTime = DateTime.Now;
            if (!string.IsNullOrEmpty(dateTime) && dateTime != "")
            {
                dtDateTime = DateTime.Parse(dateTime);
            }
            return convertGeorgianDateToPersian(dtDateTime);
        }
       
    }
}
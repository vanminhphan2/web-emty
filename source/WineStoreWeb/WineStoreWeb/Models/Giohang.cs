using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WineStoreWeb.Models
{
    public class Giohang
    {
        dbQLBANRUOUDataContext data = new dbQLBANRUOUDataContext();
        public int iMaRuou { set; get; }
        public string sTenRuou { set; get; }
        public string sAnhRuou { set; get; }
        public Double dGiaban { set; get; }
        public int iSoluong { set; get; }
        public Double dThanhtien { get { return iSoluong * dGiaban; } } 
        public Giohang(int MaRuou)
        {
            iMaRuou = MaRuou;
            RUOU ruou = data.RUOUs.Single(n => n.MaRuou == iMaRuou);
            sTenRuou = ruou.TenRuou;
            sAnhRuou = ruou.AnhRuou;
            dGiaban = double.Parse(ruou.Giaban.ToString());
            iSoluong = 1;
            
        }
    }
}
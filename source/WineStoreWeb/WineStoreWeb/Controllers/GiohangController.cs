using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WineStoreWeb.Models;

namespace WineStoreWeb.Controllers
{
    public class GiohangController : Controller
    {
        dbQLBANRUOUDataContext data = new dbQLBANRUOUDataContext();
        // GET: Giohang
        public List<Giohang> Laygiohang()
        {
            List<Giohang> Lstgiohang = Session["Giohang"] as List<Giohang>;
            if (Lstgiohang == null)
            {
                Lstgiohang = new List<Giohang>();
                Session["Giohang"] = Lstgiohang;
            }
            return Lstgiohang;
        }
        public ActionResult ThemGiohang(int iMaRuou, string strUrl)
        {
            List<Giohang> Lstgiohang = Laygiohang();
            Giohang sanpham = Lstgiohang.Find(n => n.iMaRuou == iMaRuou);
            if (sanpham == null)
            {
                sanpham = new Giohang(iMaRuou);
                Lstgiohang.Add(sanpham);
                return Redirect(strUrl);

            }
            else
            {
                sanpham.iSoluong++;
                return Redirect(strUrl);
            }
        }
        private int Tongsoluong()
        {
            int iTongsoluong = 0;
            List<Giohang> Lstgiohang = Session["Giohang"] as List<Giohang>;
            if (Lstgiohang!=null){
                iTongsoluong = Lstgiohang.Sum(n => n.iSoluong);

            }
            return iTongsoluong;
        }
        private double Tongtien()
        {
            double iTongtien = 0;
            List<Giohang> Lstgiohang = Session["Giohang"] as List<Giohang>;
            if (Lstgiohang != null)
            {
                iTongtien = Lstgiohang.Sum(n => n.dThanhtien);

            }
            return iTongtien;
        }
        public ActionResult Giohang()
        {
            List<Giohang> lstGiohang = Laygiohang();
            if (lstGiohang.Count == 0)
            {
                return RedirectToAction("Index", "WineStore");
            }
            ViewBag.Tongsoluong = Tongsoluong();
            ViewBag.Tongtien = Tongtien();
            return View(lstGiohang);
        }
        public ActionResult GiohangPartial()
        {
            ViewBag.Tongsoluong = Tongsoluong();
            ViewBag.Tongtien = Tongtien();
            return PartialView();
        }
        public ActionResult XoaGiohang(int iMaSP)
        {
            List<Giohang> lstGiohang = Laygiohang();
            Giohang sanphan = lstGiohang.SingleOrDefault(n => n.iMaRuou == iMaSP);
            if (sanphan != null)
            {
                lstGiohang.RemoveAll(n => n.iMaRuou == iMaSP);
                return RedirectToAction("Giohang");
            }
            if (lstGiohang.Count == 0)
            {
                return RedirectToAction("Index", "WineStore");
            }
            return RedirectToAction("Giohang");
        }
        public ActionResult CapnhatGiohang(int iMaSP, FormCollection f)
        {
            List<Giohang> lstGiohang = Laygiohang();
            Giohang sanphan = lstGiohang.SingleOrDefault(n => n.iMaRuou == iMaSP);
            if (sanphan != null)
            {
                sanphan.iSoluong = int.Parse(f["txtSoluong"].ToString());
            }
            
            return RedirectToAction("Giohang");
        }
        public ActionResult XoatatcaGiohang()
        {
            List<Giohang> lstGiohang = Laygiohang();
            lstGiohang.Clear();
            return RedirectToAction("Index", "WineStore");
          
        }
        [HttpGet]
        public ActionResult Dathang()
        {
            if(Session["Taikhoan"] == null || Session["Taikhoan"].ToString() == "")
            {
                    return RedirectToAction("Dangnhap", "Nguoidung");
             }
                if (Session["Giohang"] == null)
                {
                    return RedirectToAction("Index", "WineStore");
                }
            List<Giohang> lstGiohang = Laygiohang();
            
            ViewBag.Tongsoluong = Tongsoluong();
            ViewBag.Tongtien = Tongtien();
            return View(lstGiohang);
        }
        public ActionResult Dathang(FormCollection collection)
        {
            DONDATHANG ddh = new DONDATHANG();
            KHACHHANG kh = (KHACHHANG)Session["Taikhoan"];
            List<Giohang> gh = Laygiohang();
            ddh.MaKH = kh.MaKH;
            ddh.Ngaydat = DateTime.Now;
            var ngaygiao = String.Format("{0:MM/dd/yyyy}", collection["Ngaygiao"]);
            ddh.Ngaygiao= DateTime.Parse(ngaygiao);
            ddh.Tinhtranggiaohang = false;
            ddh.Dathanhtoan = false;
            data.DONDATHANGs.InsertOnSubmit(ddh);
            data.SubmitChanges();
            foreach(var item in gh)
            {
                CHITIETDONTHANG ctdh = new CHITIETDONTHANG();
                ctdh.MaDonHang = ddh.MaDonHang;
                ctdh.MaRuou = item.iMaRuou;
                ctdh.Soluong = item.iSoluong;
                ctdh.Dongia = (decimal)item.dGiaban;
                data.CHITIETDONTHANGs.InsertOnSubmit(ctdh);
            }
            data.SubmitChanges();
            Session["Giohang"] = null;
            return RedirectToAction("Xacnhandonhang","Giohang");
        }
        public ActionResult Xacnhandonhang()
        {
            return View();
        }

    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WineStoreWeb.Models;

namespace WineStoreWeb.Controllers
{
    public class NguoidungController : Controller
    {

        dbQLBANRUOUDataContext data = new dbQLBANRUOUDataContext();
        // GET: Nguoidung
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Dangky()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Dangky(FormCollection collection, KHACHHANG kh)
        {
            var hoten = collection["HotenKH"];
            var tenDN = collection["TenDN"];
            var matkhau = collection["Matkhau"];
            var matkhaunhaplai = collection["Matkhaunhaplai"];
            var email = collection["Email"];
            var diachi = collection["Diachi"];
            var dienthoai = collection["Dienthoai"];
            var ngaysinh = String.Format("{0:MM/dd/yyyy}", collection["Ngaysinh"]);
            if(String.IsNullOrEmpty(hoten))
            {
                ViewData["Loi1"] = "Họ tên khách hàng không được để trống";
            }
            if (String.IsNullOrEmpty(tenDN))
            {
                ViewData["Loi2"] = "Phải nhập tên đăng nhập";
            }
            if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi3"] = "Phải nhập mật khẩu";
            }
            if (String.IsNullOrEmpty(email))
                if (String.IsNullOrEmpty(matkhaunhaplai))
            {
                ViewData["Loi4"] = "Phải nhập lại mật khẩu";
            }
            if (String.IsNullOrEmpty(email))
            {
                ViewData["Loi5"] = "Trống Email";
            }
            if (String.IsNullOrEmpty(diachi))
            {
                ViewData["Loi6"] = "Vui lòng nhập địa chỉ";
            }
            if (String.IsNullOrEmpty(dienthoai))
            {
                ViewData["Loi7"] = "Nhập số điện thoại";
            }
            if (String.IsNullOrEmpty(ngaysinh))
            {
                ViewData["Loi8"] = "Nhập ngày sinh";
            }
            else
            {
                kh.HoTen = hoten;
                kh.Taikhoan = tenDN;
                kh.Matkhau = matkhau;
                kh.Email = email;
                kh.DiachiKH = diachi;
                kh.DienthoaiKH = dienthoai;
                kh.Ngaysinh = DateTime.Parse(ngaysinh);
                data.KHACHHANGs.InsertOnSubmit(kh);
                data.SubmitChanges();
                return RedirectToAction("Dangnhap");
            }
           

            return this.Dangky();
        }
        [HttpGet]
        public ActionResult Dangnhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Dangnhap(FormCollection collection)
        {
            var tenDN = collection["TenDN"];
            var matkhau = collection["Matkhau"];
            if (String.IsNullOrEmpty(tenDN))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập";
            }
            else
                 if (String.IsNullOrEmpty(matkhau))
                  {
                       ViewData["Loi2"] = "Phải nhập mật khẩu";
                  }
                  else
                  {
                          KHACHHANG kh = data.KHACHHANGs.SingleOrDefault(n => n.Taikhoan == tenDN && n.Matkhau == matkhau);
                           if(kh!=null){
                                  ViewBag.Thongbao = "Chúc mừng đăng nhập thành công";
                                   Session["Taikhoan"] = kh;

                                    return RedirectToAction("Index", "WineStore");
                }
                           else
                                 ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không đúng!";
                  }   
            return View();
        }
        public ActionResult Dangxuat()
        {
            Session["Taikhoan"] = null;
            return RedirectToAction("Index", "WineStore");
        }
    }
}
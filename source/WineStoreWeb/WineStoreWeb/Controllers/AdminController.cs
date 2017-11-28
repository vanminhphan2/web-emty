using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WineStoreWeb.Models;
using PagedList;
using PagedList.Mvc;
using System.IO;
using System.Web.UI.WebControls.WebParts;

namespace WineStoreWeb.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin

        dbQLBANRUOUDataContext data = new dbQLBANRUOUDataContext();
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Login()
        {
            
            return View();
        }
    [HttpPost]
    public ActionResult Login(FormCollection collection)
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
                TAIKHOANADMIN kh = data.TAIKHOANADMINs.SingleOrDefault(n => n.Tentaikhoan == tenDN && n.Matkhau == matkhau);
                if (kh != null)
                {
                    ViewBag.Thongbao = "Chúc mừng đăng nhập thành công";
                    Session["TaikhoanAdmin"] = kh;

                    return RedirectToAction("Index", "WineStore");
                }
                else
                    ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không đúng!";
            }
            return View();
        }
        public ActionResult Dangxuat()
        {
            Session["TaikhoanAdmin"] = null;
            return RedirectToAction("Index", "WineStore");
        }
        public ActionResult Ruou(int ? page)
        {
            int pagenumber = (page ?? 1);
            int pagesize = 10;
            return View(data.RUOUs.ToList().OrderBy(n=>n.MaRuou).ToPagedList(pagenumber,pagesize));
        }
        public ActionResult NhaSanXuat(int? page)
        {
            int pagenumber = (page ?? 1);
            int pagesize = 10;
            return View(data.NHASANXUATs.ToList().OrderBy(n => n.MaNSX).ToPagedList(pagenumber, pagesize));
        }
        [HttpGet]
        public ActionResult ThemRuoumoi()
        {
            ViewBag.MaLoaiRuou = new SelectList(data.LOAIRUOUs.ToList().OrderBy(n => n.TenLoaiRuou), "MaLoaiRuou", "TenLoaiRuou");
            ViewBag.MaNSX = new SelectList(data.NHASANXUATs.ToList().OrderBy(n => n.TenNSX), "MaNSX", "TenNSX");
            ViewBag.MaNNK = new SelectList(data.NUOCNHAPKHAUs.ToList().OrderBy(n => n.TenNNK), "MaNNK", "TenNNK");
           // ViewBag.Vip = new SelectList("0","1","2");


            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ThemRuoumoi(RUOU ruou, HttpPostedFileBase fileUpload)
        {
            ViewBag.MaLoaiRuou = new SelectList(data.LOAIRUOUs.ToList().OrderBy(n => n.TenLoaiRuou), "MaLoaiRuou", "TenLoaiRuou");
            ViewBag.MaNSX = new SelectList(data.NHASANXUATs.ToList().OrderBy(n => n.TenNSX), "MaNSX", "TenNSX");
            ViewBag.MaNNK = new SelectList(data.NUOCNHAPKHAUs.ToList().OrderBy(n => n.TenNNK), "MaNNK", "TenNNK");
           // ViewBag.Vip = new SelectList("0", "1","2");
            if (fileUpload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn hình ảnh rượu";
                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    var path = Path.Combine(Server.MapPath("~/images/"), fileName);
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                    }
                    else
                    {
                        fileUpload.SaveAs(path);
                    }

                    ruou.AnhRuou = fileName;
                    data.RUOUs.InsertOnSubmit(ruou);
                    data.SubmitChanges();
                }

                return RedirectToAction("Ruou");
            }
        }
        public ActionResult Chitietruou(int id)
        {
            RUOU ruou = data.RUOUs.SingleOrDefault(n => n.MaRuou == id);
            ViewBag.Maruou = ruou.MaRuou;
            if (ruou == null)
            {
                Response.StatusCode = 404;
                return null;

            }
            return View(ruou);
        }
        public ActionResult ChitietNSX(int id)
        {
            NHASANXUAT NSX = data.NHASANXUATs.SingleOrDefault(n => n.MaNSX == id);
            ViewBag.MaNSX = NSX.MaNSX;
            if (NSX == null)
            {
                Response.StatusCode = 404;
                return null;

            }
            return View(NSX);
        }
        [HttpGet]
        public ActionResult XoaNSX(int id)
        {
            NHASANXUAT NSX = data.NHASANXUATs.SingleOrDefault(n => n.MaNSX == id);
            ViewBag.Maruou = NSX.MaNSX;
            if (NSX == null)
            {
                Response.StatusCode = 404;
                return null;

            }
            return View(NSX);
        }
        [HttpPost, ActionName("Xoaruou")]
        public ActionResult XacnhanxoaNSX(int id)
        {
            NHASANXUAT NSX = data.NHASANXUATs.SingleOrDefault(n => n.MaNSX == id);
            ViewBag.Maruou = NSX.MaNSX;
            if (NSX == null)
            {
                Response.StatusCode = 404;
                return null;

            }
            data.NHASANXUATs.DeleteOnSubmit(NSX);
            data.SubmitChanges();
            return RedirectToAction("NSX");
        }
        [HttpGet]
        public ActionResult Xoaruou(int id)
        {
            RUOU ruou = data.RUOUs.SingleOrDefault(n => n.MaRuou == id);
            ViewBag.Maruou = ruou.MaRuou;
            if (ruou == null)
            {
                Response.StatusCode = 404;
                return null;

            }
            return View(ruou);
        }
        [HttpPost,ActionName("Xoaruou")]
        public ActionResult Xacnhanxoa(int id)
        {
            RUOU ruou = data.RUOUs.SingleOrDefault(n => n.MaRuou == id);
            ViewBag.Maruou = ruou.MaRuou;
            if (ruou == null)
            {
                Response.StatusCode = 404;
                return null;

            }
            data.RUOUs.DeleteOnSubmit(ruou);
            data.SubmitChanges();
            return RedirectToAction("Ruou");
         }
        [HttpGet]
        public ActionResult Suaruou(int id)
        {
            RUOU ruou = data.RUOUs.SingleOrDefault(n => n.MaRuou == id);
          
            if (ruou == null)
            {
                Response.StatusCode = 404;
                return null;

            }
            ViewBag.MaLoaiRuou = new SelectList(data.LOAIRUOUs.ToList().OrderBy(n => n.TenLoaiRuou), "MaLoaiRuou", "TenLoaiRuou",ruou.MaLoaiRuou);
            ViewBag.MaNSX = new SelectList(data.NHASANXUATs.ToList().OrderBy(n => n.TenNSX), "MaNSX", "TenNSX",ruou.MaNSX);
            ViewBag.MaNNK = new SelectList(data.NUOCNHAPKHAUs.ToList().OrderBy(n => n.TenNNK), "MaNNK", "TenNNK",ruou.MaNNK);

            return View(ruou);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Suaruou(RUOU ruou, HttpPostedFileBase fileUpload)
        {
            ViewBag.MaLoaiRuou = new SelectList(data.LOAIRUOUs.ToList().OrderBy(n => n.TenLoaiRuou), "MaLoaiRuou", "TenLoaiRuou", ruou.MaLoaiRuou);
            ViewBag.MaNSX = new SelectList(data.NHASANXUATs.ToList().OrderBy(n => n.TenNSX), "MaNSX", "TenNSX",ruou.MaNSX);
            ViewBag.MaNNK = new SelectList(data.NUOCNHAPKHAUs.ToList().OrderBy(n => n.TenNNK), "MaNNK", "TenNNK",ruou.MaNNK);
            if (fileUpload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn hình ảnh rượu";
                return View();
            }
            else
            {
                if (ModelState.IsValid)
            {
                var fileName = Path.GetFileName(fileUpload.FileName);
                var path = Path.Combine(Server.MapPath("~/images/"), fileName);
                if (System.IO.File.Exists(path) == true)
                {
                    ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                }
                else
                {
                    fileUpload.SaveAs(path);
                }
                ruou.AnhRuou = fileName;
                
               UpdateModel(ruou);
                data.SubmitChanges();
            }

            return RedirectToAction("Ruou");
        }
    }

    }
}
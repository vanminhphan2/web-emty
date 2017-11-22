using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WineStoreWeb.Models;
using PagedList;
using PagedList.Mvc;
namespace WineStoreWeb.Controllers
{
    public class WineStoreController : Controller
    {
        // GET: WineStore
        dbQLBANRUOUDataContext data = new dbQLBANRUOUDataContext();
        private List<RUOU> Layruoumoi(int count)
        {
            var ruoungoai = data.RUOUs.OrderByDescending(a => a.Vip == 1).Take(5).ToList();
            return ruoungoai;
            //return data.RUOUs.OrderByDescending(a => a.Ngaycapnhat).Take(count).ToList();
        }
        public ActionResult Index()
        {
            var ruoumoi = Layruoumoi(3);
            return View(ruoumoi);
        }
        private List<RUOU> Laydsruou(int count)
        {
            return data.RUOUs.OrderByDescending(a => a.MaRuou).Take(count).ToList();
        }
        public ActionResult NuocNK()
        {
            var ruoungoai = from lr in data.NUOCNHAPKHAUs where lr.MaNNK <4 || lr.MaNNK >7 select lr; 
            return PartialView(ruoungoai);
        }
        public ActionResult Ruounoi()
        {
            var ruounoi = from lr in data.NUOCNHAPKHAUs where lr.MaNNK > 4 && lr.MaNNK <8 select lr;
            return PartialView(ruounoi);
        }
        public ActionResult LayruoutheonuocNK(int id, int ? page)
        {//tạo biến qui định trên mỗi trang
            int pageSize = 6;
            //tạo biến số trang
            int pageNum = (page ?? 1);
            var ruou = from r in data.RUOUs where r.MaNNK ==id select r;
            return View(ruou.ToPagedList(pageNum, pageSize));
        }
        public ActionResult Details(int id)
        {
            var ruou = from r in data.RUOUs where r.MaRuou== id select r;
            return View(ruou.Single());
        }
        public ActionResult Ruoumy()
        {
            var ruoungoai = data.RUOUs.OrderByDescending(a => a.MaNNK == 1).Take(3).ToList();
            return PartialView(ruoungoai);
        }
        public ActionResult RuouVN()
        {
            var ruouvn = data.RUOUs.OrderByDescending(a => a.MaNNK == 5).Take(3).ToList();
            return PartialView(ruouvn);
        }
        public ActionResult Ruounoibat1()
        {
            var ruouvn = data.RUOUs.OrderByDescending(a => a.MaNNK ==2 ).Take(1).ToList();
            return PartialView(ruouvn);
        }
        public ActionResult Ruounoibat2()
        {
            var ruouvn = data.RUOUs.OrderByDescending(a => a.MaNNK == 3).Take(1).ToList();
            return PartialView(ruouvn);
        }
        public ActionResult RuouVNnoibat()
        {
            var ruouvn = data.RUOUs.OrderByDescending(a => a.MaNNK == 5).Take(4).ToList();
            return PartialView(ruouvn);
        }
        [HttpPost]
        public ActionResult Timkiem(FormCollection f, int? page)
        {
            string keyword = f["txtTimkiem"].ToString();
           // ViewBag.Tukhoa = keyword;
            var dstimkiem = data.RUOUs.Where(n => n.TenRuou.Contains(keyword)).ToList();
            //tạo biến qui định trên mỗi trang
            int pageSize = 6;
            //tạo biến số trang
            int pageNum = (page ?? 1);
            if(dstimkiem.Count==0)
            {
                ViewBag.Thongbao = "khong tim thay san pham nao";
                return View(data.RUOUs.OrderBy(n=>n.TenRuou).ToPagedList(pageNum,pageSize));
            }

            ViewBag.Thongbao = "Da tim thấy : "+ dstimkiem.Count+ "kết quả";
            return View(dstimkiem.OrderBy(n=>n.TenRuou).ToPagedList(pageNum, pageSize));
        }
        [HttpGet]
        public ActionResult Timkiem(int? page, string keyword)
        {
            ViewBag.Tukhoa = keyword;
            var dstimkiem = data.RUOUs.Where(n => n.TenRuou.Contains(keyword)).ToList();
            //tạo biến qui định trên mỗi trang
            int pageSize = 6;
            //tạo biến số trang
            int pageNum = (page ?? 1);
            if (dstimkiem.Count == 0)
            {
                ViewBag.Thongbao = "khong tim thay san pham nao";
                return View(data.RUOUs.OrderBy(n => n.TenRuou).ToPagedList(pageNum, pageSize));
            }

            ViewBag.Thongbao = "Da tim thấy : " + dstimkiem.Count + "kết quả";
            return View(dstimkiem.OrderBy(n => n.TenRuou).ToPagedList(pageNum, pageSize));
        }
        public ActionResult timkiemruou(FormCollection f,string key)
        {
            string keyword = f["txtTimkiem"].ToString();
            // ViewBag.Tukhoa = keyword;
            var dstimkiem = data.RUOUs.Where(n => n.TenRuou.Contains(keyword)).ToList();
            //tạo biến qui định trên mỗi trang
     
            if (dstimkiem.Count == 0)
            {
                ViewBag.Thongbao = "khong tim thay san pham nao";
                return View(data.RUOUs.OrderBy(n => n.TenRuou));
            }

            ViewBag.Thongbao = "Da tim thấy : " + dstimkiem.Count + "kết quả";

            return View(data.RUOUs.OrderBy(n => n.TenRuou));
        }
        public ActionResult search(FormCollection f, int? page)
        {//tạo biến qui định trên mỗi trang
            string key =f["searchtext"].ToString();
            int pageSize = 6;
            //tạo biến số trang
            int pageNum = (page ?? 1);
            var ruou = data.RUOUs.Where(n => n.TenRuou.Contains(key)).ToList();
            return View(ruou.ToPagedList(pageNum, pageSize));
        }
    }
}
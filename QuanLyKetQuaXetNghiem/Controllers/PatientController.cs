using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyKetQuaXetNghiem.ViewModel;

namespace QuanLyKetQuaXetNghiem.Controllers
{
    public class PatientController : Controller
    {
        public EntityDataContext _context = new EntityDataContext();
        // GET: Patient
        public ActionResult Index()
        {
            //lấy tat cả bệnh nhân
            var model = _context.BenhNhans.ToList();
            return View(model);
        }
        [HttpGet]
        public ActionResult Create()
        {
            var LoaiXetNghiems = _context.LoaiXetNghiems.ToList();
            var model = new BenhNhanLoaiXetNghiemViewModel { LoaiXetNghiems = LoaiXetNghiems };
            CreateViewBag();
            //lấy tat cả bệnh nhân
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(BenhNhanLoaiXetNghiemViewModel model, List<Guid> LoaiXetNghiemIDs = null, Guid? BacSiID = null)
        {
            #region Tạo BN
            DateTime DateNow = DateTime.Now;
            Guid BenhNhanID = Guid.NewGuid();
            string MaBenhNhan = model.NamSinh.ToString("yyyy");
            Random generator = new Random();
            String six = generator.Next(0, 999999).ToString("D6");
            String six2 = generator.Next(0, 999999).ToString("D6");
            MaBenhNhan = MaBenhNhan + six;
            string SID = model.NamSinh.ToString("yy") + model.NamSinh.ToString("MM") + model.NamSinh.ToString("dd");
            SID += "." + six2;
            string SoTheBHYT = "GD487871";
            String seven = generator.Next(0, 9999999).ToString("D7");
            String five = generator.Next(0, 99999).ToString("D5");
            SoTheBHYT = SoTheBHYT + seven + "-" + five;

            var BenhNhan = new BenhNhan()
            {
                BenhNhanID = BenhNhanID,
                MaBenhNhan = MaBenhNhan,
                SID = SID,
                HoTen = model.HoTen,
                NamSinh = model.NamSinh,
                GioiTinh = model.GioiTinh,
                DiaChi = model.DiaChi,
                SoTheBHYT = SoTheBHYT,
                CreatedDate = DateNow
            };
            _context.Entry(BenhNhan).State = EntityState.Added;
            _context.SaveChanges();
            #endregion

            #region Tạo XN
            if (LoaiXetNghiemIDs != null)
            {
                //Tạo Master
                string TrangThai = "Chưa Xét Nghiệm";
                foreach (var item in LoaiXetNghiemIDs)
                {
                    Guid XetNghiemID = Guid.NewGuid();
                    var XetNghiem = new XetNghiem()
                    {
                        XetNghiemID = XetNghiemID,
                        BenhNhanID = BenhNhanID,
                        LoaiXetNghiemID = item,
                        BacSiID = BacSiID,
                        TrangThai = TrangThai,
                        CreatedDate = DateNow
                    };
                    _context.Entry(XetNghiem).State = EntityState.Added;
                }
                _context.SaveChanges();
            }
            #endregion
            return RedirectToAction("Index");
        }

        #region CreateViewBag, Helper
        public void CreateViewBag(Guid? BacSiID = null)
        {
            //Bac Si
            var BacSiList = _context.BacSis.Select(p => new
            {
                Id = p.BacSiID,
                Name = p.HoTen
            })
            .OrderByDescending(p => p.Name).ToList();
            ViewBag.BacSiIdList = new SelectList(BacSiList, "Id", "Name", BacSiID);
        }
        #endregion
    }
}
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CrystalDecisions.CrystalReports.Engine;
using QuanLyKetQuaXetNghiem.ViewModel;

namespace QuanLyKetQuaXetNghiem.Controllers
{
    public class AnalysisController : Controller
    {
        // GET: Analysis
        public EntityDataContext _context = new EntityDataContext();
        public ActionResult Index()
        {
            var model = (from xn in _context.XetNghiems
                         join bn in _context.BenhNhans on xn.BenhNhanID equals bn.BenhNhanID into result
                         from xnbn in result.DefaultIfEmpty()
                         join bs in _context.BacSis on xn.BacSiID equals bs.BacSiID into result1
                         from xnbs in result1.DefaultIfEmpty()
                         group xnbn by new
                         {
                             BacSiID = xnbs.BacSiID,
                             BenhNhanID = xnbn.BenhNhanID,
                             CreatedDate = xn.CreatedDate,
                             HoTenBacSi = xnbs.HoTen,
                             HoTenBenhNhan = xnbn.HoTen,
                         }
                         into g
                         select new XetNghiemBacSiBenhNhanViewModel()
                         {
                             BacSiID = g.Key.BacSiID,
                             BenhNhanID = g.Key.BenhNhanID,
                             CreatedDate = g.Key.CreatedDate,
                             HoTenBacSi = g.Key.HoTenBacSi,
                             HoTenBenhNhan = g.Key.HoTenBenhNhan,
                         }
                         ).ToList();
            return View(model);
        }
        [HttpGet]
        public ActionResult Edit(Guid id)
        {
            var model = (from xn in _context.XetNghiems
                         join bn in _context.BenhNhans on xn.BenhNhanID equals bn.BenhNhanID into result
                         from xnbn in result.DefaultIfEmpty()
                         where xn.BenhNhanID == id
                         select new BenhNhanViewModel()
                         {
                             BenhNhanID = xnbn.BenhNhanID,
                             HoTen = xnbn.HoTen,
                             DiaChi = xnbn.DiaChi,
                             GioiTinh = xnbn.GioiTinh,
                             MaBenhNhan = xnbn.MaBenhNhan,
                             NamSinh = xnbn.NamSinh,
                             SID = xnbn.SID,
                             SoTheBHYT = xnbn.SoTheBHYT
                         }).FirstOrDefault();


            return View(model);
        }

        public ActionResult _DetailAnalysis(Guid id)
        {
            var model = (from xn in _context.XetNghiems
                         join lxn in _context.LoaiXetNghiems on xn.LoaiXetNghiemID equals lxn.LoaiXetNghiemID into result
                         from xnlxn in result.DefaultIfEmpty()
                         where xn.BenhNhanID == id
                         select new XetNghiemBacSiBenhNhanViewModel()
                         {
                             XetNghiemID = xn.XetNghiemID,
                             LoaiXetNghiemID = xnlxn.LoaiXetNghiemID,
                             TrangThai = xn.TrangThai,
                             TenLoaiXetNghiem = xnlxn.Ten
                         }).ToList();
            return PartialView(model);
        }

        public ActionResult Analysis(Guid XetNghiemID)
        {
            var model = (from xn in _context.XetNghiems
                         join bn in _context.BenhNhans on xn.BenhNhanID equals bn.BenhNhanID into result
                         from xnbn in result.DefaultIfEmpty()
                         join lxn in _context.LoaiXetNghiems on xn.LoaiXetNghiemID equals lxn.LoaiXetNghiemID into result1
                         from xnlxn in result1.DefaultIfEmpty()
                         where xn.XetNghiemID == XetNghiemID
                         select new
                         {
                             XetNghiemID = xn.XetNghiemID,
                             HoTenBN = xnbn.HoTen,
                             TenLXN = xnlxn.Ten,
                             BenhNhanID = xnbn.BenhNhanID
                         }).FirstOrDefault();
            string TenBenhNhan = model.HoTenBN;
            string TenLXN = model.TenLXN;
            ViewBag.TenBN = TenBenhNhan;
            ViewBag.TenLXN = TenLXN;
            ViewBag.BenhNhanID = model.BenhNhanID;

            var viewModel = (from xn in _context.XetNghiems
                             join bn in _context.TenXetNghiems on xn.LoaiXetNghiemID equals bn.LoaiXetNghiemID into result
                             from xnbn in result.DefaultIfEmpty()
                             where xn.XetNghiemID == XetNghiemID
                             select new XetNghiemChiTietViewModel()
                             {
                                 XetNghiemID = xn.XetNghiemID,
                                 LoaiXetNghiemID = xnbn.LoaiXetNghiemID,
                                 TenXetNghiemID = xnbn.TenXetNghiemID,
                                 TenXetNghiem = xnbn.TenXetNghiem1
                             }).ToList();
            CreateViewBag();
            return View(viewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Analysis(List<XetNghiemChiTietViewModel> Model)
        {
            //tạo xet nghiem ID
            foreach (var item in Model)
            {
                var model = new XetNghiemChiTiet()
                {
                    XetNghiemChiTietID = Guid.NewGuid(),
                    XetNghiemID = item.XetNghiemID,
                    KetQua = item.KetQua,
                    KhoangThamChieu = item.KhoangThamChieu,
                    DonViID = item.DonViID,
                    TenXetNghiemID = item.TenXetNghiemID
                };
                _context.Entry(model).State = EntityState.Added;
            }
            //Sửa trạng thái
            var XetNghiemID = Model.FirstOrDefault().XetNghiemID;
            var BenhNhanID = _context.XetNghiems.Where(t => t.XetNghiemID == XetNghiemID).FirstOrDefault().BenhNhanID;
            var XetNghiem = _context.XetNghiems.Where(x => x.XetNghiemID == XetNghiemID).FirstOrDefault();
            XetNghiem.TrangThai = "Đã Xét Nghiệm";
            _context.Entry(XetNghiem).State = EntityState.Modified;
            _context.SaveChanges();

            return RedirectToAction("Edit", new { id = BenhNhanID });
        }

        public ActionResult Report(Guid BenhNhanID)
        {
            var model = (from xn in _context.XetNghiems
                         join txn in _context.TenXetNghiems on xn.LoaiXetNghiemID equals txn.LoaiXetNghiemID into result
                         from xntxn in result.DefaultIfEmpty()
                         join bn in _context.BenhNhans on xn.BenhNhanID equals bn.BenhNhanID into result1
                         from xnbn in result1.DefaultIfEmpty()
                         join bs in _context.BacSis on xn.BacSiID equals bs.BacSiID into result2
                         from xnbs in result2.DefaultIfEmpty()
                         join ktv in _context.KyThuatViens on xn.KyThuatVienID equals ktv.KyThuatVienID into result3
                         from xnktv in result3.DefaultIfEmpty()
                         join k in _context.Khoas on xnbs.KhoaID equals k.KhoaID into result4
                         from xnk in result4.DefaultIfEmpty()
                         join lxn in _context.LoaiXetNghiems on xn.LoaiXetNghiemID equals lxn.LoaiXetNghiemID into result5
                         from xnlxn in result5.DefaultIfEmpty()
                         join xnct in _context.XetNghiemChiTiets on xn.XetNghiemID equals xnct.XetNghiemID into result6
                         from xnxnct in result6.DefaultIfEmpty()
                         join txn in _context.TenXetNghiems on xnxnct.TenXetNghiemID equals txn.TenXetNghiemID into result7
                         from xncttxn in result7.DefaultIfEmpty()
                         join dv in _context.DonVis on xnxnct.DonViID equals dv.DonViID into result8
                         from xnctdv in result8.DefaultIfEmpty()
                         where xn.BenhNhanID == BenhNhanID && xn.TrangThai.Trim() == "Đã Xét Nghiệm"
                         select new
                         {
                             XetNghiemID = xn.XetNghiemID,
                             HoTenNguoiBenh = xnbn.HoTen,
                             DiaChi = xnbn.DiaChi,
                             NamSinh = (DateTime)xnbn.NamSinh,
                             GioiTinh = (bool)xnbn.GioiTinh ? "Nam" : "Nữ",
                             MaBenhNhan = xnbn.MaBenhNhan,
                             SID = xnbn.SID,
                             TenLoaiXetNghiem = xntxn.LoaiXetNghiem.Ten,
                             TenBacSi = xnbs.HoTen,
                             TenXetNghiem = xntxn.TenXetNghiem1,
                             KetQua = (Decimal)xnxnct.KetQua,
                             xnxnct.KhoangThamChieu,
                             TenDonVi = xnctdv.TenDonVi,
                             Khoa = xnk.TenKhoa,
                             SoTheBHYT = xnbn.SoTheBHYT
                         }).ToList();

            //List<BacSiViewModel> model1 = new List<BacSiViewModel>();
            //var all = _context.BacSis.ToList();
            //foreach (var item in all)
            //{
            //    var BacSi = new BacSiViewModel();
            //    BacSi.BacSiID = item.BacSiID;
            //    BacSi.HoTen = item.HoTen;
            //    model1.Add(BacSi);
            //}

            ReportDocument rd = new ReportDocument();
            rd.Load(Path.Combine(Server.MapPath("~/Reports"), "Report.rpt"));

            rd.SetDataSource(model);

            Response.Buffer = false;
            Response.ClearContent();
            Response.ClearHeaders();


            Stream stream = rd.ExportToStream(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat);
            stream.Seek(0, SeekOrigin.Begin);
            return File(stream, "application/pdf", "Report.pdf");
        }

        #region CreateViewBag, Helper
        public void CreateViewBag(Guid? DonViID = null)
        {
            //DonVi
            var DonViList = _context.DonVis.Select(p => new
            {
                Id = p.DonViID,
                Name = p.TenDonVi
            })
            .OrderByDescending(p => p.Name).ToList();
            ViewBag.DonViIdList = new SelectList(DonViList, "Id", "Name", DonViID);
        }
        #endregion
    }
}
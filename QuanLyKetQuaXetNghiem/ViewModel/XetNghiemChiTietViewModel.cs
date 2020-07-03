using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace QuanLyKetQuaXetNghiem.ViewModel
{
    public class XetNghiemChiTietViewModel
    {
        public System.Guid XetNghiemChiTietID { get; set; }
        public Nullable<System.Guid> XetNghiemID { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập Kết Quả")]

        public Nullable<decimal> KetQua { get; set; }
        [Display(Name = "Khoảng Tham Chiếu")]
        [Required(ErrorMessage = "Vui lòng nhập Khoảng Tham Chiếu")]
        public string KhoangThamChieu { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập Tên Đơn Vị")]
        public Nullable<System.Guid> DonViID { get; set; }
        [Display(Name = "Tên Đơn Vị")]
        public string TenDonVi { get; set; }
        public Nullable<System.Guid> TenXetNghiemID { get; set; }
        public Nullable<System.Guid> LoaiXetNghiemID { get; set; }
        [Display(Name = "Tên Xét Nghiệm")]
        public string TenXetNghiem { get; set; }
    }
}
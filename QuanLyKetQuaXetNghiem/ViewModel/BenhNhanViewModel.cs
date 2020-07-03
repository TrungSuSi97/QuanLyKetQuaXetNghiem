using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace QuanLyKetQuaXetNghiem.ViewModel
{
    public class BenhNhanViewModel
    {
        public System.Guid BenhNhanID { get; set; }
        [Display(Name = "Mã Bệnh Nhân")]
        public string MaBenhNhan { get; set; }
        [Display(Name = "SID")]
        public string SID { get; set; }
        [Display(Name = "Họ Tên")]
        public string HoTen { get; set; }
        [Display(Name = "Năm Sinh")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public Nullable<System.DateTime> NamSinh { get; set; }
        [Display(Name = "Giới Tính")]
        public Nullable<bool> GioiTinh { get; set; }
        [Display(Name = "Địa Chỉ")]
        public string DiaChi { get; set; }
        [Display(Name = "Số Thẻ BHYT")]
        public string SoTheBHYT { get; set; }

    }
}
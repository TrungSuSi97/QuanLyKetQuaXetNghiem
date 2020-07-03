using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace QuanLyKetQuaXetNghiem.ViewModel
{
    public class XetNghiemBacSiBenhNhanViewModel
    {
        public System.Guid XetNghiemID { get; set; }
        public System.Guid BenhNhanID { get; set; }
        public System.Guid LoaiXetNghiemID { get; set; }
        public System.Guid BacSiID { get; set; }
        [Display(Name = "Họ Tên Bệnh Nhân")]
        public string HoTenBenhNhan { get; set; }
        [Display(Name = "Họ Tên Bác Sĩ")]
        public string HoTenBacSi { get; set; }
        public string TenLoaiXetNghiem { get; set; }
        [Display(Name = "Trạng Thái")]
        public string TrangThai { get; set; }
        [Display(Name = "Ngày Tạo")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy}")]
        public DateTime? CreatedDate { get; set; }



    }
}
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace QuanLyKetQuaXetNghiem.ViewModel
{
    public class BenhNhanLoaiXetNghiemViewModel
    {
        public System.Guid BenhNhanID { get; set; }
        [Display(Name = "Mã Bệnh Nhân")]
        [Required]
        public string MaBenhNhan { get; set; }
        public string SID { get; set; }
        [Display(Name = "Họ Tên")]
        [Required(ErrorMessage ="Vui lòng nhập Họ Tên")]
        public string HoTen { get; set; }
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        [Display(Name = "Năm Sinh")]
        [Required(ErrorMessage = "Vui lòng nhập Năm Sinh")]
        public System.DateTime NamSinh { get; set; }
        [Display(Name = "Giới Tính")]
        public Nullable<bool> GioiTinh { get; set; }
        [Display(Name = "Địa Chỉ")]
        [Required(ErrorMessage = "Vui lòng nhập Địa Chỉ")]
        public string DiaChi { get; set; }
        public string SoTheBHYT { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<XetNghiem> XetNghiems { get; set; }
        [Display(Name = "Xét Nghiệm")]
        public List<LoaiXetNghiem> LoaiXetNghiems { get; set; }
        [Display(Name = "Bác Sĩ Chỉ Định")]
        public System.Guid? BacSiID { get; set; }

    }
}
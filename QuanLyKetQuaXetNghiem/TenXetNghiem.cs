//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QuanLyKetQuaXetNghiem
{
    using System;
    using System.Collections.Generic;
    
    public partial class TenXetNghiem
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TenXetNghiem()
        {
            this.XetNghiemChiTiets = new HashSet<XetNghiemChiTiet>();
        }
    
        public System.Guid TenXetNghiemID { get; set; }
        public string TenXetNghiem1 { get; set; }
        public Nullable<System.Guid> LoaiXetNghiemID { get; set; }
    
        public virtual LoaiXetNghiem LoaiXetNghiem { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<XetNghiemChiTiet> XetNghiemChiTiets { get; set; }
    }
}
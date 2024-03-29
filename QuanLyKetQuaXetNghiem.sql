USE [QuanLyKetQuaXetNghiem]
GO
/****** Object:  Table [dbo].[BacSi]    Script Date: 7/3/2020 9:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BacSi](
	[BacSiID] [uniqueidentifier] NOT NULL,
	[HoTen] [nvarchar](300) NULL,
	[KhoaID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_BacSi] PRIMARY KEY CLUSTERED 
(
	[BacSiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BenhNhan]    Script Date: 7/3/2020 9:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BenhNhan](
	[BenhNhanID] [uniqueidentifier] NOT NULL,
	[MaBenhNhan] [varchar](10) NOT NULL,
	[SID] [varchar](13) NOT NULL,
	[HoTen] [nvarchar](100) NULL,
	[NamSinh] [date] NULL,
	[GioiTinh] [bit] NULL,
	[DiaChi] [nvarchar](300) NULL,
	[SoTheBHYT] [varchar](21) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_BenhNhan] PRIMARY KEY CLUSTERED 
(
	[BenhNhanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DonVi]    Script Date: 7/3/2020 9:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonVi](
	[DonViID] [uniqueidentifier] NOT NULL,
	[TenDonVi] [nvarchar](50) NULL,
	[STT] [int] NULL,
 CONSTRAINT [PK_DonVi] PRIMARY KEY CLUSTERED 
(
	[DonViID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 7/3/2020 9:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[KhoaID] [uniqueidentifier] NOT NULL,
	[TenKhoa] [nvarchar](300) NULL,
 CONSTRAINT [PK_Khoa] PRIMARY KEY CLUSTERED 
(
	[KhoaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KyThuatVien]    Script Date: 7/3/2020 9:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KyThuatVien](
	[KyThuatVienID] [uniqueidentifier] NOT NULL,
	[HoTen] [nvarchar](300) NULL,
 CONSTRAINT [PK_KyThuatVien] PRIMARY KEY CLUSTERED 
(
	[KyThuatVienID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiXetNghiem]    Script Date: 7/3/2020 9:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiXetNghiem](
	[LoaiXetNghiemID] [uniqueidentifier] NOT NULL,
	[Ten] [nvarchar](300) NULL,
 CONSTRAINT [PK_XetNghiem] PRIMARY KEY CLUSTERED 
(
	[LoaiXetNghiemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TenXetNghiem]    Script Date: 7/3/2020 9:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TenXetNghiem](
	[TenXetNghiemID] [uniqueidentifier] NOT NULL,
	[TenXetNghiem] [nvarchar](100) NULL,
	[LoaiXetNghiemID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TenXetNghiem] PRIMARY KEY CLUSTERED 
(
	[TenXetNghiemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[XetNghiem]    Script Date: 7/3/2020 9:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XetNghiem](
	[XetNghiemID] [uniqueidentifier] NOT NULL,
	[BenhNhanID] [uniqueidentifier] NULL,
	[BacSiID] [uniqueidentifier] NULL,
	[TrangThai] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[KyThuatVienID] [uniqueidentifier] NULL,
	[LoaiXetNghiemID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_XetNghiem_1] PRIMARY KEY CLUSTERED 
(
	[XetNghiemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[XetNghiemChiTiet]    Script Date: 7/3/2020 9:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[XetNghiemChiTiet](
	[XetNghiemChiTietID] [uniqueidentifier] NOT NULL,
	[XetNghiemID] [uniqueidentifier] NULL,
	[KetQua] [decimal](8, 2) NULL,
	[KhoangThamChieu] [varchar](50) NULL,
	[DonViID] [uniqueidentifier] NULL,
	[TenXetNghiemID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_XetNghiemChiTiet] PRIMARY KEY CLUSTERED 
(
	[XetNghiemChiTietID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[BacSi] ([BacSiID], [HoTen], [KhoaID]) VALUES (N'ce2ebce1-8e8e-4276-99dc-00030663c996', N'BS LAN', N'7daa674c-8960-496d-841d-b54345c47072')
INSERT [dbo].[BacSi] ([BacSiID], [HoTen], [KhoaID]) VALUES (N'151a9872-dd95-4744-b4b2-04db8e817c7e', N'BS MAI', N'7daa674c-8960-496d-841d-b54345c47072')
INSERT [dbo].[BacSi] ([BacSiID], [HoTen], [KhoaID]) VALUES (N'5ade971b-d309-4a1a-ae72-3c3d2944ecfc', N'BS CKII. Lê', N'c96b36a0-3871-4006-8775-c8f90d101f3b')
INSERT [dbo].[BacSi] ([BacSiID], [HoTen], [KhoaID]) VALUES (N'8d3b8b30-8be2-45de-a856-b12b960cafc1', N'BS CKI. NGUYỄN', N'c96b36a0-3871-4006-8775-c8f90d101f3b')
INSERT [dbo].[BenhNhan] ([BenhNhanID], [MaBenhNhan], [SID], [HoTen], [NamSinh], [GioiTinh], [DiaChi], [SoTheBHYT], [CreatedDate]) VALUES (N'ec90914a-e14d-4a73-86f8-47c4d8ae3e9c', N'2018123456', N'181224.123456', N'Nguyễn Văn Sơn', CAST(N'1969-06-15' AS Date), 1, N'An Giang', N'GD4878711234567-12345', CAST(N'2020-07-01 00:00:00.000' AS DateTime))
INSERT [dbo].[BenhNhan] ([BenhNhanID], [MaBenhNhan], [SID], [HoTen], [NamSinh], [GioiTinh], [DiaChi], [SoTheBHYT], [CreatedDate]) VALUES (N'3553aa61-f61d-4864-b299-6e5f93152307', N'2016950885', N'160105.997950', N'Thị Lựu', CAST(N'2016-01-05' AS Date), 1, N'Cần Thơ', N'GD4878719586748-75050', CAST(N'2020-07-01 19:38:07.703' AS DateTime))
INSERT [dbo].[BenhNhan] ([BenhNhanID], [MaBenhNhan], [SID], [HoTen], [NamSinh], [GioiTinh], [DiaChi], [SoTheBHYT], [CreatedDate]) VALUES (N'79866b11-7316-4189-88ab-ca6ff6321122', N'2013016050', N'130102.186457', N'Văn Tân', CAST(N'2013-01-02' AS Date), 1, N'TPHCM', N'GD4878711316282-44713', CAST(N'2020-07-02 10:13:40.427' AS DateTime))
INSERT [dbo].[DonVi] ([DonViID], [TenDonVi], [STT]) VALUES (N'8a538372-dce4-41a3-acd3-030498b91aa1', N'µmol/L', 10)
INSERT [dbo].[DonVi] ([DonViID], [TenDonVi], [STT]) VALUES (N'36001ef5-4c4b-42fd-aeb4-08675fb3fa5e', N'pg', 20)
INSERT [dbo].[DonVi] ([DonViID], [TenDonVi], [STT]) VALUES (N'745d3d90-1a00-40df-8e8d-1a21373613d9', N'10³/μL', 30)
INSERT [dbo].[DonVi] ([DonViID], [TenDonVi], [STT]) VALUES (N'6c751283-4cd5-41f3-bfb1-3a93d40ff4d2', N'fL', 40)
INSERT [dbo].[DonVi] ([DonViID], [TenDonVi], [STT]) VALUES (N'7ddc5129-0dfb-4c60-bc10-94c9f7fbb006', N'%', 50)
INSERT [dbo].[DonVi] ([DonViID], [TenDonVi], [STT]) VALUES (N'19fc78b6-bb88-4f90-934e-a73866829a90', N'', 120)
INSERT [dbo].[DonVi] ([DonViID], [TenDonVi], [STT]) VALUES (N'c695af66-a502-493f-bcd1-a8405e9e1915', N'10⁶/μL', 60)
INSERT [dbo].[DonVi] ([DonViID], [TenDonVi], [STT]) VALUES (N'7cdae654-94bb-4cca-8c50-a96309b04466', N'mmol/L', 70)
INSERT [dbo].[DonVi] ([DonViID], [TenDonVi], [STT]) VALUES (N'255ce5ca-b729-48c8-a768-c6437cb1c6f1', N'Sec', 80)
INSERT [dbo].[DonVi] ([DonViID], [TenDonVi], [STT]) VALUES (N'445b3f9a-2fa5-434f-903b-c8df9f31083b', N'Giây', 90)
INSERT [dbo].[DonVi] ([DonViID], [TenDonVi], [STT]) VALUES (N'32056393-5d66-4bca-a41f-ea8de1fff3ac', N'g/l', 100)
INSERT [dbo].[DonVi] ([DonViID], [TenDonVi], [STT]) VALUES (N'90b48f18-162e-4633-8ae4-eabf6245bca6', N'U/L', 110)
INSERT [dbo].[Khoa] ([KhoaID], [TenKhoa]) VALUES (N'e8f2d212-fc10-43c9-8520-0da4c60d9a12', N'KHOA CẤP CỨU')
INSERT [dbo].[Khoa] ([KhoaID], [TenKhoa]) VALUES (N'43a57a69-3621-4c04-a19e-7248af18ddab', N'KHOA PHỤ SẢN')
INSERT [dbo].[Khoa] ([KhoaID], [TenKhoa]) VALUES (N'90b6a775-aa6b-4af9-b0b8-772ea5213d48', N'KHOA KHÁM BỆNH')
INSERT [dbo].[Khoa] ([KhoaID], [TenKhoa]) VALUES (N'19636ca8-b3c5-4c18-b4bf-8ee69e3eaba4', N'KHOA TRUYỀN NHIỄM')
INSERT [dbo].[Khoa] ([KhoaID], [TenKhoa]) VALUES (N'7daa674c-8960-496d-841d-b54345c47072', N'KHOA NHI')
INSERT [dbo].[Khoa] ([KhoaID], [TenKhoa]) VALUES (N'c96b36a0-3871-4006-8775-c8f90d101f3b', N'KHOA NGOẠI TỔNG HỢP')
INSERT [dbo].[KyThuatVien] ([KyThuatVienID], [HoTen]) VALUES (N'69ff5057-dff7-42fd-b9b3-30e05d3d7e02', N'Đặng Thùy Lan')
INSERT [dbo].[KyThuatVien] ([KyThuatVienID], [HoTen]) VALUES (N'7b9f6c8f-b258-4f71-b5f8-4a2cf4b0173e', N'Nguyễn Thị Minh')
INSERT [dbo].[KyThuatVien] ([KyThuatVienID], [HoTen]) VALUES (N'5488a57c-ff4f-4ba6-a4c2-c833ae353e06', N'Vũ Văn Cẩn')
INSERT [dbo].[LoaiXetNghiem] ([LoaiXetNghiemID], [Ten]) VALUES (N'a95a3670-82fd-413e-8b1b-01fc7bb9a1f0', N'RỐI LOẠN ĐÔNG CẦM MÁU')
INSERT [dbo].[LoaiXetNghiem] ([LoaiXetNghiemID], [Ten]) VALUES (N'460a0cdc-7c6b-4496-908c-3eb3a78c85cb', N'ĐÔNG MÁU')
INSERT [dbo].[LoaiXetNghiem] ([LoaiXetNghiemID], [Ten]) VALUES (N'26d8dcd8-c6d0-4923-a7c8-6de636713ba7', N'SINH HÓA')
INSERT [dbo].[LoaiXetNghiem] ([LoaiXetNghiemID], [Ten]) VALUES (N'32fef4cc-e30b-4f2d-9e83-be5a6c9f9e68', N'HUYẾT HỌC')
INSERT [dbo].[TenXetNghiem] ([TenXetNghiemID], [TenXetNghiem], [LoaiXetNghiemID]) VALUES (N'26319eef-444d-4e25-9406-00897baad5f6', N'TCK', N'a95a3670-82fd-413e-8b1b-01fc7bb9a1f0')
INSERT [dbo].[TenXetNghiem] ([TenXetNghiemID], [TenXetNghiem], [LoaiXetNghiemID]) VALUES (N'3208dd2c-cc43-4ae4-9c9d-0a956a5ad3a9', N'MCV', N'32fef4cc-e30b-4f2d-9e83-be5a6c9f9e68')
INSERT [dbo].[TenXetNghiem] ([TenXetNghiemID], [TenXetNghiem], [LoaiXetNghiemID]) VALUES (N'e4444eb1-e0a1-46a3-971b-0ba4088a1d28', N'Thời gian máu chảy', N'460a0cdc-7c6b-4496-908c-3eb3a78c85cb')
INSERT [dbo].[TenXetNghiem] ([TenXetNghiemID], [TenXetNghiem], [LoaiXetNghiemID]) VALUES (N'29290a5a-232e-409a-81e3-0e35e1870ff6', N'Glucose', N'26d8dcd8-c6d0-4923-a7c8-6de636713ba7')
INSERT [dbo].[TenXetNghiem] ([TenXetNghiemID], [TenXetNghiem], [LoaiXetNghiemID]) VALUES (N'fb859e96-f6d9-4a89-bb3b-1b252fd967a3', N'PLT', N'32fef4cc-e30b-4f2d-9e83-be5a6c9f9e68')
INSERT [dbo].[TenXetNghiem] ([TenXetNghiemID], [TenXetNghiem], [LoaiXetNghiemID]) VALUES (N'0995ed34-ae67-4fa0-9a66-1d157438a2a4', N'Triglycerid', N'26d8dcd8-c6d0-4923-a7c8-6de636713ba7')
INSERT [dbo].[TenXetNghiem] ([TenXetNghiemID], [TenXetNghiem], [LoaiXetNghiemID]) VALUES (N'662693c8-8ca8-482e-9a0a-2ccff441fce8', N'HGB', N'32fef4cc-e30b-4f2d-9e83-be5a6c9f9e68')
INSERT [dbo].[TenXetNghiem] ([TenXetNghiemID], [TenXetNghiem], [LoaiXetNghiemID]) VALUES (N'50b25a83-459a-4f2b-9902-37aa25469e0f', N'Acid Uric', N'26d8dcd8-c6d0-4923-a7c8-6de636713ba7')
INSERT [dbo].[TenXetNghiem] ([TenXetNghiemID], [TenXetNghiem], [LoaiXetNghiemID]) VALUES (N'6078ff3c-c4ba-4d91-ad31-39ee57850961', N'WBC', N'32fef4cc-e30b-4f2d-9e83-be5a6c9f9e68')
INSERT [dbo].[TenXetNghiem] ([TenXetNghiemID], [TenXetNghiem], [LoaiXetNghiemID]) VALUES (N'd093b7d6-2b7d-4c0d-8cf5-3fed85d1998f', N'EOS%', N'32fef4cc-e30b-4f2d-9e83-be5a6c9f9e68')
INSERT [dbo].[TenXetNghiem] ([TenXetNghiemID], [TenXetNghiem], [LoaiXetNghiemID]) VALUES (N'a79cf51e-22cf-48de-b50f-4e4a540e3007', N'NEU%', N'32fef4cc-e30b-4f2d-9e83-be5a6c9f9e68')
INSERT [dbo].[TenXetNghiem] ([TenXetNghiemID], [TenXetNghiem], [LoaiXetNghiemID]) VALUES (N'34540b58-0b57-4c02-870b-568e738929cc', N'Urê', N'26d8dcd8-c6d0-4923-a7c8-6de636713ba7')
INSERT [dbo].[TenXetNghiem] ([TenXetNghiemID], [TenXetNghiem], [LoaiXetNghiemID]) VALUES (N'6219bb8f-7b1e-45e6-a58f-5e215b95f0c6', N'Cholesterol', N'26d8dcd8-c6d0-4923-a7c8-6de636713ba7')
INSERT [dbo].[TenXetNghiem] ([TenXetNghiemID], [TenXetNghiem], [LoaiXetNghiemID]) VALUES (N'a949d14d-2e4c-4c3d-9c58-7094863b94b3', N'AST (GOT)', N'26d8dcd8-c6d0-4923-a7c8-6de636713ba7')
INSERT [dbo].[TenXetNghiem] ([TenXetNghiemID], [TenXetNghiem], [LoaiXetNghiemID]) VALUES (N'd1c0ce02-625b-4c73-8c47-9e2543dc44d2', N'ALT (GPT)', N'26d8dcd8-c6d0-4923-a7c8-6de636713ba7')
INSERT [dbo].[TenXetNghiem] ([TenXetNghiemID], [TenXetNghiem], [LoaiXetNghiemID]) VALUES (N'7830a3a6-b00e-46e9-8bbc-ad0bd4d1ee17', N'HDL-Cholesterol', N'26d8dcd8-c6d0-4923-a7c8-6de636713ba7')
INSERT [dbo].[TenXetNghiem] ([TenXetNghiemID], [TenXetNghiem], [LoaiXetNghiemID]) VALUES (N'24f354fd-2505-4f43-b9be-af4709a25111', N'GGT', N'26d8dcd8-c6d0-4923-a7c8-6de636713ba7')
INSERT [dbo].[TenXetNghiem] ([TenXetNghiemID], [TenXetNghiem], [LoaiXetNghiemID]) VALUES (N'a4d81c0d-79e0-4be0-b153-b2fb644e35a2', N'MCHC', N'32fef4cc-e30b-4f2d-9e83-be5a6c9f9e68')
INSERT [dbo].[TenXetNghiem] ([TenXetNghiemID], [TenXetNghiem], [LoaiXetNghiemID]) VALUES (N'b25b2044-083b-415a-91fe-bc86681cd43b', N'MPV', N'32fef4cc-e30b-4f2d-9e83-be5a6c9f9e68')
INSERT [dbo].[TenXetNghiem] ([TenXetNghiemID], [TenXetNghiem], [LoaiXetNghiemID]) VALUES (N'd568bf36-f50d-4e1d-a5c0-bcf9e161f03c', N'TQ', N'a95a3670-82fd-413e-8b1b-01fc7bb9a1f0')
INSERT [dbo].[TenXetNghiem] ([TenXetNghiemID], [TenXetNghiem], [LoaiXetNghiemID]) VALUES (N'4b681057-8672-49da-bd2c-c3530b77bad8', N'HCT', N'32fef4cc-e30b-4f2d-9e83-be5a6c9f9e68')
INSERT [dbo].[TenXetNghiem] ([TenXetNghiemID], [TenXetNghiem], [LoaiXetNghiemID]) VALUES (N'ee283818-da4b-41b9-9e3e-ce8f9ce83d2b', N'BASO%', N'32fef4cc-e30b-4f2d-9e83-be5a6c9f9e68')
INSERT [dbo].[TenXetNghiem] ([TenXetNghiemID], [TenXetNghiem], [LoaiXetNghiemID]) VALUES (N'8ef5f536-0f46-40be-8a73-d167e90880ce', N'MONO%', N'32fef4cc-e30b-4f2d-9e83-be5a6c9f9e68')
INSERT [dbo].[TenXetNghiem] ([TenXetNghiemID], [TenXetNghiem], [LoaiXetNghiemID]) VALUES (N'7cfe7d78-c54a-4e51-9959-ebe91586d638', N'Creatinin', N'26d8dcd8-c6d0-4923-a7c8-6de636713ba7')
INSERT [dbo].[TenXetNghiem] ([TenXetNghiemID], [TenXetNghiem], [LoaiXetNghiemID]) VALUES (N'8e2eb075-a05e-4477-ade9-ee0d7849dc84', N'LYM%', N'32fef4cc-e30b-4f2d-9e83-be5a6c9f9e68')
INSERT [dbo].[TenXetNghiem] ([TenXetNghiemID], [TenXetNghiem], [LoaiXetNghiemID]) VALUES (N'7e8a210d-7e7b-4f7d-abd3-f6e2f4688c01', N'MCH', N'32fef4cc-e30b-4f2d-9e83-be5a6c9f9e68')
INSERT [dbo].[TenXetNghiem] ([TenXetNghiemID], [TenXetNghiem], [LoaiXetNghiemID]) VALUES (N'dc172d2b-a4bb-4ccc-9a07-f9406456aa99', N'Thời gian máu đông', N'460a0cdc-7c6b-4496-908c-3eb3a78c85cb')
INSERT [dbo].[XetNghiem] ([XetNghiemID], [BenhNhanID], [BacSiID], [TrangThai], [CreatedDate], [KyThuatVienID], [LoaiXetNghiemID]) VALUES (N'c0964285-8b85-4054-a4b3-12f14d9e3468', N'3553aa61-f61d-4864-b299-6e5f93152307', N'ce2ebce1-8e8e-4276-99dc-00030663c996', N'Đã Xét Nghiệm', CAST(N'2020-07-01 19:38:07.883' AS DateTime), NULL, N'460a0cdc-7c6b-4496-908c-3eb3a78c85cb')
INSERT [dbo].[XetNghiem] ([XetNghiemID], [BenhNhanID], [BacSiID], [TrangThai], [CreatedDate], [KyThuatVienID], [LoaiXetNghiemID]) VALUES (N'965366ad-00c1-4f80-8a84-2595526e58b6', N'3553aa61-f61d-4864-b299-6e5f93152307', N'ce2ebce1-8e8e-4276-99dc-00030663c996', N'Đã Xét Nghiệm', CAST(N'2020-07-01 19:38:07.883' AS DateTime), NULL, N'a95a3670-82fd-413e-8b1b-01fc7bb9a1f0')
INSERT [dbo].[XetNghiem] ([XetNghiemID], [BenhNhanID], [BacSiID], [TrangThai], [CreatedDate], [KyThuatVienID], [LoaiXetNghiemID]) VALUES (N'822ff4b6-150c-4666-9e82-7c521a87dfe6', N'79866b11-7316-4189-88ab-ca6ff6321122', N'5ade971b-d309-4a1a-ae72-3c3d2944ecfc', N'Chưa Xét Nghiệm', CAST(N'2020-07-02 10:13:40.427' AS DateTime), NULL, N'26d8dcd8-c6d0-4923-a7c8-6de636713ba7')
INSERT [dbo].[XetNghiem] ([XetNghiemID], [BenhNhanID], [BacSiID], [TrangThai], [CreatedDate], [KyThuatVienID], [LoaiXetNghiemID]) VALUES (N'2e5678da-cdf4-4797-b3df-9f52cbc91ecd', N'79866b11-7316-4189-88ab-ca6ff6321122', N'5ade971b-d309-4a1a-ae72-3c3d2944ecfc', N'Chưa Xét Nghiệm', CAST(N'2020-07-02 10:13:40.427' AS DateTime), NULL, N'32fef4cc-e30b-4f2d-9e83-be5a6c9f9e68')
INSERT [dbo].[XetNghiemChiTiet] ([XetNghiemChiTietID], [XetNghiemID], [KetQua], [KhoangThamChieu], [DonViID], [TenXetNghiemID]) VALUES (N'999adbdd-6afb-4550-9beb-1ee4991cf621', N'965366ad-00c1-4f80-8a84-2595526e58b6', CAST(32.00 AS Decimal(8, 2)), N'33', N'32056393-5d66-4bca-a41f-ea8de1fff3ac', N'26319eef-444d-4e25-9406-00897baad5f6')
INSERT [dbo].[XetNghiemChiTiet] ([XetNghiemChiTietID], [XetNghiemID], [KetQua], [KhoangThamChieu], [DonViID], [TenXetNghiemID]) VALUES (N'c4f7818c-2fa2-445d-a3b2-3b6523f3d7a1', N'c0964285-8b85-4054-a4b3-12f14d9e3468', CAST(32.00 AS Decimal(8, 2)), N'232', N'36001ef5-4c4b-42fd-aeb4-08675fb3fa5e', N'e4444eb1-e0a1-46a3-971b-0ba4088a1d28')
INSERT [dbo].[XetNghiemChiTiet] ([XetNghiemChiTietID], [XetNghiemID], [KetQua], [KhoangThamChieu], [DonViID], [TenXetNghiemID]) VALUES (N'9379ea96-6d34-43b7-90a2-57beb6eaf467', N'c0964285-8b85-4054-a4b3-12f14d9e3468', CAST(323.00 AS Decimal(8, 2)), N'3232', N'6c751283-4cd5-41f3-bfb1-3a93d40ff4d2', N'dc172d2b-a4bb-4ccc-9a07-f9406456aa99')
INSERT [dbo].[XetNghiemChiTiet] ([XetNghiemChiTietID], [XetNghiemID], [KetQua], [KhoangThamChieu], [DonViID], [TenXetNghiemID]) VALUES (N'56462e9f-0ddf-4b5f-ab0d-8207678d2442', N'965366ad-00c1-4f80-8a84-2595526e58b6', CAST(12.00 AS Decimal(8, 2)), N'44', N'c695af66-a502-493f-bcd1-a8405e9e1915', N'd568bf36-f50d-4e1d-a5c0-bcf9e161f03c')
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_MaBenhNhan]    Script Date: 7/3/2020 9:50:46 AM ******/
ALTER TABLE [dbo].[BenhNhan] ADD  CONSTRAINT [UK_MaBenhNhan] UNIQUE NONCLUSTERED 
(
	[MaBenhNhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_SID]    Script Date: 7/3/2020 9:50:46 AM ******/
ALTER TABLE [dbo].[BenhNhan] ADD  CONSTRAINT [UK_SID] UNIQUE NONCLUSTERED 
(
	[SID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BacSi]  WITH CHECK ADD  CONSTRAINT [FK_BacSi_Khoa] FOREIGN KEY([KhoaID])
REFERENCES [dbo].[Khoa] ([KhoaID])
GO
ALTER TABLE [dbo].[BacSi] CHECK CONSTRAINT [FK_BacSi_Khoa]
GO
ALTER TABLE [dbo].[TenXetNghiem]  WITH CHECK ADD  CONSTRAINT [FK_TenXetNghiem_TenXetNghiem] FOREIGN KEY([LoaiXetNghiemID])
REFERENCES [dbo].[LoaiXetNghiem] ([LoaiXetNghiemID])
GO
ALTER TABLE [dbo].[TenXetNghiem] CHECK CONSTRAINT [FK_TenXetNghiem_TenXetNghiem]
GO
ALTER TABLE [dbo].[XetNghiem]  WITH CHECK ADD  CONSTRAINT [FK_XetNghiem_BacSi] FOREIGN KEY([BacSiID])
REFERENCES [dbo].[BacSi] ([BacSiID])
GO
ALTER TABLE [dbo].[XetNghiem] CHECK CONSTRAINT [FK_XetNghiem_BacSi]
GO
ALTER TABLE [dbo].[XetNghiem]  WITH CHECK ADD  CONSTRAINT [FK_XetNghiem_BenhNhan] FOREIGN KEY([BenhNhanID])
REFERENCES [dbo].[BenhNhan] ([BenhNhanID])
GO
ALTER TABLE [dbo].[XetNghiem] CHECK CONSTRAINT [FK_XetNghiem_BenhNhan]
GO
ALTER TABLE [dbo].[XetNghiem]  WITH CHECK ADD  CONSTRAINT [FK_XetNghiem_KyThuatVien] FOREIGN KEY([KyThuatVienID])
REFERENCES [dbo].[KyThuatVien] ([KyThuatVienID])
GO
ALTER TABLE [dbo].[XetNghiem] CHECK CONSTRAINT [FK_XetNghiem_KyThuatVien]
GO
ALTER TABLE [dbo].[XetNghiem]  WITH CHECK ADD  CONSTRAINT [FK_XetNghiem_LoaiXetNghiem] FOREIGN KEY([LoaiXetNghiemID])
REFERENCES [dbo].[LoaiXetNghiem] ([LoaiXetNghiemID])
GO
ALTER TABLE [dbo].[XetNghiem] CHECK CONSTRAINT [FK_XetNghiem_LoaiXetNghiem]
GO
ALTER TABLE [dbo].[XetNghiemChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_XetNghiemChiTiet_DonVi] FOREIGN KEY([DonViID])
REFERENCES [dbo].[DonVi] ([DonViID])
GO
ALTER TABLE [dbo].[XetNghiemChiTiet] CHECK CONSTRAINT [FK_XetNghiemChiTiet_DonVi]
GO
ALTER TABLE [dbo].[XetNghiemChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_XetNghiemChiTiet_TenXetNghiem] FOREIGN KEY([TenXetNghiemID])
REFERENCES [dbo].[TenXetNghiem] ([TenXetNghiemID])
GO
ALTER TABLE [dbo].[XetNghiemChiTiet] CHECK CONSTRAINT [FK_XetNghiemChiTiet_TenXetNghiem]
GO
ALTER TABLE [dbo].[XetNghiemChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_XetNghiemChiTiet_XetNghiem] FOREIGN KEY([XetNghiemID])
REFERENCES [dbo].[XetNghiem] ([XetNghiemID])
GO
ALTER TABLE [dbo].[XetNghiemChiTiet] CHECK CONSTRAINT [FK_XetNghiemChiTiet_XetNghiem]
GO

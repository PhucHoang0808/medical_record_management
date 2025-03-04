USE [QLBA]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/25/2024 10:13:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BacSi]    Script Date: 5/25/2024 10:13:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BacSi](
	[maBS] [char](10) NOT NULL,
	[TenBS] [nvarchar](30) NULL,
	[Tuoi] [int] NULL,
	[maKhoa] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[maBS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 5/25/2024 10:13:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[maKhoa] [char](10) NOT NULL,
	[tenKhoa] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[maKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichKham]    Script Date: 5/25/2024 10:13:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichKham](
	[maKhamBenh] [char](10) NOT NULL,
	[maBenhNhan] [char](10) NULL,
	[ngaykham] [date] NULL,
	[motatrieuchung] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[maKhamBenh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QLBenhAn]    Script Date: 5/25/2024 10:13:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QLBenhAn](
	[maBenhAn] [char](10) NOT NULL,
	[tenBenhAn] [nvarchar](30) NULL,
	[maKhoa] [char](10) NULL,
	[maBS] [char](10) NULL,
	[maBenhNhan] [char](10) NULL,
	[mota] [nvarchar](10) NULL,
	[tinhtrang] [bit] NULL,
	[hinh] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[maBenhAn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTinBenhNhan]    Script Date: 5/25/2024 10:13:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinBenhNhan](
	[maBenhNhan] [char](10) NOT NULL,
	[tenBenhNhan] [nvarchar](30) NULL,
	[ngaysinh] [date] NULL,
	[ngayvao] [date] NULL,
	[ngayra] [date] NULL,
	[sdt] [char](10) NULL,
	[nghenghiep] [nvarchar](30) NULL,
	[diachi] [nvarchar](30) NULL,
	[gioitinh] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[maBenhNhan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BacSi]  WITH CHECK ADD  CONSTRAINT [FK_BacSi_Khoa] FOREIGN KEY([maKhoa])
REFERENCES [dbo].[Khoa] ([maKhoa])
GO
ALTER TABLE [dbo].[BacSi] CHECK CONSTRAINT [FK_BacSi_Khoa]
GO
ALTER TABLE [dbo].[LichKham]  WITH CHECK ADD  CONSTRAINT [FK_LichKham_ThongTinBenhNhan] FOREIGN KEY([maBenhNhan])
REFERENCES [dbo].[ThongTinBenhNhan] ([maBenhNhan])
GO
ALTER TABLE [dbo].[LichKham] CHECK CONSTRAINT [FK_LichKham_ThongTinBenhNhan]
GO
ALTER TABLE [dbo].[QLBenhAn]  WITH CHECK ADD  CONSTRAINT [FK_QLBenhAn_BacSi] FOREIGN KEY([maBS])
REFERENCES [dbo].[BacSi] ([maBS])
GO
ALTER TABLE [dbo].[QLBenhAn] CHECK CONSTRAINT [FK_QLBenhAn_BacSi]
GO
ALTER TABLE [dbo].[QLBenhAn]  WITH CHECK ADD  CONSTRAINT [FK_QLBenhAn_ThongTinBenhNhan] FOREIGN KEY([maBenhNhan])
REFERENCES [dbo].[ThongTinBenhNhan] ([maBenhNhan])
GO
ALTER TABLE [dbo].[QLBenhAn] CHECK CONSTRAINT [FK_QLBenhAn_ThongTinBenhNhan]
GO

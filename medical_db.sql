USE [master]
GO
/****** Object:  Database [drDB]    Script Date: 2021-10-12 6:54:17 AM ******/
CREATE DATABASE [drDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'drDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\drDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'drDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\drDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [drDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [drDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [drDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [drDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [drDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [drDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [drDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [drDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [drDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [drDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [drDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [drDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [drDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [drDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [drDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [drDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [drDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [drDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [drDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [drDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [drDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [drDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [drDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [drDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [drDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [drDB] SET RECOVERY FULL 
GO
ALTER DATABASE [drDB] SET  MULTI_USER 
GO
ALTER DATABASE [drDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [drDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [drDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [drDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'drDB', N'ON'
GO
USE [drDB]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 2021-10-12 6:54:18 AM ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[db_datawriter]
GO
/****** Object:  User [IIS APPPOOL\medical_sohag.com]    Script Date: 2021-10-12 6:54:18 AM ******/
CREATE USER [IIS APPPOOL\medical_sohag.com] FOR LOGIN [IIS APPPOOL\medical_sohag.com] WITH DEFAULT_SCHEMA=[db_datareader]
GO
/****** Object:  Table [dbo].[add_patient_tb]    Script Date: 2021-10-12 6:54:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[add_patient_tb](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[code] [nvarchar](50) NULL,
	[del] [bit] NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](50) NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_add_patient_tb] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cxr_tb]    Script Date: 2021-10-12 6:54:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cxr_tb](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pt_id] [int] NULL,
	[pt_code] [nvarchar](50) NULL,
	[del] [bit] NULL,
	[CXR] [nvarchar](50) NULL,
	[r_Patientsick_ck] [bit] NULL,
	[r_Followup_routine_ck] [bit] NULL,
	[r_Followup_after_exacerbation_ck] [bit] NULL,
	[r_other_ck] [bit] NULL,
	[r_other_name] [nvarchar](50) NULL,
	[CXR_Findings] [nvarchar](50) NULL,
	[CT_Findings] [nvarchar](50) NULL,
	[Bronchiectasis] [nvarchar](50) NULL,
	[Bronchial_Wall_Thickening] [nvarchar](50) NULL,
	[Atelectasis] [nvarchar](50) NULL,
	[Mucous_Plugging] [nvarchar](50) NULL,
	[Air_Trapping] [nvarchar](50) NULL,
	[Opacity] [nvarchar](50) NULL,
	[Ground_Glass_Appearance] [nvarchar](50) NULL,
	[Other_Findings] [nvarchar](50) NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_cxr_tb] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[medication_tb]    Script Date: 2021-10-12 6:54:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medication_tb](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pt_id] [int] NULL,
	[pt_code] [nvarchar](50) NULL,
	[del] [bit] NULL,
	[p_none_ck] [bit] NULL,
	[p_Dornasealfa_ck] [bit] NULL,
	[p_Acetylcystein_ck] [bit] NULL,
	[p_Ibuprofen_ck] [bit] NULL,
	[p_salineLeukotriene_ck] [bit] NULL,
	[p_modifier_ck] [bit] NULL,
	[p_Mastcell_ck] [bit] NULL,
	[p_stabilizer_ck] [bit] NULL,
	[p_Antifungal_ck] [bit] NULL,
	[p_Steroid_oral_ck] [bit] NULL,
	[p_Steroid_inhaled_ck] [bit] NULL,
	[p_Steroid_Bronchodilator_ck] [bit] NULL,
	[p_inhaled_Shortacting_ck] [bit] NULL,
	[p_Longacting_anticholinergic_ck] [bit] NULL,
	[p_Betaagonist_ck] [bit] NULL,
	[p_others_ck] [bit] NULL,
	[p_other_name] [nvarchar](50) NULL,
	[Saline_concentration] [nvarchar](50) NULL,
	[non_p_Pancreat_ck] [bit] NULL,
	[non_p_Proton_ck] [bit] NULL,
	[non_p_CF_ck] [bit] NULL,
	[non_p_vitamin_ck] [bit] NULL,
	[non_p_Supplemental_ck] [bit] NULL,
	[c_none_ck] [bit] NULL,
	[c_CFRD_ck] [bit] NULL,
	[c_Liver_ck] [bit] NULL,
	[c_gall_ck] [bit] NULL,
	[c_ABPA_ck] [bit] NULL,
	[c_Asthma_ck] [bit] NULL,
	[c_DIOS_ck] [bit] NULL,
	[c_GERD_ck] [bit] NULL,
	[c_Nasa_ck] [bit] NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](50) NULL,
	[p_short_ck] [bit] NULL,
 CONSTRAINT [PK_medication_tb] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[microbiology_tb]    Script Date: 2021-10-12 6:54:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[microbiology_tb](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pt_id] [int] NULL,
	[pt_code] [nvarchar](50) NULL,
	[del] [bit] NULL,
	[bacterial] [nvarchar](50) NULL,
	[source_bacterial] [nvarchar](50) NULL,
	[other_source] [nvarchar](50) NULL,
	[microorganisms] [nvarchar](50) NULL,
	[Staphoylcoccus_ck] [bit] NULL,
	[sensitive_ck] [bit] NULL,
	[MRSA_ck] [bit] NULL,
	[Pseudomonas_ck] [bit] NULL,
	[Burkholderia_ck] [bit] NULL,
	[Stenotrophomonas_ck] [bit] NULL,
	[Alcaligenes_ck] [bit] NULL,
	[Aspergillus_ck] [bit] NULL,
	[Candida_ck] [bit] NULL,
	[other_microorganisms_culture_ck] [bit] NULL,
	[other_microorganisms_name] [nvarchar](50) NULL,
	[mycobacterial] [nvarchar](50) NULL,
	[source_mycrobacterial] [nvarchar](50) NULL,
	[other_mycobacterial] [nvarchar](50) NULL,
	[tuberculosis_ck] [bit] NULL,
	[abscessus_ck] [bit] NULL,
	[avium_ck] [bit] NULL,
	[other_mycobacteria_culture_ck] [bit] NULL,
	[none_ck] [bit] NULL,
	[other_myco_culture_name] [nvarchar](50) NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_microbiology_tb] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[patient_demographics]    Script Date: 2021-10-12 6:54:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patient_demographics](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[date_of_birth] [datetime] NULL,
	[gender] [nvarchar](50) NULL,
	[sweat_chloride] [nvarchar](50) NULL,
	[date_sweat_chloride] [datetime] NULL,
	[cftr_genotype_1] [nvarchar](50) NULL,
	[cftr_genotype_2] [nvarchar](50) NULL,
	[date_of_cftr] [datetime] NULL,
	[del] [bit] NULL,
	[user_name] [nvarchar](50) NULL,
	[user_id] [int] NULL,
	[pt_id] [int] NULL,
	[pt_code] [nvarchar](50) NULL,
 CONSTRAINT [PK_patient_demographics] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PFT_tb]    Script Date: 2021-10-12 6:54:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PFT_tb](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pt_id] [int] NULL,
	[pt_code] [nvarchar](50) NULL,
	[del] [bit] NULL,
	[PFT] [nvarchar](50) NULL,
	[r_Patient_refused_ck] [bit] NULL,
	[r_Availability_ofPFT_ck] [bit] NULL,
	[r_equipment_ck] [bit] NULL,
	[r_other_ck] [bit] NULL,
	[r_other_name] [nvarchar](50) NULL,
	[FEV1] [nvarchar](50) NULL,
	[FEV1_Predicted] [nvarchar](50) NULL,
	[FVC] [nvarchar](50) NULL,
	[FVC_Predicted] [nvarchar](50) NULL,
	[FEF25] [nvarchar](50) NULL,
	[FEF25_Predicted] [nvarchar](50) NULL,
	[FEV1_FVC_Ratio] [nvarchar](50) NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_PFT_tb] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[upload_tb]    Script Date: 2021-10-12 6:54:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[upload_tb](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[p_id] [int] NULL,
	[del] [bit] NULL,
	[img_tb] [nvarchar](max) NULL,
	[file_tb] [nvarchar](max) NULL,
	[p_name] [nvarchar](50) NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](50) NULL,
	[p_code] [nvarchar](50) NULL,
 CONSTRAINT [PK_upload_tb] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user]    Script Date: 2021-10-12 6:54:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[user_name] [nvarchar](50) NULL,
	[pass] [nvarchar](50) NULL,
	[del] [bit] NULL,
	[type] [nvarchar](50) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[visit_information_tb]    Script Date: 2021-10-12 6:54:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[visit_information_tb](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pt_id] [int] NULL,
	[pt_code] [nvarchar](50) NULL,
	[del] [bit] NULL,
	[date_of_visit] [datetime] NULL,
	[age] [nvarchar](50) NULL,
	[medecation] [nvarchar](max) NULL,
	[height] [nvarchar](50) NULL,
	[weight] [nvarchar](50) NULL,
	[pulmonary] [nvarchar](50) NULL,
	[airway] [nvarchar](50) NULL,
	[oral] [nvarchar](50) NULL,
	[days_treated_oral] [nvarchar](50) NULL,
	[date_treated_oral] [datetime] NULL,
	[inhaled] [nvarchar](50) NULL,
	[days_treated_inhaled] [nvarchar](50) NULL,
	[intravenous] [nvarchar](50) NULL,
	[days_treated_intravenou] [nvarchar](50) NULL,
	[hospitalized] [nvarchar](50) NULL,
	[date_hospitalized] [datetime] NULL,
	[hospital_Pulmonary_exacerbatio] [bit] NULL,
	[hospital_Pulmonary_complication] [bit] NULL,
	[hospital_Gastrointestinal] [bit] NULL,
	[hospital_Sinus] [bit] NULL,
	[hospital_other] [bit] NULL,
	[hospital_other_name] [nvarchar](50) NULL,
	[days_hospitalized] [nvarchar](50) NULL,
	[iv] [nvarchar](50) NULL,
	[reason_iv] [nvarchar](50) NULL,
	[iv_pulmonary] [bit] NULL,
	[iv_pulmonary_complication] [bit] NULL,
	[iv_Gastrointestinal] [bit] NULL,
	[iv_sinus] [bit] NULL,
	[iv_other] [bit] NULL,
	[iv_other_name] [nvarchar](50) NULL,
	[days_iv] [nvarchar](50) NULL,
	[user_id] [int] NULL,
	[user_name] [nvarchar](50) NULL,
	[reason_hospital] [nvarchar](50) NULL,
 CONSTRAINT [PK_visit_information_tb] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [drDB] SET  READ_WRITE 
GO

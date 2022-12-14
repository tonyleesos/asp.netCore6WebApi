USE [master]
GO
/****** Object:  Database [MVC_UserDB]    Script Date: 2018/4/25 下午 04:21:38 ******/
CREATE DATABASE [MVC_UserDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MVC_Guestbook', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\MVC_Guestbook.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MVC_Guestbook_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\MVC_Guestbook_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MVC_UserDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MVC_UserDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MVC_UserDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MVC_UserDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MVC_UserDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MVC_UserDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MVC_UserDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MVC_UserDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MVC_UserDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MVC_UserDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MVC_UserDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MVC_UserDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MVC_UserDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MVC_UserDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MVC_UserDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MVC_UserDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MVC_UserDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MVC_UserDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MVC_UserDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MVC_UserDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MVC_UserDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MVC_UserDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MVC_UserDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MVC_UserDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MVC_UserDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MVC_UserDB] SET  MULTI_USER 
GO
ALTER DATABASE [MVC_UserDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MVC_UserDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MVC_UserDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MVC_UserDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [MVC_UserDB]
GO
/****** Object:  Table [dbo].[UserTable]    Script Date: 2018/4/25 下午 04:21:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTable](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[UserSex] [nchar](1) NULL,
	[UserBirthDay] [datetime] NULL,
	[UserMobilePhone] [nvarchar](15) NULL,
 CONSTRAINT [PK_UserTable] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UserTable] ON 

INSERT [dbo].[UserTable] ([UserId], [UserName], [UserSex], [UserBirthDay], [UserMobilePhone]) VALUES (1, N'MIS2000 Lab.', N'M', CAST(N'1990-01-01T00:00:00.000' AS DateTime), N'0933123456')
INSERT [dbo].[UserTable] ([UserId], [UserName], [UserSex], [UserBirthDay], [UserMobilePhone]) VALUES (2, N'Billy Gates', N'M', CAST(N'1980-02-02T00:00:00.000' AS DateTime), N'0988123456')
INSERT [dbo].[UserTable] ([UserId], [UserName], [UserSex], [UserBirthDay], [UserMobilePhone]) VALUES (3, N'Steven Jobs', N'M', CAST(N'1980-03-03T00:00:00.000' AS DateTime), N'0977123777')
INSERT [dbo].[UserTable] ([UserId], [UserName], [UserSex], [UserBirthDay], [UserMobilePhone]) VALUES (4, N'神雕大俠', N'M', CAST(N'2010-10-01T00:00:00.000' AS DateTime), N'0977444444')
INSERT [dbo].[UserTable] ([UserId], [UserName], [UserSex], [UserBirthDay], [UserMobilePhone]) VALUES (5, N'MVC我愛你', N'F', CAST(N'2018-12-31T00:00:00.000' AS DateTime), N'0922999777')
INSERT [dbo].[UserTable] ([UserId], [UserName], [UserSex], [UserBirthDay], [UserMobilePhone]) VALUES (6, N'WebForm好兄弟', N'F', CAST(N'1923-02-03T00:00:00.000' AS DateTime), N'0923123123')
INSERT [dbo].[UserTable] ([UserId], [UserName], [UserSex], [UserBirthDay], [UserMobilePhone]) VALUES (7, N'ASP.NET MVC', N'M', CAST(N'1988-01-10T00:00:00.000' AS DateTime), N'0988555666')
INSERT [dbo].[UserTable] ([UserId], [UserName], [UserSex], [UserBirthDay], [UserMobilePhone]) VALUES (8, N'e-Taiwan', N'M', CAST(N'2001-04-04T00:00:00.000' AS DateTime), N'0944444444')
INSERT [dbo].[UserTable] ([UserId], [UserName], [UserSex], [UserBirthDay], [UserMobilePhone]) VALUES (9, N'Billy - Edison Arantes do Nascimento', N'M', CAST(N'1940-10-23T00:00:00.000' AS DateTime), N'0940010023')
INSERT [dbo].[UserTable] ([UserId], [UserName], [UserSex], [UserBirthDay], [UserMobilePhone]) VALUES (10, N'Stephen Jason', N'M', CAST(N'1970-07-07T00:00:00.000' AS DateTime), N'0977777777')
INSERT [dbo].[UserTable] ([UserId], [UserName], [UserSex], [UserBirthDay], [UserMobilePhone]) VALUES (11, N'ASP.NET Web Form', N'F', CAST(N'1980-01-23T00:00:00.000' AS DateTime), N'0980123111')
INSERT [dbo].[UserTable] ([UserId], [UserName], [UserSex], [UserBirthDay], [UserMobilePhone]) VALUES (12, N'Air Jordan Nike', N'M', CAST(N'1985-12-11T00:00:00.000' AS DateTime), N'0985012011')
INSERT [dbo].[UserTable] ([UserId], [UserName], [UserSex], [UserBirthDay], [UserMobilePhone]) VALUES (13, N'喬登艾爾', N'M', CAST(N'1996-06-06T00:00:00.000' AS DateTime), N'0996006006')
INSERT [dbo].[UserTable] ([UserId], [UserName], [UserSex], [UserBirthDay], [UserMobilePhone]) VALUES (14, N'Jeff Elon', N'M', CAST(N'2018-01-28T00:00:00.000' AS DateTime), N'0918001028')
INSERT [dbo].[UserTable] ([UserId], [UserName], [UserSex], [UserBirthDay], [UserMobilePhone]) VALUES (15, N'joker-jason', N'F', CAST(N'1955-05-15T00:00:00.000' AS DateTime), N'0955005115')
INSERT [dbo].[UserTable] ([UserId], [UserName], [UserSex], [UserBirthDay], [UserMobilePhone]) VALUES (16, N'Arthur Curry - Aquaman', N'M', CAST(N'1941-11-12T00:00:00.000' AS DateTime), N'0941011012')
INSERT [dbo].[UserTable] ([UserId], [UserName], [UserSex], [UserBirthDay], [UserMobilePhone]) VALUES (17, N'Diana Princess - Wonder Woman', N'F', CAST(N'1987-12-21T00:00:00.000' AS DateTime), N'0987012021')
INSERT [dbo].[UserTable] ([UserId], [UserName], [UserSex], [UserBirthDay], [UserMobilePhone]) VALUES (18, N'Batman - 蝙蝠俠', N'M', CAST(N'1966-06-06T00:00:00.000' AS DateTime), N'0966999666')
SET IDENTITY_INSERT [dbo].[UserTable] OFF
ALTER TABLE [dbo].[UserTable] ADD  CONSTRAINT [DF_UserTable_Sex]  DEFAULT (N'M') FOR [UserSex]
GO
USE [master]
GO
ALTER DATABASE [MVC_UserDB] SET  READ_WRITE 
GO

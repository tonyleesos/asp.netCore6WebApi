USE [MVC_UserLogin]
GO
/****** Object:  Table [dbo].[db_user]    Script Date: 2018/9/30 下午 03:06:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_user](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
	[UserRank] [int] NULL,
	[UserApproved] [char](1) NULL,
 CONSTRAINT [PK_db_user] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[db_UserRight]    Script Date: 2018/9/30 下午 03:06:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[db_UserRight](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
	[EMail] [nvarchar](50) NOT NULL,
	[EMail_MD5ID] [nvarchar](50) NULL,
	[EMail_GUID] [uniqueidentifier] NULL,
	[OldUserPassword] [nvarchar](100) NULL,
	[Enable_Time] [datetime] NULL,
	[UserRank] [int] NULL,
	[UserApproved] [nchar](1) NULL,
	[UpdateRight] [nchar](1) NULL,
	[DeleteRight] [nchar](1) NULL,
 CONSTRAINT [PK_db_UserRight_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[db_user] ON 

INSERT [dbo].[db_user] ([ID], [UserName], [UserPassword], [UserRank], [UserApproved]) VALUES (1, N'111', N'111', 1, N'N')
INSERT [dbo].[db_user] ([ID], [UserName], [UserPassword], [UserRank], [UserApproved]) VALUES (2, N'222', N'222', 2, N'N')
INSERT [dbo].[db_user] ([ID], [UserName], [UserPassword], [UserRank], [UserApproved]) VALUES (3, N'333', N'333', 1, N'N')
INSERT [dbo].[db_user] ([ID], [UserName], [UserPassword], [UserRank], [UserApproved]) VALUES (4, N'123', N'123', 1, N'N')
INSERT [dbo].[db_user] ([ID], [UserName], [UserPassword], [UserRank], [UserApproved]) VALUES (5, N'abc', N'abc', 1, N'N')
INSERT [dbo].[db_user] ([ID], [UserName], [UserPassword], [UserRank], [UserApproved]) VALUES (6, N'xyz', N'd16fb36f0911f878998c136191af705e', 0, NULL)
SET IDENTITY_INSERT [dbo].[db_user] OFF
SET IDENTITY_INSERT [dbo].[db_UserRight] ON 

INSERT [dbo].[db_UserRight] ([ID], [UserName], [UserPassword], [EMail], [EMail_MD5ID], [EMail_GUID], [OldUserPassword], [Enable_Time], [UserRank], [UserApproved], [UpdateRight], [DeleteRight]) VALUES (1, N'111', N'111', N'111@111.com', NULL, N'915f45d7-11e4-49e9-b30d-8d5e9811f4d4', NULL, CAST(N'2018-01-04T00:00:00.000' AS DateTime), 1, N'N', N'N', N'N')
INSERT [dbo].[db_UserRight] ([ID], [UserName], [UserPassword], [EMail], [EMail_MD5ID], [EMail_GUID], [OldUserPassword], [Enable_Time], [UserRank], [UserApproved], [UpdateRight], [DeleteRight]) VALUES (2, N'222', N'222', N'222@222.com', NULL, N'00000000-0000-0000-0000-000000000000', N'222 ;;; ', CAST(N'2018-12-29T14:40:14.483' AS DateTime), 1, N'N', N'N', N'N')
INSERT [dbo].[db_UserRight] ([ID], [UserName], [UserPassword], [EMail], [EMail_MD5ID], [EMail_GUID], [OldUserPassword], [Enable_Time], [UserRank], [UserApproved], [UpdateRight], [DeleteRight]) VALUES (3, N'333', N'333', N'333@333.com', NULL, N'd7c7c427-73b4-41a7-a167-fe36b0b3a14f', N'333 ;;; ', CAST(N'2018-12-29T15:00:12.993' AS DateTime), 1, N'N', N'N', N'N')
INSERT [dbo].[db_UserRight] ([ID], [UserName], [UserPassword], [EMail], [EMail_MD5ID], [EMail_GUID], [OldUserPassword], [Enable_Time], [UserRank], [UserApproved], [UpdateRight], [DeleteRight]) VALUES (4, N'444', N'444', N'444@333.com', NULL, N'9808e961-3dcf-45fc-9f38-29e946442aae', N'444 ;;; ', CAST(N'2018-12-29T15:01:42.837' AS DateTime), 1, N'N', N'N', N'N')
SET IDENTITY_INSERT [dbo].[db_UserRight] OFF
ALTER TABLE [dbo].[db_user] ADD  CONSTRAINT [DF_db_user_UserRank]  DEFAULT ((1)) FOR [UserRank]
GO
ALTER TABLE [dbo].[db_user] ADD  CONSTRAINT [DF_db_user_UserApproved]  DEFAULT ('N') FOR [UserApproved]
GO
ALTER TABLE [dbo].[db_UserRight] ADD  CONSTRAINT [DF_db_UserRight_EMail_ID]  DEFAULT (newid()) FOR [EMail_GUID]
GO
ALTER TABLE [dbo].[db_UserRight] ADD  CONSTRAINT [DF_db_UserRight_UserRank]  DEFAULT ((1)) FOR [UserRank]
GO
ALTER TABLE [dbo].[db_UserRight] ADD  CONSTRAINT [DF_db_UserRight_UserApproved]  DEFAULT (N'N') FOR [UserApproved]
GO
ALTER TABLE [dbo].[db_UserRight] ADD  CONSTRAINT [DF_db_UserRight_UpdateRight]  DEFAULT (N'N') FOR [UpdateRight]
GO
ALTER TABLE [dbo].[db_UserRight] ADD  CONSTRAINT [DF_db_UserRight_DeleteRight]  DEFAULT (N'N') FOR [DeleteRight]
GO

/****************************************************/
/* Update sql for ServerExt creted by Vanganth 2011 */
/****************************************************/

USE lin2world	-- Change it to your current lin2world if it's not lin2world by default --
GO

CREATE TABLE user_SchemeBuffer
(
	char_id int not null,
	subjob_id int not null default 0,
	summon int not null default 0,
	s0 int not null default 0,
	s1 int not null default 0,
	s2 int not null default 0,
	s3 int not null default 0,
	s4 int not null default 0,
	s5 int not null default 0,
	s6 int not null default 0,
	s7 int not null default 0,
	s8 int not null default 0,
	s9 int not null default 0,
	s10 int not null default 0,
	s11 int not null default 0,
	s12 int not null default 0,
	s13 int not null default 0,
	s14 int not null default 0,
	s15 int not null default 0,
	s16 int not null default 0,
	s17 int not null default 0,
	s18 int not null default 0,
	s19 int not null default 0,
	s20 int not null default 0,
	s21 int not null default 0,
	s22 int not null default 0,
	s23 int not null default 0,
	s24 int not null default 0,
	s25 int not null default 0,
	s26 int not null default 0,
	s27 int not null default 0,
	s28 int not null default 0,
	s29 int not null default 0,
	s30 int not null default 0,
	s31 int not null default 0,
	s32 int not null default 0,
	s33 int not null default 0,
	s34 int not null default 0,
	s35 int not null default 0,
	s36 int not null default 0,
	s37 int not null default 0,
	s38 int not null default 0,
	s39 int not null default 0
)
GO

CREATE PROCEDURE lin_HaveSchemeBufferList
	@char_id AS INT,
	@subjob_id AS INT,
	@summon AS INT
AS
BEGIN

	SET NOCOUNT ON;

	SELECT COUNT(*) FROM user_SchemeBuffer WHERE char_id = @char_id AND subjob_id = @subjob_id AND summon = @summon

END
GO

CREATE PROCEDURE lin_CreateSchemeBufferList
	@char_id AS INT,
	@subjob_id AS INT,
	@summon AS INT,
	@s0 AS INT,
	@s1 AS INT,
	@s2 AS INT,
	@s3 AS INT,
	@s4 AS INT,
	@s5 AS INT,
	@s6 AS INT,
	@s7 AS INT,
	@s8 AS INT,
	@s9 AS INT,
	@s10 AS INT,
	@s11 AS INT,
	@s12 AS INT,
	@s13 AS INT,
	@s14 AS INT,
	@s15 AS INT,
	@s16 AS INT,
	@s17 AS INT,
	@s18 AS INT,
	@s19 AS INT,
	@s20 AS INT,
	@s21 AS INT,
	@s22 AS INT,
	@s23 AS INT,
	@s24 AS INT,
	@s25 AS INT,
	@s26 AS INT,
	@s27 AS INT,
	@s28 AS INT,
	@s29 AS INT,
	@s30 AS INT,
	@s31 AS INT,
	@s32 AS INT,
	@s33 AS INT,
	@s34 AS INT,
	@s35 AS INT,
	@s36 AS INT,
	@s37 AS INT,
	@s38 AS INT,
	@s39 AS INT
AS
BEGIN

	SET NOCOUNT ON;

	INSERT INTO user_SchemeBuffer( char_id, subjob_id, summon, s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17,s18, s19, s20, s21, s22, s23, s24, s25, s26, s27, s28, s29, s30, s31, s32, s33,s34, s35, s36, s37, s38, s39)
	VALUES ( @char_id, @subjob_id, @summon, @s0, @s1, @s2, @s3, @s4, @s5, @s6, @s7, @s8, @s9, @s10, @s11, @s12, @s13, @s14, @s15, @s16, @s17, @s18, @s19, @s20, @s21, @s22, @s23, @s24, @s25, @s26, @s27, @s28, @s29, @s30, @s31, @s32, @s33, @s34, @s35, @s36, @s37, @s38, @s39)

END
GO

CREATE PROCEDURE lin_UpdateSchemeBufferList
	@char_id AS INT,
	@subjob_id AS INT,
	@summon AS INT,
	@s0 AS INT,
	@s1 AS INT,
	@s2 AS INT,
	@s3 AS INT,
	@s4 AS INT,
	@s5 AS INT,
	@s6 AS INT,
	@s7 AS INT,
	@s8 AS INT,
	@s9 AS INT,
	@s10 AS INT,
	@s11 AS INT,
	@s12 AS INT,
	@s13 AS INT,
	@s14 AS INT,
	@s15 AS INT,
	@s16 AS INT,
	@s17 AS INT,
	@s18 AS INT,
	@s19 AS INT,
	@s20 AS INT,
	@s21 AS INT,
	@s22 AS INT,
	@s23 AS INT,
	@s24 AS INT,
	@s25 AS INT,
	@s26 AS INT,
	@s27 AS INT,
	@s28 AS INT,
	@s29 AS INT,
	@s30 AS INT,
	@s31 AS INT,
	@s32 AS INT,
	@s33 AS INT,
	@s34 AS INT,
	@s35 AS INT,
	@s36 AS INT,
	@s37 AS INT,
	@s38 AS INT,
	@s39 AS INT
AS
BEGIN

	SET NOCOUNT ON;

	UPDATE user_SchemeBuffer SET s0 = @s0, s1 = @s1, s2 = @s2, s3 = @s3, s4 = @s4, s5 = @s5, s6 = @s6, s7 = @s7, s8 = @s8, s9 = @s9, s10 = @s10, s11 = @s11, s12 = @s12, s13 = @s13, s14 = @s14, s15 = @s15, s16 = @s16, s17 = @s17, s18 = @s18, s19 = @s19, s20 = @s20, s21 = @s21, s22 = @s22, s23 = @s23, s24 = @s24, s25 = @s25, s26 = @s26, s27 = @s27, s28 = @s28, s29 = @s29, s30 = @s30, s31 = @s31, s32 = @s32, s33 = @s33, s34 = @s34, s35 = @s35, s36 = @s36, s37 = @s37, s38 = @s38, s39 = @s39 WHERE char_id = @char_id AND subjob_id = @subjob_id AND summon = @summon

END
GO

CREATE PROCEDURE lin_LoadSchemeBufferList
	@char_id AS INT,
	@subjob_id AS INT,
	@summon AS INT
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20, s21, s22, s23, s24, s25, s26, s27, s28, s29, s30, s31, s32, s33, s34, s35, s36, s37, s38, s39 FROM user_SchemeBuffer WHERE char_id = @char_id AND subjob_id = @subjob_id AND summon = @summon

END
GO

CREATE PROCEDURE lin_DeleteSchemeBufferList
	@char_id AS INT
AS
BEGIN

	SET NOCOUNT ON;
	
	DELETE FROM user_SchemeBuffer WHERE char_id = @char_id

END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE [dbo].[user_ActiveSkill]
GO
CREATE TABLE [dbo].[user_ActiveSkill](
	[char_id] [int] NOT NULL,
	[s1] [int] NULL,
	[l1] [int] NULL,
	[d1] [int] NULL,
	[s2] [int] NULL,
	[l2] [int] NULL,
	[d2] [int] NULL,
	[s3] [int] NULL,
	[l3] [int] NULL,
	[d3] [int] NULL,
	[s4] [int] NULL,
	[l4] [int] NULL,
	[d4] [int] NULL,
	[s5] [int] NULL,
	[l5] [int] NULL,
	[d5] [int] NULL,
	[s6] [int] NULL,
	[l6] [int] NULL,
	[d6] [int] NULL,
	[s7] [int] NULL,
	[l7] [int] NULL,
	[d7] [int] NULL,
	[s8] [int] NULL,
	[l8] [int] NULL,
	[d8] [int] NULL,
	[s9] [int] NULL,
	[l9] [int] NULL,
	[d9] [int] NULL,
	[s10] [int] NULL,
	[l10] [int] NULL,
	[d10] [int] NULL,
	[s11] [int] NULL,
	[l11] [int] NULL,
	[d11] [int] NULL,
	[s12] [int] NULL,
	[l12] [int] NULL,
	[d12] [int] NULL,
	[s13] [int] NULL,
	[l13] [int] NULL,
	[d13] [int] NULL,
	[s14] [int] NULL,
	[l14] [int] NULL,
	[d14] [int] NULL,
	[s15] [int] NULL,
	[l15] [int] NULL,
	[d15] [int] NULL,
	[s16] [int] NULL,
	[l16] [int] NULL,
	[d16] [int] NULL,
	[s17] [int] NULL,
	[l17] [int] NULL,
	[d17] [int] NULL,
	[s18] [int] NULL,
	[l18] [int] NULL,
	[d18] [int] NULL,
	[s19] [int] NULL,
	[l19] [int] NULL,
	[d19] [int] NULL,
	[s20] [int] NULL,
	[l20] [int] NULL,
	[d20] [int] NULL,
	[s21] [int] NULL,
	[l21] [int] NULL,
	[d21] [int] NULL,
	[s22] [int] NULL,
	[l22] [int] NULL,
	[d22] [int] NULL,
	[s23] [int] NULL,
	[l23] [int] NULL,
	[d23] [int] NULL,
	[s24] [int] NULL,
	[l24] [int] NULL,
	[d24] [int] NULL,
	[s25] [int] NULL,
	[l25] [int] NULL,
	[d25] [int] NULL,
	[s26] [int] NULL,
	[l26] [int] NULL,
	[d26] [int] NULL,
	[s27] [int] NULL,
	[l27] [int] NULL,
	[d27] [int] NULL,
	[s28] [int] NULL,
	[l28] [int] NULL,
	[d28] [int] NULL,
	[s29] [int] NULL,
	[l29] [int] NULL,
	[d29] [int] NULL,
	[s30] [int] NULL,
	[l30] [int] NULL,
	[d30] [int] NULL,
	[s31] [int] NULL,
	[l31] [int] NULL,
	[d31] [int] NULL,
	[s32] [int] NULL,
	[l32] [int] NULL,
	[d32] [int] NULL,
	[s33] [int] NULL,
	[l33] [int] NULL,
	[d33] [int] NULL,
	[s34] [int] NULL,
	[l34] [int] NULL,
	[d34] [int] NULL,
	[s35] [int] NULL,
	[l35] [int] NULL,
	[d35] [int] NULL,
	[s36] [int] NULL,
	[l36] [int] NULL,
	[d36] [int] NULL,
	[s37] [int] NULL,
	[l37] [int] NULL,
	[d37] [int] NULL,
	[s38] [int] NULL,
	[l38] [int] NULL,
	[d38] [int] NULL,
	[s39] [int] NULL,
	[l39] [int] NULL,
	[d39] [int] NULL,
	[s40] [int] NULL,
	[l40] [int] NULL,
	[d40] [int] NULL,
	[s41] [int] NULL,
	[l41] [int] NULL,
	[d41] [int] NULL,
	[s42] [int] NULL,
	[l42] [int] NULL,
	[d42] [int] NULL,
	[s43] [int] NULL,
	[l43] [int] NULL,
	[d43] [int] NULL,
	[s44] [int] NULL,
	[l44] [int] NULL,
	[d44] [int] NULL,
	[s45] [int] NULL,
	[l45] [int] NULL,
	[d45] [int] NULL,
	[s46] [int] NULL,
	[l46] [int] NULL,
	[d46] [int] NULL,
	[c1] [int] NULL,
	[c2] [int] NULL,
	[c3] [int] NULL,
	[c4] [int] NULL,
	[c5] [int] NULL,
	[c6] [int] NULL,
	[c7] [int] NULL,
	[c8] [int] NULL,
	[c9] [int] NULL,
	[c10] [int] NULL,
	[c11] [int] NULL,
	[c12] [int] NULL,
	[c13] [int] NULL,
	[c14] [int] NULL,
	[c15] [int] NULL,
	[c16] [int] NULL,
	[c17] [int] NULL,
	[c18] [int] NULL,
	[c19] [int] NULL,
	[c20] [int] NULL,
	[c21] [int] NULL,
	[c22] [int] NULL,
	[c23] [int] NULL,
	[c24] [int] NULL,
	[c25] [int] NULL,
	[c26] [int] NULL,
	[c27] [int] NULL,
	[c28] [int] NULL,
	[c29] [int] NULL,
	[c30] [int] NULL,
	[c31] [int] NULL,
	[c32] [int] NULL,
	[c33] [int] NULL,
	[c34] [int] NULL,
	[c35] [int] NULL,
	[c36] [int] NULL,
	[c37] [int] NULL,
	[c38] [int] NULL,
	[c39] [int] NULL,
	[c40] [int] NULL,
	[c41] [int] NULL,
	[c42] [int] NULL,
	[c43] [int] NULL,
	[c44] [int] NULL,
	[c45] [int] NULL,
	[c46] [int] NULL
) ON [PRIMARY]

go

drop procedure lin_CreateActiveSkill
go

CREATE PROCEDURE [dbo].[lin_CreateActiveSkill]
(
 @char_id INT,
 @s1 INT, @l1 int, @d1 INT, @c1 int,
 @s2 INT, @l2 int, @d2 INT, @c2 int,
 @s3 INT, @l3 int, @d3 INT, @c3 int,
 @s4 INT, @l4 int, @d4 INT, @c4 int,
 @s5 INT, @l5 int, @d5 INT, @c5 int,
 @s6 INT, @l6 int, @d6 INT, @c6 int,
 @s7 INT, @l7 int, @d7 INT, @c7 int,
 @s8 INT, @l8 int, @d8 INT, @c8 int,
 @s9 INT, @l9 int, @d9 INT, @c9 int,
 @s10 INT, @l10 int, @d10 INT, @c10 int,
 @s11 INT, @l11 int, @d11 INT, @c11 int,
 @s12 INT, @l12 int, @d12 INT, @c12 int,
 @s13 INT, @l13 int, @d13 INT, @c13 int,
 @s14 INT, @l14 int, @d14 INT, @c14 int,
 @s15 INT, @l15 int, @d15 INT, @c15 int,
 @s16 INT, @l16 int, @d16 INT, @c16 int,
 @s17 INT, @l17 int, @d17 INT, @c17 int,
 @s18 INT, @l18 int, @d18 INT, @c18 int,
 @s19 INT, @l19 int, @d19 INT, @c19 int,
 @s20 INT, @l20 int, @d20 INT, @c20 int,
 @s21 INT, @l21 int, @d21 INT, @c21 int,
 @s22 INT, @l22 int, @d22 INT, @c22 int,
 @s23 INT, @l23 int, @d23 INT, @c23 int,
 @s24 INT, @l24 int, @d24 INT, @c24 int,
 @s25 INT, @l25 int, @d25 INT, @c25 int,
 @s26 INT, @l26 int, @d26 INT, @c26 int,
 @s27 INT, @l27 int, @d27 INT, @c27 int,
 @s28 INT, @l28 int, @d28 INT, @c28 int,
 @s29 INT, @l29 int, @d29 INT, @c29 int,
 @s30 INT, @l30 int, @d30 INT, @c30 int,
 @s31 INT, @l31 int, @d31 INT, @c31 int,
 @s32 INT, @l32 int, @d32 INT, @c32 int,
 @s33 INT, @l33 int, @d33 INT, @c33 int,
 @s34 INT, @l34 int, @d34 INT, @c34 int,
 @s35 INT, @l35 int, @d35 INT, @c35 int,
 @s36 INT, @l36 int, @d36 INT, @c36 int,
 @s37 INT, @l37 int, @d37 INT, @c37 int,
 @s38 INT, @l38 int, @d38 INT, @c38 int,
 @s39 INT, @l39 int, @d39 INT, @c39 int,
 @s40 INT, @l40 int, @d40 INT, @c40 int,
 @s41 INT, @l41 int, @d41 INT, @c41 int,
 @s42 INT, @l42 int, @d42 INT, @c42 int,
 @s43 INT, @l43 int, @d43 INT, @c43 int,
 @s44 INT, @l44 int, @d44 INT, @c44 int,
 @s45 INT, @l45 int, @d45 INT, @c45 int,
 @s46 INT, @l46 int, @d46 INT, @c46 int
)
AS
SET NOCOUNT ON

 INSERT INTO user_activeskill
 (char_id,
 s1, l1, d1, c1,
 s2, l2, d2, c2,
 s3, l3, d3, c3,
 s4, l4, d4, c4,
 s5, l5, d5, c5,
 s6, l6, d6, c6,
 s7, l7, d7, c7,
 s8, l8, d8, c8,
 s9, l9, d9, c9,
 s10, l10, d10, c10,
 s11, l11, d11, c11,
 s12, l12, d12, c12,
 s13, l13, d13, c13,
 s14, l14, d14, c14,
 s15, l15, d15, c15,
 s16, l16, d16, c16,
 s17, l17, d17, c17,
 s18, l18, d18, c18,
 s19, l19, d19, c19,
 s20, l20, d20, c20,
 s21, l21, d21, c21,
 s22, l22, d22, c22,
 s23, l23, d23, c23,
 s24, l24, d24, c24,
 s25, l25, d25, c25,
 s26, l26, d26, c26,
 s27, l27, d27, c27,
 s28, l28, d28, c28,
 s29, l29, d29, c29,
 s30, l30, d30, c30,
 s31, l31, d31, c31,
 s32, l32, d32, c32,
 s33, l33, d33, c33,
 s34, l34, d34, c34,
 s35, l35, d35, c35,
 s36, l36, d36, c36,
 s37, l37, d37, c37,
 s38, l38, d38, c38,
 s39, l39, d39, c39,
 s40, l40, d40, c40,
 s41, l41, d41, c41,
 s42, l42, d42, c42,
 s43, l43, d43, c43,
 s44, l44, d44, c44,
 s45, l45, d45, c45,
 s46, l46, d46, c46
 )
 VALUES
 (@char_id,
 @s1, @l1, @d1, @c1,
 @s2, @l2, @d2, @c2,
 @s3, @l3, @d3, @c3,
 @s4, @l4, @d4, @c4,
 @s5, @l5, @d5, @c5,
 @s6, @l6, @d6, @c6,
 @s7, @l7, @d7, @c7,
 @s8, @l8, @d8, @c8,
 @s9, @l9, @d9, @c9,
 @s10, @l10, @d10, @c10,
 @s11, @l11, @d11, @c11,
 @s12, @l12, @d12, @c12,
 @s13, @l13, @d13, @c13,
 @s14, @l14, @d14, @c14,
 @s15, @l15, @d15, @c15,
 @s16, @l16, @d16, @c16,
 @s17, @l17, @d17, @c17,
 @s18, @l18, @d18, @c18,
 @s19, @l19, @d19, @c19,
 @s20, @l20, @d20, @c20,
 @s21, @l21, @d21, @c21,
 @s22, @l22, @d22, @c22,
 @s23, @l23, @d23, @c23,
 @s24, @l24, @d24, @c24,
 @s25, @l25, @d25, @c25,
 @s26, @l26, @d26, @c26,
 @s27, @l27, @d27, @c27,
 @s28, @l28, @d28, @c28,
 @s29, @l29, @d29, @c29,
 @s30, @l30, @d30, @c30,
 @s31, @l31, @d31, @c31,
 @s32, @l32, @d32, @c32,
 @s33, @l33, @d33, @c33,
 @s34, @l34, @d34, @c34,
 @s35, @l35, @d35, @c35,
 @s36, @l36, @d36, @c36,
 @s37, @l37, @d37, @c37, 
 @s38, @l38, @d38, @c38, 
 @s39, @l39, @d39, @c39, 
 @s40, @l40, @d40, @c40,
 @s41, @l41, @d41, @c41,
 @s42, @l42, @d42, @c42,
 @s43, @l43, @d43, @c43,
 @s44, @l44, @d44, @c44,
 @s45, @l45, @d45, @c45,
 @s46, @l46, @d46, @c46
   )
 
 go


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vanganth
-- Create date: 
-- Description:	Procedure for new func RequestLoadAbnormalStatus
-- =============================================

IF EXISTS (SELECT 1 
    FROM sys.procedures
    WHERE [name]='lin_GetActiveSkills') 
        drop procedure lin_GetActiveSkills
go

CREATE PROCEDURE lin_GetActiveSkills 
	-- Add the parameters for the stored procedure here
	@char_id AS INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [s1]
      ,[l1]
      ,[d1]
      ,[s2]
      ,[l2]
      ,[d2]
      ,[s3]
      ,[l3]
      ,[d3]
      ,[s4]
      ,[l4]
      ,[d4]
      ,[s5]
      ,[l5]
      ,[d5]
      ,[s6]
      ,[l6]
      ,[d6]
      ,[s7]
      ,[l7]
      ,[d7]
      ,[s8]
      ,[l8]
      ,[d8]
      ,[s9]
      ,[l9]
      ,[d9]
      ,[s10]
      ,[l10]
      ,[d10]
      ,[s11]
      ,[l11]
      ,[d11]
      ,[s12]
      ,[l12]
      ,[d12]
      ,[s13]
      ,[l13]
      ,[d13]
      ,[s14]
      ,[l14]
      ,[d14]
      ,[s15]
      ,[l15]
      ,[d15]
      ,[s16]
      ,[l16]
      ,[d16]
      ,[s17]
      ,[l17]
      ,[d17]
      ,[s18]
      ,[l18]
      ,[d18]
      ,[s19]
      ,[l19]
      ,[d19]
      ,[s20]
      ,[l20]
      ,[d20]
      ,[s21]
      ,[l21]
      ,[d21]
      ,[s22]
      ,[l22]
      ,[d22]
      ,[s23]
      ,[l23]
      ,[d23]
      ,[s24]
      ,[l24]
      ,[d24]
      ,[s25]
      ,[l25]
      ,[d25]
      ,[s26]
      ,[l26]
      ,[d26]
      ,[s27]
      ,[l27]
      ,[d27]
      ,[s28]
      ,[l28]
      ,[d28]
      ,[s29]
      ,[l29]
      ,[d29]
      ,[s30]
      ,[l30]
      ,[d30]
      ,[s31]
      ,[l31]
      ,[d31]
      ,[s32]
      ,[l32]
      ,[d32]
      ,[s33]
      ,[l33]
      ,[d33]
      ,[s34]
      ,[l34]
      ,[d34]
      ,[s35]
      ,[l35]
      ,[d35]
      ,[s36]
      ,[l36]
      ,[d36]
      ,[s37]
      ,[l37]
      ,[d37]
      ,[s38]
      ,[l38]
      ,[d38]
      ,[s39]
      ,[l39]
      ,[d39]
      ,[s40]
      ,[l40]
      ,[d40]
      ,[s41]
      ,[l41]
      ,[d41]
      ,[s42]
      ,[l42]
      ,[d42]
      ,[s43]
      ,[l43]
      ,[d43]
      ,[s44]
      ,[l44]
      ,[d44]
      ,[s45]
      ,[l45]
      ,[d45]
      ,[s46]
      ,[l46]
      ,[d46]
      ,[c1]
      ,[c2]
      ,[c3]
      ,[c4]
      ,[c5]
      ,[c6]
      ,[c7]
      ,[c8]
      ,[c9]
      ,[c10]
      ,[c11]
      ,[c12]
      ,[c13]
      ,[c14]
      ,[c15]
      ,[c16]
      ,[c17]
      ,[c18]
      ,[c19]
      ,[c20]
      ,[c21]
      ,[c22]
      ,[c23]
      ,[c24]
      ,[c25]
      ,[c26]
      ,[c27]
      ,[c28]
      ,[c29]
      ,[c30]
      ,[c31]
      ,[c32]
      ,[c33]
      ,[c34]
      ,[c35]
      ,[c36]
      ,[c37]
      ,[c38]
      ,[c39]
      ,[c40]
      ,[c41]
      ,[c42]
      ,[c43]
      ,[c44]
      ,[c45]
      ,[c46]
	FROM [dbo].[user_ActiveSkill] WHERE char_id = @char_id
END
GO

drop procedure lin_UpdateActiveSkill
go
-- =============================================
-- Author:		Vanganth
-- Create date: 
-- Description:	Procedure for new func RequestSaveAbnormalStatus
-- =============================================
CREATE PROCEDURE lin_UpdateActiveSkill 
(
 @char_id INT,
 @s1 INT, @l1 int, @d1 INT, @c1 int,
 @s2 INT, @l2 int, @d2 INT, @c2 int,
 @s3 INT, @l3 int, @d3 INT, @c3 int,
 @s4 INT, @l4 int, @d4 INT, @c4 int,
 @s5 INT, @l5 int, @d5 INT, @c5 int,
 @s6 INT, @l6 int, @d6 INT, @c6 int,
 @s7 INT, @l7 int, @d7 INT, @c7 int,
 @s8 INT, @l8 int, @d8 INT, @c8 int,
 @s9 INT, @l9 int, @d9 INT, @c9 int,
 @s10 INT, @l10 int, @d10 INT, @c10 int,
 @s11 INT, @l11 int, @d11 INT, @c11 int,
 @s12 INT, @l12 int, @d12 INT, @c12 int,
 @s13 INT, @l13 int, @d13 INT, @c13 int,
 @s14 INT, @l14 int, @d14 INT, @c14 int,
 @s15 INT, @l15 int, @d15 INT, @c15 int,
 @s16 INT, @l16 int, @d16 INT, @c16 int,
 @s17 INT, @l17 int, @d17 INT, @c17 int,
 @s18 INT, @l18 int, @d18 INT, @c18 int,
 @s19 INT, @l19 int, @d19 INT, @c19 int,
 @s20 INT, @l20 int, @d20 INT, @c20 int,
 @s21 INT, @l21 int, @d21 INT, @c21 int,
 @s22 INT, @l22 int, @d22 INT, @c22 int,
 @s23 INT, @l23 int, @d23 INT, @c23 int,
 @s24 INT, @l24 int, @d24 INT, @c24 int,
 @s25 INT, @l25 int, @d25 INT, @c25 int,
 @s26 INT, @l26 int, @d26 INT, @c26 int,
 @s27 INT, @l27 int, @d27 INT, @c27 int,
 @s28 INT, @l28 int, @d28 INT, @c28 int,
 @s29 INT, @l29 int, @d29 INT, @c29 int,
 @s30 INT, @l30 int, @d30 INT, @c30 int,
 @s31 INT, @l31 int, @d31 INT, @c31 int,
 @s32 INT, @l32 int, @d32 INT, @c32 int,
 @s33 INT, @l33 int, @d33 INT, @c33 int,
 @s34 INT, @l34 int, @d34 INT, @c34 int,
 @s35 INT, @l35 int, @d35 INT, @c35 int,
 @s36 INT, @l36 int, @d36 INT, @c36 int,
 @s37 INT, @l37 int, @d37 INT, @c37 int,
 @s38 INT, @l38 int, @d38 INT, @c38 int,
 @s39 INT, @l39 int, @d39 INT, @c39 int,
 @s40 INT, @l40 int, @d40 INT, @c40 int,
 @s41 INT, @l41 int, @d41 INT, @c41 int,
 @s42 INT, @l42 int, @d42 INT, @c42 int,
 @s43 INT, @l43 int, @d43 INT, @c43 int,
 @s44 INT, @l44 int, @d44 INT, @c44 int,
 @s45 INT, @l45 int, @d45 INT, @c45 int,
 @s46 INT, @l46 int, @d46 INT, @c46 int
)
AS
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
IF EXISTS(SELECT * FROM user_activeskill WHERE char_id = @char_id)
BEGIN
 UPDATE user_activeskill
 SET
 s1 = @s1, l1 = @l1, d1 = @d1, c1 = @c1,
 s2 = @s2, l2 = @l2, d2 = @d2, c2 = @c2,
 s3 = @s3, l3 = @l3, d3 = @d3, c3 = @c3,
 s4 = @s4, l4 = @l4, d4 = @d4, c4 = @c4,
 s5 = @s5, l5 = @l5, d5 = @d5, c5 = @c5,
 s6 = @s6, l6 = @l6, d6 = @d6, c6 = @c6,
 s7 = @s7, l7 = @l7, d7 = @d7, c7 = @c7,
 s8 = @s8, l8 = @l8, d8 = @d8, c8 = @c8,
 s9 = @s9, l9 = @l9, d9 = @d9, c9 = @c9,
 s10 = @s10, l10 = @l10, d10 = @d10, c10 = @c10,
 s11 = @s11, l11 = @l11, d11 = @d11, c11 = @c11,
 s12 = @s12, l12 = @l12, d12 = @d12, c12 = @c12,
 s13 = @s13, l13 = @l13, d13 = @d13, c13 = @c13,
 s14 = @s14, l14 = @l14, d14 = @d14, c14 = @c14,
 s15 = @s15, l15 = @l15, d15 = @d15, c15 = @c15,
 s16 = @s16, l16 = @l16, d16 = @d16, c16 = @c16,
 s17 = @s17, l17 = @l17, d17 = @d17, c17 = @c17,
 s18 = @s18, l18 = @l18, d18 = @d18, c18 = @c18,
 s19 = @s19, l19 = @l19, d19 = @d19, c19 = @c19,
 s20 = @s20, l20 = @l20, d20 = @d20, c20 = @c20,
 s21 = @s21, l21 = @l21, d21 = @d21, c21 = @c21,
 s22 = @s22, l22 = @l22, d22 = @d22, c22 = @c22,
 s23 = @s23, l23 = @l23, d23 = @d23, c23 = @c23,
 s24 = @s24, l24 = @l24, d24 = @d24, c24 = @c24,
 s25 = @s25, l25 = @l25, d25 = @d25, c25 = @c25,
 s26 = @s26, l26 = @l26, d26 = @d26, c26 = @c26,
 s27 = @s27, l27 = @l27, d27 = @d27, c27 = @c27,
 s28 = @s28, l28 = @l28, d28 = @d28, c28 = @c28,
 s29 = @s29, l29 = @l29, d29 = @d29, c29 = @c29,
 s30 = @s30, l30 = @l30, d30 = @d30, c30 = @c30,
 s31 = @s31, l31 = @l31, d31 = @d31, c31 = @c31,
 s32 = @s32, l32 = @l32, d32 = @d32, c32 = @c32,
 s33 = @s33, l33 = @l33, d33 = @d33, c33 = @c33,
 s34 = @s34, l34 = @l34, d34 = @d34, c34 = @c34,
 s35 = @s35, l35 = @l35, d35 = @d35, c35 = @c35,
 s36 = @s36, l36 = @l36, d36 = @d36, c36 = @c36,
 s37 = @s37, l37 = @l37, d37 = @d37, c37 = @c37,
 s38 = @s38, l38 = @l38, d38 = @d38, c38 = @c38,
 s39 = @s39, l39 = @l39, d39 = @d39, c39 = @c39,
 s40 = @s40, l40 = @l40, d40 = @d40, c40 = @c40,
 s41 = @s41, l41 = @l41, d41 = @d41, c41 = @c41,
 s42 = @s42, l42 = @l42, d42 = @d42, c42 = @c42,
 s43 = @s43, l43 = @l43, d43 = @d43, c43 = @c43,
 s44 = @s44, l44 = @l44, d44 = @d44, c44 = @c44,
 s45 = @s45, l45 = @l45, d45 = @d45, c45 = @c45,
 s46 = @s46, l46 = @l46, d46 = @d46, c46 = @c46
 WHERE char_id = @char_id
END  
ELSE
BEGIN  
 INSERT INTO user_activeskill
 (char_id,
 s1, l1, d1, c1,
 s2, l2, d2, c2,
 s3, l3, d3, c3,
 s4, l4, d4, c4,
 s5, l5, d5, c5,
 s6, l6, d6, c6,
 s7, l7, d7, c7,
 s8, l8, d8, c8,
 s9, l9, d9, c9,
 s10, l10, d10, c10,
 s11, l11, d11, c11,
 s12, l12, d12, c12,
 s13, l13, d13, c13,
 s14, l14, d14, c14,
 s15, l15, d15, c15,
 s16, l16, d16, c16,
 s17, l17, d17, c17,
 s18, l18, d18, c18,
 s19, l19, d19, c19,
 s20, l20, d20, c20,
 s21, l21, d21, c21,
 s22, l22, d22, c22,
 s23, l23, d23, c23,
 s24, l24, d24, c24,
 s25, l25, d25, c25,
 s26, l26, d26, c26,
 s27, l27, d27, c27,
 s28, l28, d28, c28,
 s29, l29, d29, c29,
 s30, l30, d30, c30,
 s31, l31, d31, c31,
 s32, l32, d32, c32,
 s33, l33, d33, c33,
 s34, l34, d34, c34,
 s35, l35, d35, c35,
 s36, l36, d36, c36,
 s37, l37, d37, c37,
 s38, l38, d38, c38,
 s39, l39, d39, c39,
 s40, l40, d40, c40,
 s41, l41, d41, c41,
 s42, l42, d42, c42,
 s43, l43, d43, c43,
 s44, l44, d44, c44,
 s45, l45, d45, c45,
 s46, l46, d46, c46 )
 VALUES
 (@char_id,
 @s1, @l1, @d1, @c1,
 @s2, @l2, @d2, @c2,
 @s3, @l3, @d3, @c3,
 @s4, @l4, @d4, @c4,
 @s5, @l5, @d5, @c5,
 @s6, @l6, @d6, @c6,
 @s7, @l7, @d7, @c7,
 @s8, @l8, @d8, @c8,
 @s9, @l9, @d9, @c9,
 @s10, @l10, @d10, @c10,
 @s11, @l11, @d11, @c11,
 @s12, @l12, @d12, @c12,
 @s13, @l13, @d13, @c13,
 @s14, @l14, @d14, @c14,
 @s15, @l15, @d15, @c15,
 @s16, @l16, @d16, @c16,
 @s17, @l17, @d17, @c17,
 @s18, @l18, @d18, @c18,
 @s19, @l19, @d19, @c19,
 @s20, @l20, @d20, @c20,
 @s21, @l21, @d21, @c21,
 @s22, @l22, @d22, @c22,
 @s23, @l23, @d23, @c23,
 @s24, @l24, @d24, @c24,
 @s25, @l25, @d25, @c25,
 @s26, @l26, @d26, @c26,
 @s27, @l27, @d27, @c27,
 @s28, @l28, @d28, @c28,
 @s29, @l29, @d29, @c29,
 @s30, @l30, @d30, @c30,
 @s31, @l31, @d31, @c31,
 @s32, @l32, @d32, @c32,
 @s33, @l33, @d33, @c33,
 @s34, @l34, @d34, @c34,
 @s35, @l35, @d35, @c35,
 @s36, @l36, @d36, @c36,
 @s37, @l37, @d37, @c37, 
 @s38, @l38, @d38, @c38, 
 @s39, @l39, @d39, @c39, 
 @s40, @l40, @d40, @c40,
 @s41, @l41, @d41, @c41,
 @s42, @l42, @d42, @c42,
 @s43, @l43, @d43, @c43,
 @s44, @l44, @d44, @c44,
 @s45, @l45, @d45, @c45,
 @s46, @l46, @d46, @c46  )
END

go

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

/**
name:	lin_ChangeSubJob
desc:	change subjob

history:
*/
ALTER PROCEDURE [dbo].[lin_ChangeSubJob]
(
	@char_id	INT,
	@subjob_id	TINYINT,
	@old_subjob_id	TINYINT,
	@hp		FLOAT,
	@mp		FLOAT,
	@sp		INT,
	@exp		BIGINT,
	@level		TINYINT,
	@henna_1	INT,
	@henna_2	INT,
	@henna_3	INT
)
AS
SET NOCOUNT ON

DECLARE @ret INT
SET @ret = 0

BEGIN TRAN

-- update user_subjob
UPDATE user_subjob
SET hp = @hp, mp = @mp, sp = @sp, exp = @exp, level = @level, 
	henna_1 = @henna_1, henna_2 = @henna_2, henna_3 = @henna_3
WHERE char_id = @char_id AND subjob_id = @old_subjob_id
IF @@ERROR <> 0 AND @@ROWCOUNT <> 1	-- update, insert check
BEGIN
	GOTO EXIT_TRAN
END

-- update user_data
declare @sub_hp float
declare @sub_mp float
declare @sub_sp int
declare @sub_exp bigint
declare @sub_lev int
declare @sub_hen1 int
declare @sub_hen2 int
declare @sub_hen3 int

SELECT @sub_hp = hp, @sub_mp = mp, @sub_sp = sp, @sub_exp = exp, @sub_lev = level,
	@sub_hen1 = henna_1, @sub_hen2 = henna_2, @sub_hen3 = henna_3
FROM user_subjob (nolock)
WHERE char_id = @char_id
	AND subjob_id = @subjob_id

IF @subjob_id = 0
BEGIN
	UPDATE user_data
	SET class = subjob0_class
		, subjob_id = @subjob_id
		, HP = @sub_hp
		, MP = @sub_mp
		, SP = @sub_sp
		, Exp = @sub_exp
		, Lev = @sub_lev
	WHERE char_id = @char_id
END
ELSE IF @subjob_id = 1
BEGIN
	UPDATE user_data
	SET class = subjob1_class
		, subjob_id = @subjob_id
		, HP = @sub_hp
		, MP = @sub_mp
		, SP = @sub_sp
		, Exp = @sub_exp
		, Lev = @sub_lev
	WHERE char_id = @char_id
END
ELSE IF @subjob_id = 2
BEGIN
	UPDATE user_data
	SET class = subjob2_class
		, subjob_id = @subjob_id
		, HP = @sub_hp
		, MP = @sub_mp
		, SP = @sub_sp
		, Exp = @sub_exp
		, Lev = @sub_lev
	WHERE char_id = @char_id
END
ELSE IF @subjob_id = 3
BEGIN
	UPDATE user_data
	SET class = subjob3_class
		, subjob_id = @subjob_id
		, HP = @sub_hp
		, MP = @sub_mp
		, SP = @sub_sp
		, Exp = @sub_exp
		, Lev = @sub_lev
	WHERE char_id = @char_id
END
ELSE
BEGIN
	RAISERROR('Invalid Subjob ID [%d]. user [%d]', 16, 1, @subjob_id, @char_id)
	GOTO EXIT_TRAN
END
IF @@ERROR <> 0 AND @@ROWCOUNT <> 1
BEGIN
	GOTO EXIT_TRAN
END

-- init data: user_activeskill, user_henna
UPDATE user_activeskill
SET	s1 = 0, l1 = 0, d1 = 0, c1 = 0,
	s2 = 0, l2 = 0, d2 = 0, c2 = 0,
	s3 = 0, l3 = 0, d3 = 0, c3 = 0,
	s4 = 0, l4 = 0, d4 = 0, c4 = 0,
	s5 = 0, l5 = 0, d5 = 0, c5 = 0,
	s6 = 0, l6 = 0, d6 = 0, c6 = 0,
	s7 = 0, l7 = 0, d7 = 0, c7 = 0,
	s8 = 0, l8 = 0, d8 = 0, c8 = 0,
	s9 = 0, l9 = 0, d9 = 0, c9 = 0,
	s10 = 0, l10 = 0, d10 = 0, c10 = 0,
	s11 = 0, l11 = 0, d11 = 0, c11 = 0,
	s12 = 0, l12 = 0, d12 = 0, c12 = 0,
	s13 = 0, l13 = 0, d13 = 0, c13 = 0,
	s14 = 0, l14 = 0, d14 = 0, c14 = 0,
	s15 = 0, l15 = 0, d15 = 0, c15 = 0,
	s16 = 0, l16 = 0, d16 = 0, c16 = 0,
	s17 = 0, l17 = 0, d17 = 0, c17 = 0,
	s18 = 0, l18 = 0, d18 = 0, c18 = 0,
	s19 = 0, l19 = 0, d19 = 0, c19 = 0,
	s20 = 0, l20 = 0, d20 = 0, c20 = 0,
	s21 = 0, l21 = 0, d21 = 0, c21 = 0,
	s22 = 0, l22 = 0, d22 = 0, c22 = 0,
	s23 = 0, l23 = 0, d23 = 0, c23 = 0,
	s24 = 0, l24 = 0, d24 = 0, c24 = 0,
	s25 = 0, l25 = 0, d25 = 0, c25 = 0,
	s26 = 0, l26 = 0, d26 = 0, c26 = 0,
	s27 = 0, l27 = 0, d27 = 0, c27 = 0,
	s28 = 0, l28 = 0, d28 = 0, c28 = 0,
	s29 = 0, l29 = 0, d29 = 0, c29 = 0,
	s30 = 0, l30 = 0, d30 = 0, c30 = 0,
	s31 = 0, l31 = 0, d31 = 0, c31 = 0,
	s32 = 0, l32 = 0, d32 = 0, c32 = 0,
	s33 = 0, l33 = 0, d33 = 0, c33 = 0,
	s34 = 0, l34 = 0, d34 = 0, c34 = 0,
	s35 = 0, l35 = 0, d35 = 0, c35 = 0,
	s36 = 0, l36 = 0, d36 = 0, c36 = 0,
	s37 = 0, l37 = 0, d37 = 0, c37 = 0,
	s38 = 0, l38 = 0, d38 = 0, c38 = 0,
	s39 = 0, l39 = 0, d39 = 0, c39 = 0,
	s40 = 0, l40 = 0, d40 = 0, c40 = 0,
	s41 = 0, l41 = 0, d41 = 0, c41 = 0,
	s42 = 0, l42 = 0, d42 = 0, c42 = 0,
	s43 = 0, l43 = 0, d43 = 0, c43 = 0,
	s44 = 0, l44 = 0, d44 = 0, c44 = 0,
	s45 = 0, l45 = 0, d45 = 0, c45 = 0,
	s46 = 0, l46 = 0, d46 = 0, c46 = 0
WHERE char_id = @char_id
IF @@ERROR <> 0
BEGIN
	GOTO EXIT_TRAN
END

UPDATE user_henna
SET henna_1 = @sub_hen1, henna_2 = @sub_hen2, henna_3 = @sub_hen3
WHERE char_id = @char_id
IF @@ERROR = 0
BEGIN
	set @ret = 1
END

EXIT_TRAN:
IF @ret<> 0
BEGIN
	COMMIT TRAN
END
ELSE
BEGIN
	ROLLBACK TRAN
END

select @sub_hp, @sub_mp, @sub_sp, @sub_exp, @sub_lev, @sub_hen1, @sub_hen2, @sub_hen3

go

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

/**
name:	lin_CreateSubJob
desc:	create subjob

history:	2006-01-10	modified by btwinuni: if the char_id and subjob_id are existed user_subjob table, don't insert
			2007-08-21	modified by btwinuni: update class
*/
ALTER PROCEDURE [dbo].[lin_CreateSubJob]
(
	@char_id	INT,
	@new_subjob_id TINYINT,
	@new_class	TINYINT,
	@new_lev	INT,
	@new_exp	BIGINT,
	@old_subjob_id	TINYINT,
	@hp		FLOAT,
	@mp		FLOAT,
	@sp		INT,
	@exp		BIGINT,
	@level		TINYINT,
	@henna_1	INT,
	@henna_2	INT,
	@henna_3	INT
)
AS
SET NOCOUNT ON
DECLARE @ret INT
SELECT @ret = 0

-- transaction on
BEGIN TRAN

IF @new_subjob_id = 1
BEGIN
	UPDATE user_data
	SET class = @new_class
		, subjob_id = @new_subjob_id
		, subjob1_class = @new_class
		, SP = 0
		, Exp = @new_exp
		, Lev = @new_lev
	WHERE char_id = @char_id
END
ELSE IF @new_subjob_id = 2
BEGIN
	UPDATE user_data
	SET class = @new_class
		, subjob_id = @new_subjob_id
		, subjob2_class = @new_class
		, SP = 0
		, Exp = @new_exp
		, Lev = @new_lev
	WHERE char_id = @char_id
END
ELSE IF @new_subjob_id = 3
BEGIN
	UPDATE user_data
	SET class = @new_class
		, subjob_id = @new_subjob_id
		, subjob3_class = @new_class
		, SP = 0
		, Exp = @new_exp
		, Lev = @new_lev
	WHERE char_id = @char_id
END
IF @@ERROR <> 0 OR @@ROWCOUNT <> 1	-- update, insert check
BEGIN
	GOTO EXIT_TRAN
END

-- save old class
IF @old_subjob_id = 0 AND (NOT EXISTS(SELECT char_id FROM user_subjob WHERE char_id = @char_id AND subjob_id = 0))
BEGIN
	DECLARE @original_date DATETIME
	SELECT @original_date = create_date FROM user_data(NOLOCK) WHERE char_id = @char_id
	INSERT INTO user_subjob
	(char_id, subjob_id, hp, mp, sp, exp, level, henna_1, henna_2, henna_3, create_date)
	VALUES
	(@char_id, 0, @hp, @mp, @sp, @exp, @level, @henna_1, @henna_2, @henna_3, @original_date)
END
UPDATE user_subjob
SET hp = @hp, mp = @mp, sp = @sp, exp = @exp, level = @level, 
	henna_1 = @henna_1, henna_2 = @henna_2, henna_3 = @henna_3
WHERE char_id = @char_id AND subjob_id = @old_subjob_id
IF @@ERROR <> 0 OR @@ROWCOUNT <> 1	-- update, insert check
BEGIN
	GOTO EXIT_TRAN
END
-- create new class
if not exists (select * from user_subjob (nolock) where char_id = @char_id and subjob_id = @new_subjob_id)
INSERT INTO user_subjob (char_id, hp, mp, sp, exp, level, henna_1, henna_2, henna_3, subjob_id, create_date)
VALUES (@char_id, 1, 1, 0, @new_exp, @new_lev, 0, 0, 0, @new_subjob_id, GETDATE())
IF @@ERROR <> 0 AND @@ROWCOUNT <> 1
BEGIN
	GOTO EXIT_TRAN
END


-- init data: user_activeskill, user_henna
UPDATE user_activeskill
SET	s1 = 0, l1 = 0, d1 = 0, c1 = 0,
	s2 = 0, l2 = 0, d2 = 0, c2 = 0,
	s3 = 0, l3 = 0, d3 = 0, c3 = 0,
	s4 = 0, l4 = 0, d4 = 0, c4 = 0,
	s5 = 0, l5 = 0, d5 = 0, c5 = 0,
	s6 = 0, l6 = 0, d6 = 0, c6 = 0,
	s7 = 0, l7 = 0, d7 = 0, c7 = 0,
	s8 = 0, l8 = 0, d8 = 0, c8 = 0,
	s9 = 0, l9 = 0, d9 = 0, c9 = 0,
	s10 = 0, l10 = 0, d10 = 0, c10 = 0,
	s11 = 0, l11 = 0, d11 = 0, c11 = 0,
	s12 = 0, l12 = 0, d12 = 0, c12 = 0,
	s13 = 0, l13 = 0, d13 = 0, c13 = 0,
	s14 = 0, l14 = 0, d14 = 0, c14 = 0,
	s15 = 0, l15 = 0, d15 = 0, c15 = 0,
	s16 = 0, l16 = 0, d16 = 0, c16 = 0,
	s17 = 0, l17 = 0, d17 = 0, c17 = 0,
	s18 = 0, l18 = 0, d18 = 0, c18 = 0,
	s19 = 0, l19 = 0, d19 = 0, c19 = 0,
	s20 = 0, l20 = 0, d20 = 0, c20 = 0,
	s21 = 0, l21 = 0, d21 = 0, c21 = 0,
	s22 = 0, l22 = 0, d22 = 0, c22 = 0,
	s23 = 0, l23 = 0, d23 = 0, c23 = 0,
	s24 = 0, l24 = 0, d24 = 0, c24 = 0,
	s25 = 0, l25 = 0, d25 = 0, c25 = 0,
	s26 = 0, l26 = 0, d26 = 0, c26 = 0,
	s27 = 0, l27 = 0, d27 = 0, c27 = 0,
	s28 = 0, l28 = 0, d28 = 0, c28 = 0,
	s29 = 0, l29 = 0, d29 = 0, c29 = 0,
	s30 = 0, l30 = 0, d30 = 0, c30 = 0,
	s31 = 0, l31 = 0, d31 = 0, c31 = 0,
	s32 = 0, l32 = 0, d32 = 0, c32 = 0,
	s33 = 0, l33 = 0, d33 = 0, c33 = 0,
	s34 = 0, l34 = 0, d34 = 0, c34 = 0,
	s35 = 0, l35 = 0, d35 = 0, c35 = 0,
	s36 = 0, l36 = 0, d36 = 0, c36 = 0,
	s37 = 0, l37 = 0, d37 = 0, c37 = 0,
	s38 = 0, l38 = 0, d38 = 0, c38 = 0,
	s39 = 0, l39 = 0, d39 = 0, c39 = 0,
	s40 = 0, l40 = 0, d40 = 0, c40 = 0,
	s41 = 0, l41 = 0, d41 = 0, c41 = 0,
	s42 = 0, l42 = 0, d42 = 0, c42 = 0,
	s43 = 0, l43 = 0, d43 = 0, c43 = 0,
	s44 = 0, l44 = 0, d44 = 0, c44 = 0,
	s45 = 0, l45 = 0, d45 = 0, c45 = 0,
	s46 = 0, l46 = 0, d46 = 0, c46 = 0
WHERE char_id = @char_id
IF @@ERROR <> 0
BEGIN
	GOTO EXIT_TRAN
END

UPDATE user_henna
SET henna_1 = 0, henna_2 = 0, henna_3 = 0
WHERE char_id = @char_id
IF @@ERROR = 0
BEGIN
	set @ret = @new_subjob_id
END

EXIT_TRAN:
IF @ret<> 0
BEGIN
	COMMIT TRAN
END
ELSE
BEGIN
	ROLLBACK TRAN
END

SELECT @ret


go

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

ALTER   PROCEDURE [dbo].[lin_RenewSubjob]
(
	@char_id		INT,
	@subjob_id		TINYINT,
	@new_class		TINYINT,
	@new_lev		INT,
	@new_exp		BIGINT,
	@old_subjob_id 		TINYINT,
	@hp				FLOAT,
	@mp				FLOAT,
	@sp				INT,
	@exp			BIGINT,
	@level			TINYINT,
	@henna_1		INT,
	@henna_2		INT,
	@henna_3		INT
)
AS
SET NOCOUNT ON
DECLARE @ret INT
SET @ret = 0

-- transaction on
BEGIN TRAN

-- save current status
IF (@subjob_id != @old_subjob_id)	-- save now info
BEGIN
	UPDATE user_subjob
	SET hp = @hp, mp = @mp, sp = @sp, exp = @exp, level = @level, 
		henna_1 = @henna_1, henna_2 = @henna_2, henna_3 = @henna_3
	WHERE char_id = @char_id AND subjob_id = @old_subjob_id
	IF @@ERROR <> 0 OR @@ROWCOUNT <> 1	-- update, insert check
	BEGIN
		GOTO EXIT_TRAN
	END		
END

-- clear old subjob info
DELETE FROM shortcut_data WHERE char_id =  @char_id AND subjob_id = @subjob_id
IF @@ERROR <> 0
BEGIN
	GOTO EXIT_TRAN	
END

DELETE FROM user_skill WHERE char_id =  @char_id AND subjob_id = @subjob_id
IF @@ERROR <> 0
BEGIN
	GOTO EXIT_TRAN	
END

DELETE FROM user_skill_reuse_delay WHERE char_id =  @char_id AND subjob_id = @subjob_id
IF @@ERROR <> 0
BEGIN
	GOTO EXIT_TRAN	
END

-- update user_data
IF @subjob_id = 1
BEGIN
	UPDATE user_data
	SET class = @new_class
		, subjob_id = @subjob_id
		, subjob1_class = @new_class
		, SP = 0
		, Exp = @new_exp
		, Lev = @new_lev
	WHERE char_id = @char_id
END
ELSE IF @subjob_id = 2
BEGIN
	UPDATE user_data
	SET class = @new_class
		, subjob_id = @subjob_id
		, subjob2_class = @new_class
		, SP = 0
		, Exp = @new_exp
		, Lev = @new_lev
	WHERE char_id = @char_id
END
ELSE IF @subjob_id = 3
BEGIN
	UPDATE user_data
	SET class = @new_class
		, subjob_id = @subjob_id
		, subjob3_class = @new_class
		, SP = 0
		, Exp = @new_exp
		, Lev = @new_lev
	WHERE char_id = @char_id
END
ELSE
BEGIN
	RAISERROR('Invalid Subjob ID [%d]. user [%d]', 16, 1, @subjob_id, @char_id)
	GOTO EXIT_TRAN
END

IF @@ERROR <> 0 OR @@ROWCOUNT <> 1	-- update, insert check
BEGIN
	GOTO EXIT_TRAN
END

-- update new class
UPDATE user_subjob
SET hp = 1, mp = 1, sp = 0, exp = @new_exp, level = @new_lev, henna_1 = 0, henna_2 = 0, henna_3 = 0, create_date = GETDATE()
WHERE char_id = @char_id AND subjob_id = @subjob_id
IF @@ERROR <> 0 AND @@ROWCOUNT <> 1
BEGIN
	GOTO EXIT_TRAN
END

-- init data: user_activeskill, user_henna
UPDATE user_activeskill
SET	s1 = 0, l1 = 0, d1 = 0, c1 = 0,
	s2 = 0, l2 = 0, d2 = 0, c2 = 0,
	s3 = 0, l3 = 0, d3 = 0, c3 = 0,
	s4 = 0, l4 = 0, d4 = 0, c4 = 0,
	s5 = 0, l5 = 0, d5 = 0, c5 = 0,
	s6 = 0, l6 = 0, d6 = 0, c6 = 0,
	s7 = 0, l7 = 0, d7 = 0, c7 = 0,
	s8 = 0, l8 = 0, d8 = 0, c8 = 0,
	s9 = 0, l9 = 0, d9 = 0, c9 = 0,
	s10 = 0, l10 = 0, d10 = 0, c10 = 0,
	s11 = 0, l11 = 0, d11 = 0, c11 = 0,
	s12 = 0, l12 = 0, d12 = 0, c12 = 0,
	s13 = 0, l13 = 0, d13 = 0, c13 = 0,
	s14 = 0, l14 = 0, d14 = 0, c14 = 0,
	s15 = 0, l15 = 0, d15 = 0, c15 = 0,
	s16 = 0, l16 = 0, d16 = 0, c16 = 0,
	s17 = 0, l17 = 0, d17 = 0, c17 = 0,
	s18 = 0, l18 = 0, d18 = 0, c18 = 0,
	s19 = 0, l19 = 0, d19 = 0, c19 = 0,
	s20 = 0, l20 = 0, d20 = 0, c20 = 0,
	s21 = 0, l21 = 0, d21 = 0, c21 = 0,
	s22 = 0, l22 = 0, d22 = 0, c22 = 0,
	s23 = 0, l23 = 0, d23 = 0, c23 = 0,
	s24 = 0, l24 = 0, d24 = 0, c24 = 0,
	s25 = 0, l25 = 0, d25 = 0, c25 = 0,
	s26 = 0, l26 = 0, d26 = 0, c26 = 0,
	s27 = 0, l27 = 0, d27 = 0, c27 = 0,
	s28 = 0, l28 = 0, d28 = 0, c28 = 0,
	s29 = 0, l29 = 0, d29 = 0, c29 = 0,
	s30 = 0, l30 = 0, d30 = 0, c30 = 0,
	s31 = 0, l31 = 0, d31 = 0, c31 = 0,
	s32 = 0, l32 = 0, d32 = 0, c32 = 0,
	s33 = 0, l33 = 0, d33 = 0, c33 = 0,
	s34 = 0, l34 = 0, d34 = 0, c34 = 0,
	s35 = 0, l35 = 0, d35 = 0, c35 = 0,
	s36 = 0, l36 = 0, d36 = 0, c36 = 0,
	s37 = 0, l37 = 0, d37 = 0, c37 = 0,
	s38 = 0, l38 = 0, d38 = 0, c38 = 0,
	s39 = 0, l39 = 0, d39 = 0, c39 = 0,
	s40 = 0, l40 = 0, d40 = 0, c40 = 0,
	s41 = 0, l41 = 0, d41 = 0, c41 = 0,
	s42 = 0, l42 = 0, d42 = 0, c42 = 0,
	s43 = 0, l43 = 0, d43 = 0, c43 = 0,
	s44 = 0, l44 = 0, d44 = 0, c44 = 0,
	s45 = 0, l45 = 0, d45 = 0, c45 = 0,
	s46 = 0, l46 = 0, d46 = 0, c46 = 0

WHERE char_id = @char_id
IF @@ERROR <> 0
BEGIN
	GOTO EXIT_TRAN
END

UPDATE user_henna
SET henna_1 = 0, henna_2 = 0, henna_3 = 0
WHERE char_id = @char_id
IF @@ERROR = 0
BEGIN
	set @ret = @subjob_id
END

EXIT_TRAN:
IF @ret<> 0
BEGIN
	COMMIT TRAN
END
ELSE
BEGIN
	ROLLBACK TRAN
END

SELECT @ret


go

--Vote reward feature
CREATE TABLE user_vote
	(
	account_id int NOT NULL,
	vote_points int NOT NULL DEFAULT 0,
	last_vote_time int NOT NULL DEFAULT 0
	CONSTRAINT [PK_user_vote] PRIMARY KEY CLUSTERED 
	(
		[account_id] ASC
	)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

go

-- Donate system
CREATE TABLE user_donate
	(
	account_id int NOT NULL,
	donate_points int NOT NULL DEFAULT 0,
	last_donate_time int NOT NULL DEFAULT 0
	CONSTRAINT [PK_user_donate] PRIMARY KEY CLUSTERED 
	(
		[account_id] ASC
	)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
	
go

-- PvP system
CREATE TABLE user_pvp
	(
	char_id INT NOT NULL,
	pvp_points INT NOT NULL DEFAULT 0,
	last_season_points INT NOT NULL DEFAULT 0,
	top_player INT NOT NULL DEFAULT 0,
	received_reward INT NOT NULL DEFAULT 0,
	transferred_points INT NOT NULL DEFAULT 0,
	CONSTRAINT [PK_user_pvp] PRIMARY KEY CLUSTERED 
	(
		[char_id] ASC
	)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
	
go


CREATE PROCEDURE lin_LoadDonatePoints 
(
 @account_id INT
)
AS

	SET NOCOUNT ON;
IF EXISTS(SELECT * FROM dbo.user_donate WHERE account_id = @account_id)
	BEGIN
	 SELECT donate_points FROM dbo.user_donate WHERE account_id = @account_id
	END  
ELSE
BEGIN  
 INSERT INTO dbo.user_donate (account_id, donate_points, last_donate_time) VALUES (@account_id, 0, 0)
 SELECT donate_points FROM dbo.user_donate WHERE account_id = @account_id
END

go

CREATE PROCEDURE lin_LoadVotePoints 
(
 @account_id INT
)
AS

	SET NOCOUNT ON;
IF EXISTS(SELECT * FROM dbo.user_vote WHERE account_id = @account_id)
	BEGIN
	 SELECT vote_points FROM dbo.user_vote WHERE account_id = @account_id
	END  
ELSE
BEGIN  
 INSERT INTO dbo.user_vote (account_id, vote_points, last_vote_time) VALUES (@account_id, 0, 0)
 SELECT vote_points FROM dbo.user_vote WHERE account_id = @account_id
END

go

CREATE PROCEDURE lin_SaveDonatePoints 
(
 @account_id INT,
 @points INT
)
AS

	SET NOCOUNT ON;
IF EXISTS(SELECT * FROM dbo.user_donate WHERE account_id = @account_id)
	BEGIN
	 UPDATE dbo.user_donate SET donate_points = @points WHERE account_id = @account_id
	END  
ELSE
BEGIN  
 INSERT INTO dbo.user_donate (account_id, donate_points, last_donate_time) VALUES (@account_id, @points, 0)
END

go

CREATE PROCEDURE lin_SaveVotePoints 
(
 @account_id INT,
 @points INT
)
AS

	SET NOCOUNT ON;
IF EXISTS(SELECT * FROM dbo.user_vote WHERE account_id = @account_id)
	BEGIN
	 UPDATE dbo.user_vote SET vote_points = @points WHERE account_id = @account_id
	END  
ELSE
BEGIN  
 INSERT INTO dbo.user_vote (account_id, vote_points, last_vote_time) VALUES (@account_id, @points, 0)
END

go

create table user_pvp_stats
(
	victim_id int not null,
	victim_class_id int not null default 0,
	victim_level int not null default 0,
	killer_id int not null,
	killer_class_id int not null default 0,
	killer_level int not null default 0,
	killer_hp int not null default 0,
	killer_max_hp int not null default 0,
	killer_cp int not null default 0,
	killer_max_cp int not null default 0,
	x int not null default 0,
	y int not null default 0,
	z int not null default 0,
	pvp_type int not null default 0,
	skill_id int not null default 0,
	skill_level int not null default 0,
	death_time int not null default 0
	)
GO

CREATE PROCEDURE lin_AddPvpStat
	@victim_id AS INT,
	@victim_class_id AS INT,
	@victim_level AS INT,
	@killer_id AS INT,
	@killer_class_id AS INT,
	@killer_level AS INT,
	@killer_hp AS INT,
	@killer_max_hp AS INT,
	@killer_cp AS INT,
	@killer_max_cp AS INT,
	@x AS INT,
	@y AS INT,
	@z AS INT,
	@pvp_type AS INT,
	@skill_id AS INT,
	@skill_level AS INT,
	@death_time AS INT
AS
BEGIN

	SET NOCOUNT ON;

	insert into user_pvp_stats( victim_id, victim_class_id, victim_level, killer_id, killer_class_id, killer_level, killer_hp, killer_max_hp, killer_cp, killer_max_cp, x, y, z, pvp_type, skill_id, skill_level, death_time)
	values ( @victim_id, @victim_class_id, @victim_level, @killer_id, @killer_class_id, @killer_level, @killer_hp, @killer_max_hp, @killer_cp, @killer_max_cp, @x, @y, @z, @pvp_type, @skill_id, @skill_level, @death_time )

END
GO

-- Championship system
-- championship_team: id, name, char1_id, char2_id, char3_id, points, win_count, lose_count, draw_count, kill_count, death_count
-- championship_match: id, state, start_time, team1_id, team2_id, winner_id
-- state
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[championship_match]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[championship_match](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[state] [int] NOT NULL DEFAULT 0,	-- 0 - waiting, 1 - teleporting, 2 - preparing, 3 - fighting, 4 - done
	[start_time] [int] NOT NULL DEFAULT 0,
	[team1_id] [int] NOT NULL,
	[team2_id] [int] NOT NULL,
	[winner_id] [int] NOT NULL DEFAULT 0,
 CONSTRAINT [PK_championship_match] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[championship_team]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[championship_team](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] VARCHAR(50),
	[char1_id] [int] NOT NULL,
	[char2_id] [int] NOT NULL,
	[char3_id] [int] NOT NULL,
	[points] [int] NOT NULL,
	[win_count] [int] NOT NULL,
	[lose_count] [int] NOT NULL,
	[draw_count] [int] NOT NULL,
	[kill_count] [int] NOT NULL,
	[death_count] [int] NOT NULL
 CONSTRAINT [PK_championship_team] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO


CREATE PROCEDURE lin_LoadChampionshipTeams
AS

SET NOCOUNT ON;
BEGIN
	SELECT [id], [name], [char1_id], [char2_id], [char3_id], [points], [win_count], [lose_count], [draw_count], [kill_count], [death_count] FROM [dbo].[championship_team]
END

go

CREATE PROCEDURE lin_SaveChampionshipTeam
(
	@id AS INT,
	@points AS INT,
	@win_count AS INT,
	@lose_count AS INT,
	@draw_count AS INT,
	@kill_count AS INT,
	@death_count AS INT
)
AS

SET NOCOUNT ON;
BEGIN
	UPDATE [dbo].[championship_team] SET [points] = @points, [win_count] = @win_count, [lose_count] = @lose_count, [draw_count] = @draw_count, [kill_count] = @kill_count, [death_count] = @death_count WHERE [id] = @id
END

go

CREATE PROCEDURE lin_LoadChampionshipMatches
AS
BEGIN
SET NOCOUNT ON;
	SELECT [id], [state], [start_time], [team1_id], [team2_id], [winner_id] FROM [dbo].[championship_match]
END

go

CREATE PROCEDURE lin_SaveChampionshipMatch
(
	@id AS INT,
	@state AS INT,
	@winner_id AS INT
)
AS

BEGIN
SET NOCOUNT ON;

UPDATE [dbo].[championship_match] SET [state] = @state, [winner_id] = @winner_id WHERE [id] = @id

END

go


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pvp_season]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[pvp_season](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[state] [int] NOT NULL DEFAULT 0,	-- 0 - waiting, 1 - finished
	[start_time] [int] NOT NULL DEFAULT 0,
	[end_time] [int] NOT NULL DEFAULT 0
 CONSTRAINT [PK_pvp_season] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO


CREATE PROCEDURE lin_LoadPvPData
(
 @char_id INT
)
AS

	SET NOCOUNT ON;
IF EXISTS(SELECT * FROM dbo.user_pvp WHERE char_id = @char_id)
	BEGIN
	 SELECT pvp_points, last_season_points, transferred_points, top_player, received_reward FROM dbo.user_pvp WHERE char_id = @char_id
	END  
ELSE
BEGIN  
 INSERT INTO dbo.user_pvp (char_id, pvp_points) VALUES (@char_id, 0)
 SELECT pvp_points, last_season_points, transferred_points, top_player, received_reward FROM dbo.user_pvp WHERE char_id = @char_id
END

go

CREATE PROCEDURE lin_SavePvPPoints 
(
 @char_id INT,
 @points INT
)
AS

	SET NOCOUNT ON;
IF EXISTS(SELECT * FROM dbo.user_pvp WHERE char_id = @char_id)
	BEGIN
	 UPDATE dbo.user_pvp SET pvp_points = @points WHERE char_id = @char_id
	END  
ELSE
BEGIN  
 INSERT INTO dbo.user_pvp (char_id, pvp_points) VALUES (@char_id, @points)
END

go

CREATE PROCEDURE lin_SaveTransferredPvPPoints
(
 @char_id INT,
 @points INT
)
AS

	SET NOCOUNT ON;
IF EXISTS(SELECT * FROM dbo.user_pvp WHERE char_id = @char_id)
	BEGIN
	 UPDATE dbo.user_pvp SET transferred_points = @points WHERE char_id = @char_id
	END  
ELSE
BEGIN  
 INSERT INTO dbo.user_pvp (char_id, transferred_points) VALUES (@char_id, @points)
END

go

CREATE PROCEDURE lin_SetPvPRewardFlag
(
 @char_id INT
)
AS

	SET NOCOUNT ON;
IF EXISTS(SELECT * FROM dbo.user_pvp WHERE char_id = @char_id)
	BEGIN
	 UPDATE dbo.user_pvp SET received_reward = 1 WHERE char_id = @char_id
	END  
ELSE
BEGIN  
 INSERT INTO dbo.user_pvp (char_id, received_reward) VALUES (@char_id, 1)
END

go


CREATE PROCEDURE lin_ProcessPvPSeason
(
	@time AS INT,
	@rewardCount AS INT
)
AS

SET NOCOUNT ON;
BEGIN
	-- End current season
	IF EXISTS(SELECT * FROM [dbo].[pvp_season] WHERE [state] = 0)
	BEGIN
		UPDATE [dbo].[pvp_season] SET [state] = 1, [end_time] = @time WHERE [state] = 0
	END
	-- Update user_pvp
	UPDATE [dbo].[user_pvp] SET [last_season_points] = [pvp_points], [transferred_points] = [transferred_points] + [pvp_points], [pvp_points] = 0, [top_player] = 0, [received_reward] = 0 WHERE [char_id] > 0
	
	UPDATE TOP(@rewardCount) [dbo].[user_pvp] SET [top_player] = 1, [received_reward] = 0 WHERE [last_season_points] in (SELECT TOP(@rewardCount) [last_season_points] FROM [dbo].[user_pvp] WHERE [last_season_points] > 0 order by [last_season_points] desc)

	-- Add new season
	INSERT INTO [dbo].[pvp_season](state, start_time) VALUES (0, @time)
	
	
END

go

CREATE PROCEDURE lin_LoadPvPSeason
(
	@time as INT
)
AS

SET NOCOUNT ON;
BEGIN
	IF EXISTS(SELECT * FROM [dbo].[pvp_season] WHERE [state] = 0)
	BEGIN
		SELECT TOP(1) [id], [state], [start_time]  FROM [dbo].[pvp_season] WHERE [state] = 0 order by [id] desc
	END
	ELSE
	BEGIN
		-- Add new season
		INSERT INTO [dbo].[pvp_season](state, start_time) VALUES (0, @time)
		
		SELECT TOP(1) [id], [state], [start_time]  FROM [dbo].[pvp_season] WHERE [state] = 0 order by [id] desc
	END
END

go

CREATE PROCEDURE lin_LoadPvPTopPlayers
AS

SET NOCOUNT ON;
BEGIN
	SELECT [char_name] from [dbo].[user_data] as ud, [dbo].[user_pvp] as up WHERE ud.char_id = up.char_id AND up.top_player = 1 order by up.last_season_points desc
END

go

ALTER TABLE dbo.user_data ADD
	hardware_id nvarchar(50) NOT NULL DEFAULT N'00000000000000000000000000000000'
GO

CREATE PROCEDURE lin_SaveHWID
(
 @char_id INT,
 @hwid NVARCHAR(50)
)
AS

	SET NOCOUNT ON;
	UPDATE [user_data] SET [hardware_id] = @hwid WHERE [char_id] = @char_id
go

-- Item Lock System - lockstate - 0 unlocked, 1 locked
CREATE TABLE [user_lock] (
  [char_id] int DEFAULT (0) NOT NULL,
  [password] nvarchar(32) NOT NULL DEFAULT N'',
  [lockstate] int DEFAULT (0) NOT NULL
)
GO

CREATE PROCEDURE lin_ItemLockSetPassword
(
	@charId as INT,
	@password as NVARCHAR(32),
	@lockState as INT
)
AS

SET NOCOUNT ON;

IF EXISTS(SELECT * FROM [user_lock] WHERE [char_id] = @charId)
BEGIN
	UPDATE [user_lock] SET [password] = @password, [lockstate] = @lockState WHERE [char_id] = @charId
END
ELSE
BEGIN
	INSERT INTO [user_lock] ([char_id], [password], [lockstate]) VALUES (@charId, @password, @lockState)
END

GO

CREATE PROCEDURE lin_ItemLockSetLockState
(
	@charId as INT,
	@lockState as INT
)
AS

SET NOCOUNT ON;

UPDATE [user_lock] SET [lockstate] = @lockState WHERE [char_id] = @charId

GO

CREATE PROCEDURE lin_LoadItemLocks
AS

SET NOCOUNT ON;
SELECT [char_id], [password], [lockstate] FROM [user_lock]

GO

CREATE TABLE BannedHardwareId
	(
	[hardware_id] nvarchar(50) NOT NULL DEFAULT N'00000000000000000000000000000000',
	[account] nvarchar(25) NOT NULL DEFAULT N'',
	[gm] nvarchar(25) NOT NULL DEFAULT N'',
	[timeout] int NOT NULL DEFAULT 0
	) 	
go

CREATE PROCEDURE lin_BanHardwareId
(
 @hwid NVARCHAR(50),
 @account as nvarchar(25),
 @gm as nvarchar(25),
 @timeout INT
)
AS

SET NOCOUNT ON;
BEGIN
	IF EXISTS(SELECT * FROM [dbo].[BannedHardwareId] WHERE [hardware_id] = @hwid)
	BEGIN
		UPDATE [BannedHardwareId] SET [account]=@account, [gm] = @gm, [timeout] = @timeout WHERE [hardware_id] = @hwid
	END
	ELSE
	BEGIN
		INSERT INTO [BannedHardwareId] ([hardware_id], [account], [gm], [timeout]) VALUES (@hwid, @account, @gm, @timeout)
	END
END
go

CREATE PROCEDURE lin_UnBanHardwareId
(
 @hwid NVARCHAR(50)
)
AS

SET NOCOUNT ON;

DELETE FROM [BannedHardwareId] WHERE [hardware_id] = @hwid

go


CREATE PROCEDURE lin_LoadBannedHardwareId
AS

SET NOCOUNT ON;

SELECT [hardware_id], [account], [gm], [timeout] FROM [BannedHardwareId]

go


ALTER TABLE dbo.user_data ADD
	real_ip nvarchar(50) NOT NULL DEFAULT N'0.0.0.0'
GO

CREATE  PROCEDURE [dbo].[lin_SaveRealIp]
(        
 @charId INT,
 @ip nvarchar(50)
)        
AS        
        
SET NOCOUNT ON        
UPDATE [user_data] SET [real_ip] = @ip WHERE [char_id] = @charId

GO


-- Delete Pledge fix

/****** Object:  StoredProcedure [dbo].[lin_DeletePledge]    Script Date: 2015-10-21 15:11:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/****** Object:  Stored Procedure dbo.lin_DeletePledge    Script Date: 2003-09-20 오전 11:51:57 ******/
-- lin_DeletePledge
-- by bert
-- return none

ALTER PROCEDURE
[dbo].[lin_DeletePledge] (@pledge_id INT)
AS

SET NOCOUNT ON

DELETE
FROM Academy_Member
WHERE pledge_id = @pledge_id

DELETE
FROM Academy
WHERE pledge_id = @pledge_id

DELETE
FROM Sub_Pledge
WHERE pledge_id = @pledge_id

DELETE
FROM Pledge_Skill
WHERE pledge_id = @pledge_id


DELETE
FROM Pledge
WHERE pledge_id = @pledge_id

update castle 
set prev_castle_owner_id = 0 
where prev_castle_owner_id = @pledge_id


UPDATE user_data
SET pledge_id = 0, pledge_type = 0, grade_id = 0
WHERE pledge_id = @pledge_id

GO

--AllInOne
ALTER TABLE dbo.user_data ADD
	aio_id INT NOT NULL DEFAULT 0
ALTER TABLE dbo.user_data ADD
	aio_start_time INT NOT NULL DEFAULT 0
GO
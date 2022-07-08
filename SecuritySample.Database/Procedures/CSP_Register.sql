CREATE PROCEDURE [AppUserSchema].[CSP_Register]
	@Email NVARCHAR(384),
	@Passwd NVARCHAR(50)
AS
BEGIN
	INSERT INTO [User] (Email, Passwd) VALUES (@Email, dbo.CSF_HashPasswd(@Passwd));
	RETURN 0
END

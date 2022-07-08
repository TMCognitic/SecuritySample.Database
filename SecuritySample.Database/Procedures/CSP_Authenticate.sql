CREATE PROCEDURE [AppUserSchema].[CSP_Authenticate]
	@Email NVARCHAR(384),
	@Passwd NVARCHAR(50)
AS
BEGIN
	SELECT Id, Email FROM [User] WHERE Email = @Email AND Passwd = dbo.CSF_HashPasswd(@Passwd);
	RETURN 0
END

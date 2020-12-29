USE HospitalDB1
GO

/*
	Input: username, password, role
	role: 'mng', 'doc', 'pat'
	Output: ID
*/
/*Output: ID*/
CREATE OR ALTER PROC VerifyLogin
	@uname VARCHAR(15),
	@psswd VARCHAR(30),
	@role VARCHAR(3),

AS
BEGIN
	DECLARE @id NCHAR(9)
	IF(@role = 'mng')
		IF(EXISTS(SELECT ID FROM UserManager WHERE Usn = @uname AND Pwd = @psswd))
			SET @id = (SELECT ID FROM UserManager WHERE Usn = @uname )
		ELSE 
			SET @id = 'Failed!!!'

	ELSE IF(@role = 'doc')
		IF(EXISTS(SELECT ID FROM UserDoctor WHERE Usn = @uname AND Pwd = @psswd))
			SET @id = (SELECT ID FROM UserDoctor WHERE Usn = @uname)
		ELSE 
			SET @id = 'Failed!!!'

	ELSE IF (@role = 'pat')
		IF(EXISTS(SELECT ID FROM UserPatient WHERE Usn = @uname AND Pwd = @psswd))
			SET @id = (SELECT ID FROM UserPatient WHERE Usn = @uname)
		ELSE 
			SET @id = 'Failed!!!'
	SELECT @id
END
GO 

EXEC VerifyLogin @uname = 'mng', @psswd = '0', @role = 'mng'

EXEC VerifyLogin @uname = 'c1', @psswd = 'c1', @role = 'doc'

EXEC VerifyLogin @uname = 'i1', @psswd = 'i1', @role = 'pat'

EXEC VerifyLogin @uname = 'i1', @psswd = 'i2', @role = 'pat'

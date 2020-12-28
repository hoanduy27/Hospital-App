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
	@id NCHAR(9) OUTPUT
AS
BEGIN
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
END
GO 

DECLARE @i NCHAR(9)
EXEC VerifyLogin @uname = 'mng', @psswd = '0', @role = 'mng', @id = @i output
PRINT @i

EXEC VerifyLogin @uname = 'c1', @psswd = 'c1', @role = 'doc', @id = @i output
PRINT @i

EXEC VerifyLogin @uname = 'i1', @psswd = 'i1', @role = 'pat', @id = @i output
PRINT @i

EXEC VerifyLogin @uname = 'i1', @psswd = 'i2', @role = 'pat', @id = @i output
PRINT @i

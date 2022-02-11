USE AdventureWorksLT2019
GO


CREATE OR ALTER PROCEDURE CreateCustomer
@NameStyle		BIT,
@Title			NVARCHAR(8)		= null,
@FirstName		NVARCHAR(50),
@MiddleName		NVARCHAR(50)	= null,
@LastName		NVARCHAR(50),
@Suffix			NVARCHAR(10)	= null,
@CompanyName	NVARCHAR(128)	= null,
@SalesPerson	NVARCHAR(256)	= null,
@EmailAddress	NVARCHAR(50)	= null,
@Phone			NVARCHAR(25)	= null,
@ModifiedDate	DATETIME,

--Passwords propper
@Password		VARCHAR(128),
@PasswordStuffRandomDataInTheSalt varchar(10)	= 'TestData',

@AddressType	NVARCHAR(50),
@AddressLine1	NVARCHAR(60),
@AddressLine2	NVARCHAR(60)	= null,
@City			NVARCHAR(30),
@StateProvince	NVARCHAR(50),
@CountryRegion	NVARCHAR(50),
@PostalCode		NVARCHAR(15),
@ID				INT = null,
@AddressID		INT = null
AS
BEGIN
	INSERT INTO SalesLT.[Customer] (
		[NameStyle],[Title],[FirstName],[MiddleName],[LastName],[Suffix],
		[CompanyName],[SalesPerson],[EmailAddress],[Phone],
		[PasswordHash],[PasswordSalt],[ModifiedDate])
	VALUES
		(@NameStyle, @Title, @FirstName, @MiddleName, @LastName, @Suffix,
		@CompanyName, @SalesPerson, @EmailAddress, @Phone,
		@Password, @PasswordStuffRandomDataInTheSalt, @ModifiedDate)
	SET @ID = SCOPE_IDENTITY()

	INSERT INTO SalesLT.[Address] (
		[AddressLine1],[AddressLine2],[City],[StateProvince],[CountryRegion],[PostalCode],[ModifiedDate])
	VALUES (
		@AddressLine1, @AddressLine2, @City, @StateProvince, @CountryRegion, @PostalCode, @ModifiedDate)
	SET @AddressID = SCOPE_IDENTITY()

	INSERT INTO SalesLT.[CustomerAddress] (
		[CustomerID],[AddressID],[AddressType],[ModifiedDate])
	VALUES (
		@ID, @AddressID, @AddressType, @ModifiedDate)



END
GO

CREATE OR ALTER PROCEDURE ReadCustomer
@ID	INT = -1
AS
BEGIN
IF @ID = -1
	SELECT [CustomerID],[Title],[FirstName],[MiddleName],[LastName],[Suffix],[EmailAddress] FROM SalesLT.Customer
ELSE
	SELECT Customer.[CustomerID],[Title],[FirstName],[MiddleName],[LastName],[Suffix],
					[EmailAddress],[CompanyName],[Phone],[PasswordHash],
					[AddressLine1],[AddressLine2],[City],[StateProvince],[CountryRegion],[PostalCode],
					[SalesPerson]
	
	FROM SalesLT.Customer
	--Left joins to avoid not getting a customer when they have non of the other tables populated
	LEFT JOIN SalesLT.CustomerAddress ON Customer.CustomerID = CustomerAddress.CustomerID
	LEFT JOIN SalesLT.[Address] ON CustomerAddress.AddressID = [Address].AddressID
	WHERE Customer.CustomerID = @ID

END
GO

CREATE OR ALTER PROCEDURE UpdateCustomer
@CustomerID		INT,
@NameStyle		BIT,
@Title			NVARCHAR(8)		= null,
@FirstName		NVARCHAR(50),
@MiddleName		NVARCHAR(50)	= null,
@LastName		NVARCHAR(50),
@Suffix			NVARCHAR(10)	= null,
@CompanyName	NVARCHAR(128)	= null,
@SalesPerson	NVARCHAR(256)	= null,
@EmailAddress	NVARCHAR(50)	= null,
@Phone			NVARCHAR(25)	= null,
@ModifiedDate	DATETIME,
--Passwords propper
@Password		VARCHAR(128),
@PasswordStuffRandomDataInTheSalt varchar(10)	= 'TestData'
AS
BEGIN
	Update SalesLT.[Customer] 
	SET 
		[NameStyle]		=	@NameStyle		,
		[Title]			=	@Title			,
		[FirstName]		=	@FirstName		,
		[MiddleName]	=	@MiddleName		,
		[LastName]		=	@LastName		,
		[Suffix]		=	@Suffix			,
		[CompanyName]	=	@CompanyName	,
		[SalesPerson]	=	@SalesPerson	,
		[EmailAddress]	=	@EmailAddress	,
		[Phone]			=	@Phone			,
		[PasswordHash]	=	@Password		,
		[ModifiedDate]	=	@ModifiedDate
	WHERE CustomerID = @CustomerID
	
		
END
GO

CREATE OR ALTER PROCEDURE UpdateAddress
@CustomerID		INT,
@AddressID		INT				= null,
@AddressLine1	NVARCHAR(60),
@AddressLine2	NVARCHAR(60)	= null,
@City			NVARCHAR(30),
@StateProvince	NVARCHAR(50),
@CountryRegion	NVARCHAR(50),
@PostalCode		NVARCHAR(15),

@ModifiedDate	DATETIME
AS
BEGIN
	SELECT @AddressID = AddressID
	FROM SalesLT.CustomerAddress
	WHERE @CustomerID = CustomerAddress.CustomerID
	
	Update [SalesLT].[Address]
	SET 
		[AddressLine1]	=	@AddressLine1,
		[AddressLine2]	=	@AddressLine2,
		[City]			=	@City,
		[StateProvince]	=	@StateProvince,
		[CountryRegion]	=	@CountryRegion,
		[PostalCode]	=	@PostalCode,
		[ModifiedDate]	=	@ModifiedDate
	Where AddressID = @AddressID
END
GO

CREATE OR ALTER PROCEDURE UpdateCustomerAddress 
@AddressID		INT,
@AddressType	NVARCHAR(50),
@ModifiedDate	DATETIME
AS
BEGIN
	Update [SalesLT].[CustomerAddress]
	SET 
		[AddressType]	=	@AddressType,
		[ModifiedDate]	=	@ModifiedDate
	Where AddressID = @AddressID
END
GO

CREATE OR ALTER PROCEDURE DeleteCustomer
@ID			INT,
@AddressID	INT = null
AS
BEGIN
SET @AddressID = (SELECT CustomerID FROM SalesLT.CustomerAddress
	WHERE @ID = CustomerID)

DELETE FROM SalesLT.CustomerAddress 
WHERE @ID = CustomerID

DELETE FROM SalesLT.[Address]
WHERE @AddressID = AddressID

DELETE FROM SalesLT.Customer
WHERE @ID = CustomerID
END
GO


CREATE OR ALTER VIEW ProductsSimple
AS
	SELECT
		--Product
		P.[Name], P.Color, P.StandardCost, P.ListPrice, P.Size, P.[Weight],
		--Product Category
		PC.[Name] AS Category,
		--Product Model
		PM.[Name] AS Model

		FROM SalesLT.Product								P
		LEFT JOIN SalesLT.ProductCategory					PC 
		ON P.ProductCategoryID = PC.ProductCategoryID
		LEFT JOIN SalesLT.ProductModel						PM
		ON P.ProductModelID = PM.ProductModelID
GO

CREATE OR ALTER PROCEDURE ReadProducts
AS
BEGIN
	SELECT [Name], Color, StandardCost, ListPrice, Size, 
	[Weight], Category, model 
	FROM ProductsSimple
END
GO
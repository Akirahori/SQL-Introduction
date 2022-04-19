use AdventureWorks2017

SELECT * FROM person.Person;

SELECT * FROM person.EmailAddress;
--Selecionando nome e sobrenome dos clientes
SELECT  
	FirstName,LastName 
FROM 
	person.Person;

--DISTINCT
--SELECT coluna1, coluna2 FROM tabela

SELECT  DISTINCT FirstName
FROM person.Person;

--Quantos sobrenomes unicos nos temos 1.206
SELECT DISTINCT LastName
FROM person.Person;

--Usando o Where
SELECT * 
FROM person.Person
WHERE Lastname = 'miller' and FirstName = 'anna'

SELECT * FROM Production.Product
WHERE Color = 'blue' or Color = 'black'

SELECT * FROM Production.Product
WHERE ListPrice > 1500 and ListPrice < 5000

SELECT * FROM Production.Product
WHERE color <> 'red'

--Desafio do SELECT
SELECT * FROM Production.Product
WHERE Weight > 500 and Weight <= 700

--DESAFIO DO SELECT 144 funcionários solteiros mas somente 24 são assalariados
SELECT * FROM [HumanResources].[Employee]
WHERE MaritalStatus = 'S' AND SalariedFlag = 'True'

--DESAFIO DO SELECT 146 funcionários casados mas somente 28 são assalariados
SELECT * FROM [HumanResources].[Employee]
WHERE MaritalStatus = 'M'AND SalariedFlag = 'True'


--COUNT

SELECT COUNT(*)
FROM person.Person

SELECT COUNT(DISTINCT Title)
FROM person.Person

--DESAFIO do COUNT 504 produtos
SELECT COUNT(DISTINCT Name)
FROM Production.Product

SELECT COUNT(Size) 
FROM Production.Product

--TOP + Desafios
SELECT TOP 20 * -- Retorna a quantidade de linhas que eu quero ver. Pode ser util em um banco de dados grande.
FROM Production.Product

--ORDER BY
SELECT FirstName,LastName
FROM person.Person
ORDER BY FirstName, LastName ASC

--DESAFIO
SELECT TOP 10 ProductID
FROM Production.Product
ORDER BY ListPrice DESC


--Usando Between
SELECT * FROM Production.Product
WHERE ListPrice BETWEEN 1000 and 1500

SELECT * FROM Production.Product
WHERE ListPrice NOT BETWEEN 1000 and 1500

SELECT * FROM HumanResources.Employee
WHERE HireDate BETWEEN '2009/01/01' and '2010/01/01'
ORDER BY HireDate

--IN
SELECT * FROM Person.Person
WHERE BusinessEntityID IN(2,7,13)

SELECT * FROM Person.Person
WHERE BusinessEntityID NOT IN(2,7,13)

--LIKE
SELECT * FROM person.Person
WHERE FirstName LIKE 'ovi%'

SELECT * FROM person.Person
WHERE FirstName LIKE '%to'

SELECT * FROM person.Person
WHERE FirstName LIKE '%essa%'

SELECT * FROM person.Person
WHERE FirstName LIKE '%ro_%'

--DESAFIO
-- Quantos produtos temos cadastrado no sistema que custam mais que de 1500 dolares
SELECT COUNT(ListPrice)
FROM production.product
WHERE ListPrice >= 1500

--DESAFIO 2
--Quantas pessoas temos com o sobrenome que inicia com a letra P?
SELECT COUNT(Lastname)
FROM person.Person
WHERE LastName LIKE 'p%'

--SUM MAX AVG
SELECT TOP 10 SUM(LineTotal) AS 'Soma'
FROM Sales.SalesOrderDetail

SELECT TOP 10 MIN(lineTotal) AS 'Minimo'
FROM Sales.SalesOrderDetail

SELECT TOP 10 AVG(lineTotal) AS 'Media'
FROM Sales.SalesOrderDetail


-- GROUP BY
SELECT SpecialOfferID, SUM(UnitPrice) AS "Soma"
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID
-- quero saber quantos de cada produto foi vendido até hoje
SELECT ProductID, COUNT(ProductID) AS "Contagem"
FROM Sales.SalesOrderDetail
GROUP BY ProductID
--Quero saber quantos nomes temos cadastrado em nosso banco de dados
SELECT FirstName, COUNT(FirstName)
FROM Person.Person
GROUP BY FirstName

-- Media de preço para os produtos que são pratas(silver)
SELECT color, AVG(ListPrice) AS "Media"
FROM Production.Product
WHERE Color = 'Silver'
GROUP BY Color

-- quantas pessoas tem o mesmo middlename?
SELECT MiddleName, COUNT(FirstName) AS 'Total'
FROM Person.Person
GROUP BY MiddleName

--HAVING
SELECT FirstName, COUNT(FirstName) AS 'quantidade'
FROM Person.Person
GROUP BY FirstName
HAVING COUNT (FirstName) > 10 -- só conseguimos usar depois que os dados estão agrupados

SELECT productid,sum(linetotal) as 'Total'
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LineTotal) BETWEEN 162000 and 500000

SELECT productid,AVG(linetotal) as 'Total'
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING AVG(LineTotal) >1000000

--INNER JOIN
SELECT p.businessentityID, p.firstname, p.lastname, pe.emailaddress
FROM Person.Person as P
INNER JOIN Person.EmailAddress PE ON p.businessentityID = pe.BusinessEntityID

--nomes dos produtos e as informações de suas subcategorias
--Listprice, nome do produto, subcategoria
SELECT pr.listprice,pr.NAME,pc.NAME
FROM Production.Product PR
INNER JOIN Production.ProductSubcategory PC ON PC.ProductCategoryID = pr.ProductSubcategoryID;
--LEFT JOIN
--Descobrir quais pessoas tem um cartão de credito registrado
SELECT * FROM Person.Person PP
INNER JOIN Sales.PersonCreditCard PC
ON PP.BusinessEntityID = PC.BusinessEntityID

SELECT * FROM Person.Person PP
LEFT JOIN Sales.PersonCreditCard PC
ON PP.BusinessEntityID = PC.BusinessEntityID
WHERE PC.BusinessEntityID IS NULL --854 pessoas não tem cartao de credito

--UNION
SELECT ProductID, Name, ProductNumber
FROM Production.Product
WHERE NAME like '%chain%'
UNION
SELECT ProductID, Name, ProductNumber
FROM Production.Product
WHERE NAME like '%decal%'

SELECT FirstName, Title, Middlename
FROM Person.Person
WHERE Title='MR.'
UNION
SELECT FirstName, Title, Middlename
FROM Person.Person
WHERE MiddleName='A'

--DATEPART
SELECT SalesOrderID, DATEPART (month, OrderDate) AS mes
FROM Sales.SalesOrderHeader

SELECT AVG(TotalDue) as MEDIA, DATEPART(month,OrderDate) as MES
From Sales.SalesOrderHeader
GROUP BY DATEPART(month,OrderDate)
ORDER BY Mes

SELECT AVG(TotalDue) as MEDIA, DATEPART(YEAR,OrderDate) as MES
From Sales.SalesOrderHeader
GROUP BY DATEPART(YEAR,OrderDate)
ORDER BY Mes
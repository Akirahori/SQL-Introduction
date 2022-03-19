use AdventureWorks2017

SELECT * FROM person.Person;

SELECT * FROM person.EmailAddress;
--Selecionando nome e sobrenome dos clientes
SELECT  FirstName,LastName 
FROM person.Person;

--DISTINCT
--SELECT coçuna1, coluna2 FROM tabela

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
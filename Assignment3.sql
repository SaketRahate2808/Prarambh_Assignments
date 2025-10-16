*******************************************************************Assignment 3 ************************************************************************************************


CREATE TABLE DEPT(
DeptNo NUMBER(2) PRIMARY KEY,
DName VARCHAR2(50)NOT NULL,
Loc VARCHAR2(50) NOT NULL
);

CREATE TABLE Emps(
EmpNo NUMBER(4) PRIMARY KEY,
EName VARCHAR2(50) NOT NULL,
EJob VARCHAR2(50),
Salary NUMBER(10,2),
DeptNo NUMBER(2),
CONSTRAINT fk_DeptNo FOREIGN KEY (DeptNo) REFERENCES Dept(DeptNo)
);

INSERT INTO Dept(DeptNo, DName, Loc)
VALUES(10, 'HR' , 'Bangalore');
INSERT INTO Dept(DeptNo, DName, Loc)
VALUES(20, 'IT' , 'Delhi');
INSERT INTO Dept(DeptNo, DName, Loc)
VALUES(30, 'Software' , 'Pune');
INSERT INTO Dept(DeptNo, DName, Loc)
VALUES(40, 'Sales' , 'Bangalore');
INSERT INTO Dept(DeptNo, DName, Loc)
VALUES(50, 'Accounting' , 'Bangalore');
INSERT INTO Dept(DeptNo, DName, Loc)
VALUES(60, 'Hardware' , 'Mumbai');
INSERT INTO Dept(DeptNo, DName, Loc)
VALUES(70, 'Hardware And Networking' , 'Navi Mumbai');


INSERT INTO Emps(EmpNo, EName, EJob, Salary, DeptNo)
VALUES(1212, 'Jatin', 'HR Executive', 40000,10); 
INSERT INTO Emps(EmpNo, EName, EJob, Salary, DeptNo)
VALUES(1712, 'Jayee', 'Accounting', 30000,50); 
INSERT INTO Emps(EmpNo, EName, EJob, Salary, DeptNo)
VALUES(3012, 'Tim', 'Sales', 56000,40);
INSERT INTO Emps(EmpNo, EName, EJob, Salary, DeptNo)
VALUES(3972, 'Soham', 'Accounting', 60000, 50); 
INSERT INTO Emps(EmpNo, EName, EJob, Salary, DeptNo)
VALUES(7712, 'Jatin', 'HR Executive', 90000,10); 
INSERT INTO Emps(EmpNo, EName, EJob, Salary, DeptNo)
VALUES(2432, 'Mina', 'IT', 40000,20);
INSERT INTO Emps(EmpNo, EName, EJob, Salary, DeptNo)
VALUES(9924, 'Joe', 'Sales', 230000,40);
INSERT INTO Emps(EmpNo, EName, EJob, Salary, DeptNo)
VALUES(7489, 'Yamini', 'Accounting', 73000, 50);
INSERT INTO Emps(EmpNo, EName, EJob, Salary, DeptNo)
VALUES(7645, 'Aditya', 'Sales', 92000,40); 
INSERT INTO Emps(EmpNo, EName, EJob, Salary, DeptNo)
VALUES(6713, 'Sakshi', 'Sales', 43000,40);
INSERT INTO Emps(EmpNo, EName, EJob, Salary, DeptNo)
VALUES(9805, 'Rohit', 'HR Executive', 90000,10);
INSERT INTO Emps(EmpNo, EName, EJob, Salary, DeptNo)
VALUES(6397, 'Yash', 'Accounting', 78000,50);




SELECT Ename, Salary FROM Emps
WHERE Salary > (SELECT AVG(Salary) AS Avg_Salary FROM Emps);

SELECT Ename, DeptNo FROM Emps
WHERE DeptNo IN (SELECT DeptNo FROM Dept WHERE Loc = 'Bangalore');

SELECT EmpNo, EName,  EJob , DeptNo
FROM Emps WHERE(EJob, DeptNo) IN
(SELECT EJob , DeptNo FROM Emps WHERE EmpNo = 7489);

SELECT e.Ename , E.Salary, e.DeptNo
FROM Emps e
WHERE E.salary > (SELECT AVG(Salary) FROM Emps
WHERE DeptNo = e.DeptNo);

SELECT * FROM Emps WHERE DeptNo IN (
SELECT DeptNo FROM Dept WHERE Loc = 'Bangalore');

SELECT DeptNo, AVG(Salary) FROM Emps
GROUP BY DeptNo HAVING  AVG(Salary) > (SELECT AVG(Salary) FROM Emps);

1] SELECT e.Ename ,(
SELECT DName FROM Dept d WHERE d.DeptNo = e.DeptNo) AS Department FROM Emps e;

2] SELECT e.EName , e.EJob , d.Loc FROM Emps e
JOIN Dept d ON e.DeptNo = d.DeptNo;

3] SELECT e.EName,d.DName FROM Emps e
JOIN Dept d ON e.DeptNo = d.DeptNo 
WHERE d.DName = 'Sales';

4] SELECT e.EName , d.DName , d.Loc FROM Emps e
RIGHT JOIN Dept d ON e.DeptNo = d.DeptNo
ORDER BY d.DName;

5] SELECT e.EName, d.DName FROM Emps e 
FULL OUTER JOIN Dept d ON e.DeptNo = d.DeptNo
ORDER BY e.EName;

6] SELECT d.DName , SUM(e.Salary)AS Total_Sal FROM Dept d
LEFT JOIN Emps e ON d.DeptNo = e.DeptNo
GROUP BY d.DName ORDER BY Total_Sal DESC;

7] SELECT d.DName , COUNT(e.EmpNo) AS Number_of_employees
FROM Dept d
JOIN Emps e ON d.DeptNo = e.DeptNo
GROUP BY d.DName
HAVING COUNT(e.EmpNo) > 3
ORDER BY Number_of_employees DESC;

8] SELECT e.EName , d.DName , d.Loc FROM Emps e
JOIN Dept d ON e.DeptNo = d.DeptNo
WHERE d.Loc = (SELECT Loc FROM Dept WHERE DName = 'Accounting');

9] SELECT e.EName , d.DName ,
MAX(Salary) AS Maximum_Sal FROM EMps e
INNER JOIN Dept d ON
e.DeptNo = d.DeptNo
GROUP BY d.DName , e.EName;

10] SELECT e.EName , e.Salary , d.DName FROM Emps e
JOIN Dept d ON e.DeptNo = d.DeptNo
WHERE e.Salary < (SELECT AVG(Salary) FROM emps WHERE DeptNo = e.DeptNo)
ORDER BY d.DName , e.Salary DESC;






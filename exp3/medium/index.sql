-- Create Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Insert data into Departments
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'Human Resources');

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Salary INT,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Insert data into Employees with Indian names
INSERT INTO Employees (EmployeeID, EmployeeName, Salary, DepartmentID) VALUES
(1, 'Amit', 90000, 1),
(2, 'Rahul', 120000, 1),
(3, 'Priya', 120000, 1),
(4, 'Sneha', 85000, 2),
(5, 'Kiran', 95000, 2),
(6, 'Anjali', 120000, 3),
(7, 'Rohit', 115000, 3),
(8, 'Neha', 115000, 3);

-- Query to find top earners per department using subquery
SELECT 
    d.DepartmentName,
    e.EmployeeName,
    e.Salary
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
WHERE 
    e.Salary = (
        SELECT MAX(e2.Salary)
        FROM Employees e2
        WHERE e2.DepartmentID = e.DepartmentID
    )
ORDER BY 
    d.DepartmentName,
    e.EmployeeName;

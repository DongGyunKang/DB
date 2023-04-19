

CREATE TABLE department (
depno INTEGER NOT NULL PRIMARY KEY,
deptname VARCHAR(20),
manager VARCHAR(20)
);

CREATE TABLE employee (
empno INTEGER NOT NULL PRIMARY KEY,
name VARCHAR(20),
phoneno INTEGER,
address VARCHAR(20),
sex VARCHAR(20),
position VARCHAR(20),
deptno INTEGER,
FOREIGN KEY (deptno) REFERENCES department(depno)
);

CREATE TABLE project (
projno INTEGER NOT NULL PRIMARY KEY,
projname VARCHAR(20),
deptno INTEGER,
FOREIGN KEY (deptno) REFERENCES department(depno)
);

CREATE TABLE works (
projno INTEGER NOT NULL,
empno INTEGER NOT NULL,
hoursworked INTEGER,
PRIMARY KEY (projno, empno),
FOREIGN KEY (projno) REFERENCES project(projno),
FOREIGN KEY (empno) REFERENCES employee(empno)
);

INSERT INTO department VALUES (1,'IT', '������');
INSERT INTO department VALUES (2,'Marketing', 'ȫ�浿');

INSERT INTO employee VALUES (1, '�����', 01012341232, '����','��','Programmer',1);
INSERT INTO employee VALUES (2, '�̼���', 01012323122, '����','��','Programmer',1);
INSERT INTO employee VALUES (3, '�ڿ���', 01076851231, '����','��','Salesperson',2);
INSERT INTO employee VALUES (4, 'ȫ�浿', 01012341546, '����','��','Manager',2);
INSERT INTO employee VALUES (5, '������', 01012311112, '����','��','Manager',1);

INSERT INTO project VALUES (1,'�����ͺ��̽�',1);
INSERT INTO project VALUES (2,'��������',2);

INSERT INTO works VALUES (1, 1, 3);
INSERT INTO works VALUES (1, 2, 1);
INSERT INTO works VALUES (2, 3, 1);
INSERT INTO works VALUES (2, 4, 5);
INSERT INTO works VALUES (1, 5, 1);

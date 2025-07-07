create table students(
StudentID INT PRIMARY KEY,
NAME VARCHAR(100),
CLASS VARCHAR(100)
);
CREATE TABLE SUBJECTS(
SubjectID INT PRIMARY KEY,
SubjectName varchar(100)
);

CREATE TABLE MARKS(
StudentID INT ,
SubjectID INT,
SCORE int,
PRIMARY KEY (StudentID, SubjectID),
foreign key(StudentID) references STUDENTS(StudentID),
foreign key(SubjectID) references SUBJECTS(SubjectID)
);
insert into students(StudentID, Name, Class) values
(1,'Asha','10A'),
(2,'Ravi','10A'),
(3,'Meena','10A');
insert into SUBJECTS(SubjectID,SubjectName) values
(101,'Math'),
(102,'English'),
(103,'Science');
insert into MARKS(StudentID,SubjectID,SCORE) values
(1,101,78),(1,102,88),(1,103,90),
(2,101,45),(2,102,30),(2,103,50),
(3,101,90),(3,102,92),(3,103,85);
-- getting average marks per subject
select  subjects.subjectname, avg(marks.score) as averagemark from marks
join subjects
on marks.subjectid=subjects.subjectid
group by  subjects.subjectname;


SELECT s.Name, sub.SubjectName
FROM marks m
JOIN students s ON s.StudentID = m.StudentID
JOIN subjects sub ON m.SubjectID = sub.SubjectID
JOIN (
    SELECT SubjectID, MAX(Score) AS MaxScore
    FROM marks
    GROUP BY SubjectID
) AS top_scores ON m.SubjectID = top_scores.SubjectID AND m.Score = top_scores.MaxScore;

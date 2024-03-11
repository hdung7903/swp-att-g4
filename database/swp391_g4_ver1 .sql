
use swp391_g4_ver1; 

-- Table: Role
CREATE TABLE Role (
    role_id INT NOT NULL,
    role_name VARCHAR(150) NOT NULL,
    PRIMARY KEY (role_id)
);

CREATE TABLE Feedback (
    role_id INT NOT NULL,
    role_name VARCHAR(150) NOT NULL,
    PRIMARY KEY (role_id)
);

CREATE TABLE Account (
    username VARCHAR(150) NOT NULL,
    password VARCHAR(150) NOT NULL,
    role_id INT NOT NULL,
    email varchar(50),
    PRIMARY KEY (username), 
    FOREIGN KEY (role_id) REFERENCES Role (role_id)
);

CREATE TABLE subject_instructor_mapping (
    sim_id int NOT NULL auto_increment,
	subject_id VARCHAR(150) NOT NULL,
    instructor_id VARCHAR(150) NOT NULL,
    PRIMARY KEY (sim_id),
    FOREIGN KEY (subject_id) REFERENCES Subject (subject_id),
    FOREIGN KEY (instructor_id) REFERENCES Instructor (instructor_id)
);

CREATE TABLE registion (
	regis_id int not null auto_increment primary key,
    class_id int not null,
    student_id int not null
);


insert into registion (class_id, student_id)
values
('39','1'),
('39','2'),
('30','2'),
('30','1');

CREATE TABLE subject_instructor_mapping (
    sim_id int NOT NULL auto_increment,
	subject_id VARCHAR(150) NOT NULL,
    instructor_id VARCHAR(150) NOT NULL,
    PRIMARY KEY (sim_id),
    FOREIGN KEY (subject_id) REFERENCES Subject (subject_id),
    FOREIGN KEY (instructor_id) REFERENCES Instructor (instructor_id)
);



-- Table: Student
CREATE TABLE Student (
    student_id VARCHAR(150) NOT NULL,
    student_name VARCHAR(150) NOT NULL,
    username VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL,
    dob DATE NOT NULL,
    gender BIT NOT NULL,
    isDeleted BIT NOT NULL,
    PRIMARY KEY (student_id),
    FOREIGN KEY (username) REFERENCES Account (username)
);

-- Table: Instructor
CREATE TABLE Instructor (
    instructor_id VARCHAR(150) NOT NULL,
    instructor_name VARCHAR(150) NOT NULL,
    username VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL,
    dob DATE NOT NULL,
    gender BIT NOT NULL,
    isDeleted BIT NOT NULL,
    PRIMARY KEY (instructor_id),
    FOREIGN KEY (username) REFERENCES Account (username)
);

-- Table: Class
CREATE TABLE Class (
    class_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(150) NOT NULL,
    link_url VARCHAR(150) NOT NULL
);

-- Table: Subject
CREATE TABLE Subject (
    subject_id VARCHAR(150) NOT NULL,
    subject_name VARCHAR(150) NOT NULL,
    PRIMARY KEY (subject_id)
);

-- Table: Class_subject_mapping
CREATE TABLE Class_subject_mapping (
    csm_id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    class_id int NOT NULL,
    subject_id VARCHAR(150) NOT NULL,
    total_slots INT NOT NULL,
    instructor_id VARCHAR(150) NOT NULL,
    FOREIGN KEY (class_id) REFERENCES Class (class_id),
    FOREIGN KEY (instructor_id) REFERENCES Instructor (instructor_id),
    FOREIGN KEY (subject_id) REFERENCES Subject (subject_id)
);


-- Table: Student_class_mapping
CREATE TABLE Student_class_mapping (
    scm_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    student_id VARCHAR(150) NOT NULL,
    class_id int NOT NULL,
    FOREIGN KEY (class_id) REFERENCES Class (class_id),
    FOREIGN KEY (student_id) REFERENCES Student (student_id)
);

-- Table: Session
CREATE TABLE Session (
    session_id INT NOT NULL,
    session_index INT NOT NULL,
    ses_date DATE NOT NULL,
    csm_id INT NOT NULL, -- Thay thế cột class_id bằng csm_id
    isAtt BIT NOT NULL,
    PRIMARY KEY (session_id),
    FOREIGN KEY (csm_id) REFERENCES Class_subject_mapping (csm_id) -- Thay thế khóa ngoại
);

-- Table: Attendance
CREATE TABLE Attendance (
    att_id INT NOT NULL,
    student_id VARCHAR(150) NOT NULL,
    session_id INT NOT NULL,
    status BIT NOT NULL,
    att_datetime DATETIME NOT NULL,
    att_description VARCHAR(150) NULL DEFAULT 'nothing',
    PRIMARY KEY (att_id),
    FOREIGN KEY (session_id) REFERENCES Session (session_id),
    FOREIGN KEY (student_id) REFERENCES Student (student_id)
);


-- INSERT DATA
-- Insert roles into Role table with auto-incremented role_id
-- Insert roles into the Role table
INSERT INTO Role (role_id, role_name) VALUES
(1, 'Academic Staff'),
(2, 'Admin'),
(3, 'Instructor'),
(4, 'Student');

INSERT INTO subject_instructor_mapping (subject_id, instructor_id) VALUES
(1, 'Academic Staff'),
(2, 'Admin'),
(3, 'Instructor'),
(4, 'Student');

-- Insert accounts with role 'Academic Staff'
INSERT INTO Account (username, password, role_id) VALUES
('staff', '123', 1);

-- Insert account with role 'Admin'
INSERT INTO Account (username, password, role_id) VALUES
('admin', '123', 2);

-- Insert accounts with role 'Instructor'
INSERT INTO Account (username, password, role_id) VALUES
('QuangPN', '123', 3),
('DungLDH', '123', 3),
('ThaiNH', '123', 3),
('TuanHD', '123', 3),
('PhuocLH', '123', 3),
('SonNT', '123', 3),
('HoanNN', '123', 3),
('LoanBT', '123', 3),
('HoaiBM', '123', 3),
('ThangPD', '123', 3);

-- Insert 40 accounts with role 'Student'
INSERT INTO Account (username, password, role_id) VALUES
('student1', '123', 4),
('student2', '123', 4),
('student3', '123', 4),
('student4', '123', 4),
('student5', '123', 4),
('student6', '123', 4),
('student7', '123', 4),
('student8', '123', 4),
('student9', '123', 4),
('student10', '123', 4),
('student11', '123', 4),
('student12', '123', 4),
('student13', '123', 4),
('student14', '123', 4),
('student15', '123', 4),
('student16', '123', 4),
('student17', '123', 4),
('student18', '123', 4),
('student19', '123', 4),
('student20', '123', 4),
('student21', '123', 4),
('student22', '123', 4),
('student23', '123', 4),
('student24', '123', 4),
('student25', '123', 4),
('student26', '123', 4),
('student27', '123', 4),
('student28', '123', 4),
('student29', '123', 4),
('student30', '123', 4),
('student31', '123', 4),
('student32', '123', 4),
('student33', '123', 4),
('student34', '123', 4),
('student35', '123', 4),
('student36', '123', 4),
('student37', '123', 4),
('student38', '123', 4),
('student39', '123', 4),
('student40', '123', 4);


-- Chèn 10 sinh viên vào bảng Student
INSERT INTO Student (student_id, student_name, username, email, dob, gender, isDeleted)
VALUES
('1', 'Nguyễn Văn A', 'student1', 'student1@example.com', '2000-01-01', 1, 0);

INSERT INTO Student (student_id, student_name, username, email, dob, gender, isDeleted)
VALUES
('2', 'Nguyễn Văn B', 'student2', 'student2@example.com', '2000-02-02', 0, 0),
('3', 'Nguyễn Văn C', 'student3', 'student3@example.com', '2000-03-03', 1, 0),
('4', 'Nguyễn Văn D', 'student4', 'student4@example.com', '2000-04-04', 0, 0),
('5', 'Nguyễn Văn E', 'student5', 'student5@example.com', '2000-05-05', 1, 0),
('6', 'Nguyễn Văn F', 'student6', 'student6@example.com', '2000-06-06', 0, 0),
('7', 'Nguyễn Văn G', 'student7', 'student7@example.com', '2000-07-07', 1, 0),
('8', 'Nguyễn Văn H', 'student8', 'student8@example.com', '2000-08-08', 0, 0),
('9', 'Nguyễn Văn T', 'student9', 'student9@example.com', '2000-09-09', 1, 0),
('10', 'Nguyễn Văn R', 'student10', 'student10@example.com', '2000-10-10', 0, 0);


INSERT INTO Student (student_id, student_name, username, email, dob, gender, isDeleted)
VALUES
('11', 'Lê Văn A', 'student11', 'student11@example.com', '2000-11-11', 0, 0),
('12', 'Lê Văn B', 'student12', 'student12@example.com', '2000-12-12', 0, 0),
('13', 'Lê Văn C', 'student13', 'student13@example.com', '2000-01-13', 0, 0),
('14', 'Lê Văn D', 'student14', 'student14@example.com', '2000-02-14', 0, 0),
('15', 'Lê Văn E', 'student15', 'student15@example.com', '2000-03-15', 0, 0),
('16', 'Lê Văn F', 'student16', 'student16@example.com', '2000-04-16', 0, 0),
('17', 'Lê Văn G', 'student17', 'student17@example.com', '2000-05-17', 0, 0),
('18', 'Lê Văn H', 'student18', 'student18@example.com', '2000-06-18', 0, 0),
('19', 'Lê Văn L', 'student19', 'student19@example.com', '2000-07-19', 0, 0),
('20', 'Lê Văn M', 'student20', 'student20@example.com', '2000-08-20', 0, 0),

('21', 'Trịnh Văn A', 'student21', 'student21@example.com', '2000-09-21', 1, 0),
('22', 'Trịnh Văn B', 'student22', 'student22@example.com', '2000-10-22', 1, 0),
('23', 'Trịnh Văn C', 'student23', 'student23@example.com', '2000-11-23', 1, 0),
('24', 'Trịnh Văn D', 'student24', 'student24@example.com', '2000-12-24', 1, 0),
('25', 'Trịnh Văn S', 'student25', 'student25@example.com', '2001-01-25', 1, 0),
('26', 'Trịnh Văn X', 'student26', 'student26@example.com', '2001-02-26', 1, 0),
('27', 'Trịnh Văn N', 'student27', 'student27@example.com', '2001-03-27', 1, 0),
('28', 'Trịnh Văn M', 'student28', 'student28@example.com', '2001-04-28', 1, 0),
('29', 'Trịnh Văn R', 'student29', 'student29@example.com', '2001-05-29', 1, 0),
('30', 'Trịnh Văn T', 'student30', 'student30@example.com', '2001-06-30', 1, 0),

('31', 'Phạm Văn C', 'student31', 'student31@example.com', '2001-07-31', 0, 0),
('32', 'Phạm Văn D', 'student32', 'student32@example.com', '2001-08-01', 0, 0),
('33', 'Phạm Văn B', 'student33', 'student33@example.com', '2001-09-02', 0, 0),
('34', 'Phạm Văn A', 'student34', 'student34@example.com', '2001-10-03', 0, 0),
('35', 'Phạm Văn P', 'student35', 'student35@example.com', '2001-11-04', 0, 0),
('36', 'Phạm Văn T', 'student36', 'student36@example.com', '2001-12-05', 0, 0),
('37', 'Phạm Văn M', 'student37', 'student37@example.com', '2002-01-06', 0, 0),
('38', 'Phạm Văn N', 'student38', 'student38@example.com', '2002-02-07', 0, 0),
('39', 'Phạm Văn H', 'student39', 'student39@example.com', '2002-03-08', 0, 0),
('40', 'Phạm Văn K', 'student40', 'student40@example.com', '2002-04-09', 0, 0);

-- Thêm 4 giảng viên vào bảng Instructor
INSERT INTO Instructor (instructor_id, instructor_name, username, email, dob, gender, isDeleted)
VALUES
('1', 'Nguyễn Ngọc Hoan', 'HoanNN', 'hoannn@gmail.com', '1980-01-01', 1, 0),
('2', 'Bùi Thị Loan', 'LoanBT', 'loanbt@example.com', '1981-02-02', 0, 0),
('3', 'Bùi Minh Hoài', 'HoaiBM', 'hoaibm@example.com', '1982-03-03', 0, 0),
('4', 'Phạm Đức Thắng', 'ThangPD', 'thangpd@example.com', '1983-04-04', 1, 0),
('5', 'Phạm Ngọc Quang', 'QuangPN', 'QuangPN@gmail.com', '1980-01-01', 1, 0),
('6', 'Nguyễn Hữu Thái', 'ThaiNH', 'ThaiNH@gmail.com', '1980-01-01', 1, 0),
('7', 'Lê Duy Hoàng Dũng', 'DungLDH', 'DungLDH@gmail.com', '1980-01-01', 1, 0),
('8', 'Ngô Tùng Sơn', 'SonNT', 'SonNT@gmail.com', '1980-01-01', 1, 0),
('9', 'Hoàng Đình Tuấn', 'TuanHD', 'TuanHD@gmail.com', '1980-01-01', 1, 0),
('10', 'Lê Hồng Phước', 'PhuocLH', 'PhuocLH@gmail.com', '1980-01-01', 1, 0);


-- Thêm 4 lớp vào bảng Class
INSERT INTO Class (class_id, class_name, link_url)
VALUES
('1', 'SE1753', 'meet.google.com/xcs-aron-wyz'),
('2', 'SE1760', 'meet.google.com/vgb-sgsx-niu'),
('3', 'SE1761', 'meet.google.com/zpt-fpsq-gik'),
('4', 'SE1762', 'meet.google.com/usx-vetz-rfg');

-- Chèn 4 bản ghi vào bảng Subject
INSERT INTO Subject (subject_id, subject_name)
VALUES
('1', 'FER202'),
('2', 'SWP391'),
('3', 'SWR302'),
('4', 'SWT301'),
('5', 'LAB211'),
('6', 'PRJ301'),
('7', 'CSI104'),
('8', 'JPD113'),
('9', 'IOT102'),
('10', 'PRO192');

INSERT INTO subject_instructor_mapping (subject_id, instructor_id)
VALUES
('1', '1'),
('1', '2'),
('1', '3'),
('1', '4'),

('2', '5'),
('2', '6'),
('2', '7'),
('2', '8'),

('3', '7'),
('3', '8'),
('3', '9'),
('3', '10'),

('4', '9'),
('4', '10'),
('4', '1'),
('4', '2'),

('5', '3'),
('5', '4'),
('5', '5'),
('5', '6'),

('6', '7'),
('6', '8'),
('6', '9'),
('6', '10'),

('7', '1'),
('7', '2'),
('7', '3'),
('7', '4'),

('8', '5'),
('8', '6'),
('8', '7'),
('8', '8'),

('9', '9'),
('9', '10'),
('9', '1'),
('9', '2'),

('10', '3'),
('10', '4'),
('10', '5'),
('10', '6');

-- Chèn sinh viên vào lớp SE1753
INSERT INTO Student_class_mapping (scm_id, student_id, class_id)
VALUES
('1','1', '1'), ('2','2', '1'), ('3','3', '1'), ('4','4', '1'), ('5','5', '1'),
('6','6', '1'), ('7','7', '1'), ('8','8', '1'), ('9','9', '1'), ('10','10', '1'),
('11','11', '1'), ('12','12', '1'), ('13','13', '1'), ('14','14', '1'), ('15','15', '1');

-- Chèn sinh viên vào lớp SE1760
INSERT INTO Student_class_mapping (scm_id,student_id, class_id)
VALUES
('16','16', '2'), ('17','17', '2'), ('18','18', '2'), ('19','19', '2'), ('20','20', '2'),
('21','21', '2'), ('22','22', '2'), ('23','23', '2'), ('24','24', '2'), ('25','25', '2'),
('26','26', '2'), ('27','27', '2'), ('28','28', '2'), ('29','29', '2'), ('30','30', '2');


-- Chèn sinh viên vào lớp SE1761
INSERT INTO Student_class_mapping (scm_id, student_id, class_id)
VALUES
('31', '31', '3'), ('32','32', '3'), ('33','33', '3'), ('34','34', '3'), ('35','35', '3'),
('36','36', '3'), ('37','37', '3'), ('38','38', '3'), ('39','39', '3'), ('40','40', '3'),
('41','1', '3'), ('42','2', '3'), ('43','3', '3'), ('44','4', '3'), ('45','5', '3');

-- Chèn sinh viên vào lớp SE1762
INSERT INTO Student_class_mapping (scm_id, student_id, class_id)
VALUES
('46','6', '4'), ('47','7', '4'), ('48','8', '4'), ('49','9', '4'), ('50','10', '4'),
('51','11', '4'), ('52','12', '4'), ('53','13', '4'), ('54','14', '4'), ('55','15', '4'),
('56','16', '4'), ('57','17', '4'), ('58','18', '4'), ('59','19', '4'), ('60','20', '4');

-- -------------------------------------------------------------------------------------------

use swp391_g4_ver1;
INSERT INTO Session (session_id, session_index, ses_date, csm_id, isAtt)
VALUES
(1, 1, '2024-02-19', 3, 0), 
(2, 1, '2024-02-19', 4, 0), 
(3, 1, '2024-02-20', 1, 0), 
(4, 1, '2024-02-20', 2, 0), 
(5, 2, '2024-02-21', 4, 0), 
(6, 2, '2024-02-21', 3, 0), 
(7, 2, '2024-02-23', 2, 0), 
(8, 2, '2024-02-23', 1, 0), 
(9, 3, '2024-02-26', 3, 0), 
(10, 3, '2024-02-26', 4, 0), 
(11, 3, '2024-02-27', 1, 0), 
(12, 3, '2024-02-27', 2, 0), 
(13, 4, '2024-02-29', 4, 0), 
(14, 4, '2024-02-29', 3, 0), 
(15, 4, '2024-03-01', 2, 0), 
(16, 4, '2024-03-01', 1, 0), 
(17, 5, '2024-03-04', 3, 0), 
(18, 5, '2024-03-04', 4, 0), 
(19, 5, '2024-03-05', 1, 0), 
(20, 5, '2024-03-05', 2, 0), 
(21, 6, '2024-03-07', 4, 0), 
(22, 6, '2024-03-07', 3, 0), 
(23, 6, '2024-03-08', 2, 0), 
(24, 6, '2024-03-08', 1, 0), 
(25, 7, '2024-03-11', 3, 0), 
(26, 7, '2024-03-11', 4, 0), 
(27, 7, '2024-03-12', 1, 0), 
(28, 7, '2024-03-12', 2, 0), 
(29, 8, '2024-03-14', 4, 0), 
(30, 8, '2024-03-14', 3, 0), 
(31, 8, '2024-03-15', 2, 0), 
(32, 8, '2024-03-15', 1, 0), 
(33, 9, '2024-03-18', 3, 0), 
(34, 9, '2024-03-18', 4, 0), 
(35, 9, '2024-03-19', 1, 0), 
(36, 9, '2024-03-19', 2, 0), 
(37, 10, '2024-03-21', 4, 0), 
(38, 10, '2024-03-21', 3, 0), 
(39, 10, '2024-03-22', 2, 0), 
(40, 10, '2024-03-22', 1, 0), 
(41, 11, '2024-03-25', 3, 0), 
(42, 11, '2024-03-25', 4, 0), 
(43, 11, '2024-03-26', 1, 0), 
(44, 11, '2024-03-26', 2, 0), 
(45, 12, '2024-03-28', 4, 0), 
(46, 12, '2024-03-28', 3, 0), 
(47, 12, '2024-03-29', 2, 0), 
(48, 12, '2024-03-29', 1, 0), 
(49, 13, '2024-04-01', 3, 0), 
(50, 13, '2024-04-01', 4, 0), 
(51, 13, '2024-04-02', 1, 0), 
(52, 13, '2024-04-02', 2, 0), 
(53, 14, '2024-04-04', 4, 0), 
(54, 14, '2024-04-04', 3, 0), 
(55, 14, '2024-04-05', 2, 0), 
(56, 14, '2024-04-05', 1, 0), 
(57, 15, '2024-04-08', 3, 0), 
(58, 15, '2024-04-08', 4, 0), 
(59, 15, '2024-04-09', 1, 0), 
(60, 15, '2024-04-09', 2, 0), 
(61, 16, '2024-04-11', 4, 0), 
(62, 16, '2024-04-11', 3, 0), 
(63, 16, '2024-04-12', 2, 0), 
(64, 16, '2024-04-12', 1, 0), 
(65, 17, '2024-04-15', 3, 0), 
(66, 17, '2024-04-15', 4, 0), 
(67, 17, '2024-04-16', 1, 0), 
(68, 17, '2024-04-16', 2, 0), 
(69, 18, '2024-04-18', 4, 0), 
(70, 18, '2024-04-18', 3, 0), 
(71, 18, '2024-04-19', 2, 0), 
(72, 18, '2024-04-19', 1, 0), 
(73, 19, '2024-04-22', 3, 0), 
(74, 19, '2024-04-22', 4, 0), 
(75, 19, '2024-04-23', 1, 0), 
(76, 19, '2024-04-23', 2, 0), 
(77, 20, '2024-04-25', 4, 0), 
(78, 20, '2024-04-25', 3, 0), 
(79, 20, '2024-04-26', 2, 0), 
(80, 20, '2024-04-26', 1, 0), 
(81, 1, '2024-02-19', 8, 0), 
(82, 1, '2024-02-19', 7, 0), 
(83, 1, '2024-02-21', 6, 0), 
(84, 1, '2024-02-21', 5, 0), 
(85, 2, '2024-02-22', 7, 0), 
(86, 2, '2024-02-22', 8, 0), 
(87, 2, '2024-02-23', 5, 0), 
(88, 2, '2024-02-23', 6, 0), 
(89, 3, '2024-02-26', 8, 0), 
(90, 3, '2024-02-26', 7, 0), 
(91, 3, '2024-02-28', 6, 0), 
(92, 3, '2024-02-28', 5, 0), 
(93, 4, '2024-02-29', 7, 0), 
(94, 4, '2024-02-29', 8, 0), 
(95, 4, '2024-03-01', 5, 0), 
(96, 4, '2024-03-01', 6, 0), 
(97, 5, '2024-03-04', 8, 0), 
(98, 5, '2024-03-04', 7, 0), 
(99, 5, '2024-03-06', 6, 0), 
(100, 5, '2024-03-06', 5, 0), 
(101, 6, '2024-03-07', 7, 0), 
(102, 6, '2024-03-07', 8, 0), 
(103, 6, '2024-03-08', 5, 0), 
(104, 6, '2024-03-08', 6, 0), 
(105, 7, '2024-03-11', 8, 0), 
(106, 7, '2024-03-11', 7, 0), 
(107, 7, '2024-03-13', 6, 0), 
(108, 7, '2024-03-13', 5, 0), 
(109, 8, '2024-03-14', 7, 0), 
(110, 8, '2024-03-14', 8, 0), 
(111, 8, '2024-03-15', 5, 0), 
(112, 8, '2024-03-15', 6, 0), 
(113, 9, '2024-03-18', 8, 0), 
(114, 9, '2024-03-18', 7, 0), 
(115, 9, '2024-03-20', 6, 0), 
(116, 9, '2024-03-20', 5, 0), 
(117, 10, '2024-03-21', 7, 0), 
(118, 10, '2024-03-21', 8, 0), 
(119, 10, '2024-03-22', 5, 0), 
(120, 10, '2024-03-22', 6, 0), 
(121, 11, '2024-03-25', 8, 0), 
(122, 11, '2024-03-25', 7, 0), 
(123, 11, '2024-03-27', 6, 0), 
(124, 11, '2024-03-27', 5, 0), 
(125, 12, '2024-03-28', 7, 0), 
(126, 12, '2024-03-28', 8, 0), 
(127, 12, '2024-03-29', 5, 0), 
(128, 12, '2024-03-29', 6, 0), 
(129, 13, '2024-04-01', 8, 0), 
(130, 13, '2024-04-01', 7, 0), 
(131, 13, '2024-04-03', 6, 0), 
(132, 13, '2024-04-03', 5, 0), 
(133, 14, '2024-04-04', 7, 0), 
(134, 14, '2024-04-04', 8, 0), 
(135, 14, '2024-04-05', 5, 0), 
(136, 14, '2024-04-05', 6, 0), 
(137, 15, '2024-04-08', 8, 0), 
(138, 15, '2024-04-08', 7, 0), 
(139, 15, '2024-04-10', 6, 0), 
(140, 15, '2024-04-10', 5, 0), 
(141, 16, '2024-04-11', 7, 0), 
(142, 16, '2024-04-11', 8, 0), 
(143, 16, '2024-04-12', 5, 0), 
(144, 16, '2024-04-12', 6, 0), 
(145, 17, '2024-04-15', 8, 0), 
(146, 17, '2024-04-15', 7, 0), 
(147, 17, '2024-04-17', 6, 0), 
(148, 17, '2024-04-17', 5, 0), 
(149, 18, '2024-04-18', 7, 0), 
(150, 18, '2024-04-18', 8, 0), 
(151, 18, '2024-04-19', 5, 0), 
(152, 18, '2024-04-19', 6, 0), 
(153, 19, '2024-04-22', 8, 0), 
(154, 19, '2024-04-22', 7, 0), 
(155, 19, '2024-04-24', 6, 0), 
(156, 19, '2024-04-24', 5, 0), 
(157, 20, '2024-04-25', 7, 0), 
(158, 20, '2024-04-25', 8, 0), 
(159, 20, '2024-04-26', 5, 0), 
(160, 20, '2024-04-26', 6, 0),
(161, 1, '2024-02-19', 10, 0), 
(162, 1, '2024-02-19', 9, 0), 
(163, 1, '2024-02-20', 12, 0), 
(164, 1, '2024-02-20', 11, 0), 
(165, 2, '2024-02-21', 9, 0), 
(166, 2, '2024-02-21', 10, 0), 
(167, 2, '2024-02-23', 11, 0), 
(168, 2, '2024-02-23', 12, 0), 
(169, 3, '2024-02-26', 10, 0), 
(170, 3, '2024-02-26', 9, 0), 
(171, 3, '2024-02-27', 12, 0), 
(172, 3, '2024-02-27', 11, 0), 
(173, 4, '2024-02-28', 9, 0), 
(174, 4, '2024-02-28', 10, 0), 
(175, 4, '2024-03-01', 11, 0), 
(176, 4, '2024-03-01', 12, 0), 
(177, 5, '2024-03-04', 10, 0), 
(178, 5, '2024-03-04', 9, 0), 
(179, 5, '2024-03-05', 12, 0), 
(180, 5, '2024-03-05', 11, 0), 
(181, 6, '2024-03-06', 9, 0), 
(182, 6, '2024-03-06', 10, 0), 
(183, 6, '2024-03-08', 11, 0), 
(184, 6, '2024-03-08', 12, 0), 
(185, 7, '2024-03-11', 10, 0), 
(186, 7, '2024-03-11', 9, 0), 
(187, 7, '2024-03-12', 12, 0), 
(188, 7, '2024-03-12', 11, 0), 
(189, 8, '2024-03-13', 9, 0), 
(190, 8, '2024-03-13', 10, 0), 
(191, 8, '2024-03-15', 11, 0), 
(192, 8, '2024-03-15', 12, 0), 
(193, 9, '2024-03-18', 10, 0), 
(194, 9, '2024-03-18', 9, 0), 
(195, 9, '2024-03-19', 12, 0), 
(196, 9, '2024-03-19', 11, 0), 
(197, 10, '2024-03-20', 9, 0), 
(198, 10, '2024-03-20', 10, 0), 
(199, 10, '2024-03-22', 11, 0), 
(200, 10, '2024-03-22', 12, 0), 
(201, 11, '2024-03-25', 10, 0), 
(202, 11, '2024-03-25', 9, 0), 
(203, 11, '2024-03-26', 12, 0), 
(204, 11, '2024-03-26', 11, 0), 
(205, 12, '2024-03-27', 9, 0), 
(206, 12, '2024-03-27', 10, 0), 
(207, 12, '2024-03-29', 11, 0), 
(208, 12, '2024-03-29', 12, 0), 
(209, 13, '2024-04-01', 10, 0), 
(210, 13, '2024-04-01', 9, 0), 
(211, 13, '2024-04-02', 12, 0), 
(212, 13, '2024-04-02', 11, 0), 
(213, 14, '2024-04-03', 9, 0), 
(214, 14, '2024-04-03', 10, 0), 
(215, 14, '2024-04-05', 11, 0), 
(216, 14, '2024-04-05', 12, 0), 
(217, 15, '2024-04-08', 10, 0), 
(218, 15, '2024-04-08', 9, 0), 
(219, 15, '2024-04-09', 12, 0), 
(220, 15, '2024-04-09', 11, 0), 
(221, 16, '2024-04-10', 9, 0), 
(222, 16, '2024-04-10', 10, 0), 
(223, 16, '2024-04-12', 11, 0), 
(224, 16, '2024-04-12', 12, 0), 
(225, 17, '2024-04-15', 10, 0), 
(226, 17, '2024-04-15', 9, 0), 
(227, 17, '2024-04-16', 12, 0), 
(228, 17, '2024-04-16', 11, 0), 
(229, 18, '2024-04-17', 9, 0), 
(230, 18, '2024-04-17', 10, 0), 
(231, 18, '2024-04-19', 11, 0), 
(232, 18, '2024-04-19', 12, 0), 
(233, 19, '2024-04-22', 10, 0), 
(234, 19, '2024-04-22', 9, 0), 
(235, 19, '2024-04-23', 12, 0), 
(236, 19, '2024-04-23', 11, 0), 
(237, 20, '2024-04-24', 9, 0), 
(238, 20, '2024-04-24', 10, 0), 
(239, 20, '2024-04-26', 11, 0), 
(240, 20, '2024-04-26', 12, 0);

use swp391_g4_ver1;
-- Ví dụ insert cho buổi học đầu tiên của lớp SE1753
INSERT INTO Attendance (att_id, student_id, session_id, status, att_datetime, att_description)
VALUES
(1, '1', 1, 0, '2024-02-19 08:00:00', NULL),
(2, '2', 1, 0, '2024-02-19 08:00:00', NULL),
(3, '3', 1, 0, '2024-02-19 08:00:00', NULL),
(4, '4', 1, 0, '2024-02-19 08:00:00', NULL),
(5, '5', 1, 0, '2024-02-19 08:00:00', NULL),
(6, '6', 1, 0, '2024-02-19 08:00:00', NULL),
(7, '7', 1, 0, '2024-02-19 08:00:00', NULL),
(8, '8', 1, 0, '2024-02-19 08:00:00', NULL),
(9, '9', 1, 0, '2024-02-19 08:00:00', NULL),
(10, '10', 1, 0, '2024-02-19 08:00:00', NULL),
(11, '11', 1, 0, '2024-02-19 08:00:00', NULL),
(12, '12', 1, 0, '2024-02-19 08:00:00', NULL),
(13, '13', 1, 0, '2024-02-19 08:00:00', NULL),
(14, '14', 1, 0, '2024-02-19 08:00:00', NULL),
(15, '15', 1, 0, '2024-02-19 08:00:00', NULL);

-- Ví dụ insert cho buổi học thứ hai của lớp SE1753
INSERT INTO Attendance (att_id, student_id, session_id, status, att_datetime, att_description)
VALUES
(16, '1', 2, 0, '2024-02-20 08:00:00', NULL),
(17, '2', 2, 0, '2024-02-20 08:00:00', NULL),
(18, '3', 2, 0, '2024-02-20 08:00:00', NULL),
(19, '4', 2, 0, '2024-02-20 08:00:00', NULL),
(20, '5', 2, 0, '2024-02-20 08:00:00', NULL),
(21, '6', 2, 0, '2024-02-20 08:00:00', NULL),
(22, '7', 2, 0, '2024-02-20 08:00:00', NULL),
(23, '8', 2, 0, '2024-02-20 08:00:00', NULL),
(24, '9', 2, 0, '2024-02-20 08:00:00', NULL),
(25, '10', 2, 0, '2024-02-20 08:00:00', NULL),
(26, '11', 2, 0, '2024-02-20 08:00:00', NULL),
(27, '12', 2, 0, '2024-02-20 08:00:00', NULL),
(28, '13', 2, 0, '2024-02-20 08:00:00', NULL),
(29, '14', 2, 0, '2024-02-20 08:00:00', NULL),
(30, '15', 2, 0, '2024-02-20 08:00:00', NULL);
SET SQL_SAFE_UPDATES = 0;

UPDATE Attendance
SET att_description = ''
WHERE att_description = 'nothing';
INSERT INTO Class_subject_mapping (csm_id, class_id, subject_id, total_slots, instructor_id)
VALUES
('1','1', '1', 20, '1'), -- SE1753 FER202
('2','1', '2', 20, '2'), -- SE1753 SWP391
('3','1', '3', 20, '3'), -- SE1753 SWR302
('4','1', '4', 20, '4'); -- SE1753 SWT301

INSERT INTO Class_subject_mapping (csm_id, class_id, subject_id, total_slots, instructor_id)
VALUES
('5','2', '1', 20, '1'), -- SE1760 FER202
('6','2', '2', 20, '2'), -- SE1760 SWP391
('7','2', '3', 20, '3'), -- SE1760 SWR302
('8','2', '4', 20, '4'); -- SE1760 SWT301

INSERT INTO Class_subject_mapping (csm_id, class_id, subject_id, total_slots, instructor_id)
VALUES
('9','3', '1', 20, '1'), -- SE1761 FER202
('10','3', '2', 20, '2'), -- SE1761 SWP391
('11','3', '3', 20, '3'), -- SE1761 SWR302
('12','3', '4', 20, '4'); -- SE1761 SWT301

INSERT INTO Class_subject_mapping (csm_id, class_id, subject_id, total_slots, instructor_id)
VALUES
('13','4', '1', 20, '1'), -- SE1762 FER202
('14','4', '2', 20, '2'), -- SE1762 SWP391
('15','4', '3', 20, '3'), -- SE1762 SWR302
('16','4', '4', 20, '4'); -- SE1762 SWT301

-- -----------------------------------------------------------------------------------------






-- -----------------------------------------------------------------------------------------
SELECT i.instructor_id, i.instructor_name, su.subject_name, c.class_name, c.link_url,
                    s.session_id, s.session_index, s.ses_date, s.isAtt 
                   FROM Session s INNER JOIN Class_subject_mapping csm ON csm.class_id = s.class_id
                   			INNER JOIN Instructor i ON i.instructor_id = csm.instructor_id
                  		INNER JOIN Class c ON c.class_id = csm.class_id
                			INNER JOIN Subject su ON su.subject_id = csm.subject_id
                	WHERE i.instructor_id = '1'  AND s.ses_date = '2024-01-11' ;
                    
INSERT INTO Attendance (session_id, student_id, status, att_description, att_datetime)
VALUES ('1', '12', 1, 'thg nay kha', NOW());

UPDATE Session SET isAtt = 0 WHERE session_id =1;

INSERT INTO Class_subject_mapping (class_id, subject_id, total_slots, instructor_id)
VALUES
('2', '1', 20, '1');
                    
SELECT 
    s.student_id,
    s.student_name,
    IFNULL(a.status, 0) as status,
    IFNULL(a.att_description, 'nothing') as att_description,
    a.session_id
FROM 
    Session ses
    INNER JOIN Class c ON c.class_id = ses.class_id
    INNER JOIN Student_class_mapping scm ON c.class_id = scm.class_id
    INNER JOIN Student s ON s.student_id = scm.student_id
    INNER JOIN Attendance  a ON a.student_id = s.student_id;

USE swp391_g4_ver1;
ALTER TABLE `swp391_g4_ver1`.`class_subject_mapping` 
CHANGE COLUMN `class_id` `class_id` int NOT NULL ;
ALTER TABLE `swp391_g4_ver1`.`class_subject_mapping` 
ADD CONSTRAINT `class_subject_mapping_ibfk_1`
  FOREIGN KEY (`class_id`)
  REFERENCES `swp391_g4_ver1`.`class` (`class_id`);

USE swp391_g4_ver1;  
ALTER TABLE `swp391_g4_ver1`.`student_class_mapping` 
CHANGE COLUMN `class_id` `class_id` int NOT NULL ;
ALTER TABLE `swp391_g4_ver1`.`student_class_mapping` 
ADD CONSTRAINT `student_class_mapping_ibfk_1`
  FOREIGN KEY (`class_id`)
  REFERENCES `swp391_g4_ver1`.`class` (`class_id`);

USE swp391_g4_ver1; 
ALTER TABLE `swp391_g4_ver1`.`session` 
CHANGE COLUMN `csm_id` `csm_id` INT NULL ;
ALTER TABLE `swp391_g4_ver1`.`session` 
ADD CONSTRAINT `session_ibfk_1`
  FOREIGN KEY (`csm_id`)
  REFERENCES `swp391_g4_ver1`.`class_subject_mapping` (`csm_id`);
DROP TABLE class;
INSERT INTO Class (class_name, link_url)
VALUES
('SE1767', 'meet.google.com/xcs-aron-iyz');


-- Update password for academic staff member with username 'staff'
UPDATE Account
SET password = '456'  -- replace 'new_password' with the actual new password
WHERE username = 'staff';


DROP TABLE student_class_mapping;


select * from Role;
select * from Account;
select * from Student;
select * from Instructor;-- cần chỉnh sửa và insert lại
select * from Class;
select * from Subject;
select * from Student_class_mapping;
select * from Session;
select * from Class_subject_mapping;-- cần insert lại
select * from Attendance;


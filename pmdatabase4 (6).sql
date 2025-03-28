-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2025 at 04:49 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pmdatabase4`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `Announcement_ID` varchar(20) NOT NULL,
  `USER_ID` varchar(20) NOT NULL,
  `USER_NAME` varchar(50) NOT NULL,
  `USER_Surname` varchar(50) NOT NULL,
  `USER_Role` varchar(50) NOT NULL,
  `Announcement_Detail` varchar(2000) DEFAULT NULL,
  `Announcement_Start_Date` date DEFAULT NULL,
  `Announcement_Headline` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`Announcement_ID`, `USER_ID`, `USER_NAME`, `USER_Surname`, `USER_Role`, `Announcement_Detail`, `Announcement_Start_Date`, `Announcement_Headline`) VALUES
('ANN001', 'd0005', 'John', 'Doe', 'Teacher', 'Please note that Section Forms must be submitted by next week.', '2025-04-15', 'Deadline for Section Forms'),
('ANN002', 'd0005', 'John', 'Doe', 'Teacher', 'The final exam schedule has been released.', '2025-05-01', 'Exam Schedule'),
('ANN003', 'a0001', 'Alice', 'Naja', 'Admin', 'All system maintenance will occur this weekend.', '2025-06-10', 'System Maintenance'),
('ANN004', 'a0001', 'Alice', 'Naja', 'Admin', 'Please check your course registrations before the deadline.', '2025-06-15', 'Registration Reminder');

-- --------------------------------------------------------

--
-- Table structure for table `announcement_image`
--

CREATE TABLE `announcement_image` (
  `Announcement_IMAGE_ID` varchar(20) NOT NULL,
  `Announcement_ID` varchar(20) NOT NULL,
  `A_IMAGE` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `Course_ID` varchar(20) NOT NULL,
  `Course_Name` varchar(100) NOT NULL,
  `Course_Detail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`Course_ID`, `Course_Name`, `Course_Detail`) VALUES
('01418111', 'Intro to CS', 'Basic introduction to Computer Science'),
('01418112', 'Programming Concepts', 'Fundamentals of programming design'),
('01418113', 'Computer Programming', 'Intro to a programming language'),
('01418211', 'Software Construction', 'Principles of building robust software'),
('01418221', 'Database', 'Concepts and practice of databases'),
('01418231', 'Data Structures', 'Introduction to data structures'),
('01418232', 'Algorithms', 'Fundamental algorithms for problem solving'),
('01418236', 'Operating Systems', 'OS principles and design'),
('01418321', 'System Analysis', 'Analyzing and modeling software systems'),
('01418351', 'Computer Communications', 'Networking and communication protocols');

-- --------------------------------------------------------

--
-- Table structure for table `course_review`
--

CREATE TABLE `course_review` (
  `Review_Course_ID` varchar(20) NOT NULL,
  `USER_ID` varchar(20) NOT NULL,
  `Course_ID` varchar(20) NOT NULL,
  `Review_Course_Details` text DEFAULT NULL,
  `Review_Course_Rate` int(11) DEFAULT NULL,
  `Review_Course_Date` date DEFAULT NULL,
  `Review_Course_Time` time DEFAULT NULL,
  `Course_Name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_review`
--

INSERT INTO `course_review` (`Review_Course_ID`, `USER_ID`, `Course_ID`, `Review_Course_Details`, `Review_Course_Rate`, `Review_Course_Date`, `Review_Course_Time`, `Course_Name`) VALUES
('RC001', 'b6510451001', '01418111', 'Great intro course!', 5, '2025-06-01', '09:00:00', 'Intro to CS'),
('RC002', 'b6510451002', '01418111', 'Clear explanation.', 4, '2025-06-02', '10:30:00', 'Intro to CS'),
('RC003', 'b6510451003', '01418111', 'Loved the content.', 5, '2025-06-03', '14:15:00', 'Intro to CS'),
('RC004', 'b6510451004', '01418112', 'A bit challenging but good.', 4, '2025-06-04', '11:00:00', 'Programming Concepts'),
('RC005', 'b6510451005', '01418112', 'Helpful coding assignments.', 5, '2025-06-05', '13:00:00', 'Programming Concepts'),
('RC006', 'b6510451006', '01418112', 'Improved my basics.', 4, '2025-06-06', '15:30:00', 'Programming Concepts'),
('RC007', 'b6510451007', '01418113', 'Challenging but fun.', 5, '2025-06-07', '09:00:00', 'Computer Programming'),
('RC008', 'b6510451008', '01418113', 'Projects were tough.', 4, '2025-06-08', '08:45:00', 'Computer Programming'),
('RC009', 'b6510451009', '01418113', 'Gained a lot of experience.', 5, '2025-06-09', '16:00:00', 'Computer Programming'),
('RC010', 'b6510451010', '01418211', 'Useful for real projects.', 5, '2025-06-10', '09:15:00', 'Software Construction'),
('RC011', 'b6510451011', '01418211', 'Need more examples.', 4, '2025-06-11', '10:10:00', 'Software Construction'),
('RC012', 'b6510451012', '01418211', 'Well-structured labs.', 5, '2025-06-12', '14:20:00', 'Software Construction'),
('RC013', 'b6510451013', '01418221', 'Database basics are solid.', 5, '2025-06-13', '09:30:00', 'Database'),
('RC014', 'b6510451014', '01418221', 'Practical queries.', 4, '2025-06-14', '11:45:00', 'Database'),
('RC015', 'b6510451015', '01418221', 'Enjoyed the labs!', 5, '2025-06-15', '15:40:00', 'Database'),
('RC016', 'b6510451016', '01418231', 'Data Structures are essential.', 5, '2025-06-16', '09:00:00', 'Data Structures'),
('RC017', 'b6510451017', '01418231', 'A bit heavy on theory.', 4, '2025-06-17', '14:10:00', 'Data Structures'),
('RC018', 'b6510451018', '01418231', 'Good coverage of concepts.', 4, '2025-06-18', '13:00:00', 'Data Structures'),
('RC019', 'b6510451019', '01418232', 'Algorithms well explained!', 5, '2025-06-19', '10:05:00', 'Algorithms'),
('RC020', 'b6510451020', '01418232', 'A lot of math, but useful.', 4, '2025-06-20', '13:15:00', 'Algorithms'),
('RC021', 'b6510451021', '01418232', 'Really helps problem solving.', 5, '2025-06-21', '15:45:00', 'Algorithms'),
('RC022', 'b6510451022', '01418236', 'OS concepts are interesting.', 5, '2025-06-22', '09:00:00', 'Operating Systems'),
('RC023', 'b6510451023', '01418236', 'Quite complex, needs practice.', 4, '2025-06-23', '11:30:00', 'Operating Systems'),
('RC024', 'b6510451024', '01418236', 'Loved the kernel demos.', 5, '2025-06-24', '16:10:00', 'Operating Systems'),
('RC025', 'b6510451025', '01418321', 'Good for designing systems.', 4, '2025-06-25', '09:00:00', 'System Analysis'),
('RC026', 'b6510451001', '01418321', 'Learned UML diagrams well.', 5, '2025-06-26', '08:40:00', 'System Analysis'),
('RC027', 'b6510451002', '01418321', 'Case studies are helpful.', 4, '2025-06-27', '14:00:00', 'System Analysis'),
('RC028', 'b6510451003', '01418351', 'Basics of networking covered.', 4, '2025-06-28', '09:15:00', 'Computer Communications'),
('RC029', 'b6510451004', '01418351', 'Packet analysis labs are fun.', 5, '2025-06-29', '10:50:00', 'Computer Communications'),
('RC030', 'b6510451005', '01418351', 'Clear lectures, good materials.', 5, '2025-06-30', '13:25:00', 'Computer Communications');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `Room_ID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`Room_ID`) VALUES
('R001'),
('R002'),
('R003'),
('R004'),
('R005'),
('R006'),
('R007'),
('R008'),
('R009'),
('R010');

-- --------------------------------------------------------

--
-- Table structure for table `room_schedule`
--

CREATE TABLE `room_schedule` (
  `Room_schedule_ID` int(11) NOT NULL,
  `Room_ID` varchar(20) NOT NULL,
  `Course_ID` varchar(20) DEFAULT NULL,
  `Reserve_date` datetime DEFAULT NULL,
  `Reserve_Start_time` datetime DEFAULT NULL,
  `Reserve_END_time` datetime DEFAULT NULL,
  `Book_type` varchar(50) DEFAULT NULL,
  `SEC_Number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `section_form`
--

CREATE TABLE `section_form` (
  `Section_Form_ID` varchar(20) NOT NULL,
  `Course_ID` varchar(20) NOT NULL,
  `USER_ID` varchar(20) NOT NULL,
  `SEC` int(11) DEFAULT NULL,
  `Current_Nisit_Number` int(11) DEFAULT 0,
  `Section_Form_start_time` timestamp NULL DEFAULT NULL,
  `Section_Form_Maximum_Nisit` int(11) DEFAULT NULL,
  `Section_Form_Minimum_Nisit` int(11) DEFAULT NULL,
  `Section_Form_STATUS` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `section_form`
--

INSERT INTO `section_form` (`Section_Form_ID`, `Course_ID`, `USER_ID`, `SEC`, `Current_Nisit_Number`, `Section_Form_start_time`, `Section_Form_Maximum_Nisit`, `Section_Form_Minimum_Nisit`, `Section_Form_STATUS`) VALUES
('SF001', '01418111', 'd0001', 1, 2, '2025-05-01 02:00:00', 50, 10, 'Open'),
('SF002', '01418112', 'd0002', 1, 1, '2025-05-02 03:00:00', 40, 5, 'Open'),
('SF003', '01418113', 'd0003', 2, 0, '2025-05-03 04:00:00', 45, 10, 'Open'),
('SF004', '01418211', 'd0004', 1, 0, '2025-05-04 01:30:00', 30, 5, 'Open'),
('SF005', '01418221', 'd0005', 1, 0, '2025-05-05 07:00:00', 60, 10, 'Open'),
('SF006', '01418231', 'd0001', 2, 0, '2025-05-06 06:00:00', 50, 10, 'Open'),
('SF007', '01418232', 'd0002', 1, 0, '2025-05-07 02:15:00', 40, 10, 'Open'),
('SF008', '01418236', 'd0003', 1, 0, '2025-05-08 03:45:00', 45, 15, 'Open'),
('SF009', '01418321', 'd0004', 1, 0, '2025-05-09 04:00:00', 35, 5, 'Open'),
('SF010', '01418351', 'd0005', 2, 0, '2025-05-10 07:00:00', 40, 10, 'Open');

-- --------------------------------------------------------

--
-- Table structure for table `section_form_nisit_list`
--

CREATE TABLE `section_form_nisit_list` (
  `Section_Form_Nisit_List_ID` varchar(20) NOT NULL,
  `Section_Form_ID` varchar(20) NOT NULL,
  `USER_ID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `section_form_nisit_list`
--

INSERT INTO `section_form_nisit_list` (`Section_Form_Nisit_List_ID`, `Section_Form_ID`, `USER_ID`) VALUES
('SFL001', 'SF001', 'b6510451001'),
('SFL002', 'SF001', 'b6510451002'),
('SFL003', 'SF002', 'b6510451003'),
('SFL004', 'SF003', 'b6510451010');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `USER_ID` varchar(20) NOT NULL,
  `USER_Name` varchar(50) NOT NULL,
  `USER_Surname` varchar(50) NOT NULL,
  `USER_Role` varchar(50) NOT NULL,
  `USER_Password` varchar(255) NOT NULL,
  `USER_Year` int(11) DEFAULT NULL,
  `USER_Contact_DETAIL` varchar(255) DEFAULT NULL,
  `USER_Room` varchar(20) DEFAULT NULL,
  `USER_Image` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`USER_ID`, `USER_Name`, `USER_Surname`, `USER_Role`, `USER_Password`, `USER_Year`, `USER_Contact_DETAIL`, `USER_Room`, `USER_Image`) VALUES
('a0001', 'Alice', 'Naja', 'Admin', 'adminpass', NULL, 'alice.admin@example.com', NULL, NULL),
('a0002', 'Andrew', 'Nakub', 'Admin', 'adminpass', NULL, 'andrew.admin@example.com', NULL, NULL),
('b6510451001', 'Jake', 'Collins', 'Student', 'pass01', 4, 'jake.collins@example.com', NULL, NULL),
('b6510451002', 'Emma', 'Johnson', 'Student', 'pass02', 3, 'emma.johnson@example.com', NULL, NULL),
('b6510451003', 'Ethan', 'Lee', 'Student', 'pass03', 2, 'ethan.lee@example.com', NULL, NULL),
('b6510451004', 'Olivia', 'Wang', 'Student', 'pass04', 1, 'olivia.wang@example.com', NULL, NULL),
('b6510451005', 'Liam', 'Davis', 'Student', 'pass05', 4, 'liam.davis@example.com', NULL, NULL),
('b6510451006', 'Sophia', 'Garcia', 'Student', 'pass06', 2, 'sophia.garcia@example.com', NULL, NULL),
('b6510451007', 'William', 'Martinez', 'Student', 'pass07', 3, 'william.martinez@example.com', NULL, NULL),
('b6510451008', 'Isabella', 'Rodriguez', 'Student', 'pass08', 4, 'isabella.rodriguez@example.com', NULL, NULL),
('b6510451009', 'James', 'Taylor', 'Student', 'pass09', 2, 'james.taylor@example.com', NULL, NULL),
('b6510451010', 'Charlotte', 'Hernandez', 'Student', 'pass10', 3, 'charlotte.hernandez@example.com', NULL, NULL),
('b6510451011', 'Benjamin', 'Lopez', 'Student', 'pass11', 4, 'benjamin.lopez@example.com', NULL, NULL),
('b6510451012', 'Mia', 'Wilson', 'Student', 'pass12', 1, 'mia.wilson@example.com', NULL, NULL),
('b6510451013', 'Lucas', 'Anderson', 'Student', 'pass13', 3, 'lucas.anderson@example.com', NULL, NULL),
('b6510451014', 'Amelia', 'Thomas', 'Student', 'pass14', 2, 'amelia.thomas@example.com', NULL, NULL),
('b6510451015', 'Henry', 'Moore', 'Student', 'pass15', 4, 'henry.moore@example.com', NULL, NULL),
('b6510451016', 'Harper', 'Martin', 'Student', 'pass16', 1, 'harper.martin@example.com', NULL, NULL),
('b6510451017', 'Alexander', 'Jackson', 'Student', 'pass17', 2, 'alexander.jackson@example.com', NULL, NULL),
('b6510451018', 'Ava', 'Thompson', 'Student', 'pass18', 3, 'ava.thompson@example.com', NULL, NULL),
('b6510451019', 'Daniel', 'White', 'Student', 'pass19', 4, 'daniel.white@example.com', NULL, NULL),
('b6510451020', 'Ella', 'Harris', 'Student', 'pass20', 4, 'ella.harris@example.com', NULL, NULL),
('b6510451021', 'Matthew', 'Sanchez', 'Student', 'pass21', 3, 'matthew.sanchez@example.com', NULL, NULL),
('b6510451022', 'Luna', 'Clark', 'Student', 'pass22', 1, 'luna.clark@example.com', NULL, NULL),
('b6510451023', 'Joseph', 'Young', 'Student', 'pass23', 2, 'joseph.young@example.com', NULL, NULL),
('b6510451024', 'Sofia', 'Hughes', 'Student', 'pass24', 3, 'sofia.hughes@example.com', NULL, NULL),
('b6510451025', 'David', 'Nguyen', 'Student', 'pass25', 4, 'david.nguyen@example.com', NULL, NULL),
('d0001', 'David', 'Brown', 'Teacher', 'teacherpass', NULL, 'david.brown@example.com', 'Rm101', NULL),
('d0002', 'Emily', 'Clark', 'Teacher', 'teacherpass', NULL, 'emily.clark@example.com', 'Rm102', NULL),
('d0003', 'Frank', 'Miller', 'Teacher', 'teacherpass', NULL, 'frank.miller@example.com', 'Rm103', NULL),
('d0004', 'Grace', 'Wilson', 'Teacher', 'teacherpass', NULL, 'grace.wilson@example.com', 'Rm104', NULL),
('d0005', 'John', 'Doe', 'Teacher', 'teacherpass', NULL, 'john.doe@example.com', 'Rm802', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_s_course`
--

CREATE TABLE `user_s_course` (
  `USER_s_Course_ID` varchar(20) NOT NULL,
  `USER_ID` varchar(20) NOT NULL,
  `Course_ID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_s_course`
--

INSERT INTO `user_s_course` (`USER_s_Course_ID`, `USER_ID`, `Course_ID`) VALUES
('UC001', 'd0001', '01418111'),
('UC002', 'd0001', '01418221'),
('UC003', 'd0002', '01418112'),
('UC004', 'd0002', '01418113'),
('UC005', 'd0003', '01418236'),
('UC006', 'd0003', '01418351'),
('UC007', 'd0004', '01418111'),
('UC008', 'd0004', '01418112'),
('UC009', 'd0005', '01418113'),
('UC010', 'd0005', '01418231'),
('UC011', 'b6510451001', '01418111'),
('UC012', 'b6510451001', '01418112'),
('UC013', 'b6510451001', '01418113'),
('UC014', 'b6510451001', '01418221'),
('UC015', 'b6510451002', '01418111'),
('UC016', 'b6510451002', '01418112'),
('UC017', 'b6510451002', '01418211'),
('UC018', 'b6510451002', '01418221'),
('UC019', 'b6510451003', '01418112'),
('UC020', 'b6510451003', '01418113'),
('UC021', 'b6510451003', '01418231'),
('UC022', 'b6510451003', '01418232'),
('UC023', 'b6510451004', '01418111'),
('UC024', 'b6510451004', '01418112'),
('UC025', 'b6510451004', '01418113'),
('UC026', 'b6510451004', '01418236'),
('UC027', 'b6510451005', '01418113'),
('UC028', 'b6510451005', '01418211'),
('UC029', 'b6510451005', '01418221'),
('UC030', 'b6510451005', '01418231'),
('UC031', 'b6510451006', '01418111'),
('UC032', 'b6510451006', '01418112'),
('UC033', 'b6510451006', '01418113'),
('UC034', 'b6510451006', '01418221'),
('UC035', 'b6510451007', '01418111'),
('UC036', 'b6510451007', '01418112'),
('UC037', 'b6510451007', '01418113'),
('UC038', 'b6510451007', '01418221'),
('UC039', 'b6510451008', '01418111'),
('UC040', 'b6510451008', '01418112'),
('UC041', 'b6510451008', '01418113'),
('UC042', 'b6510451008', '01418221'),
('UC043', 'b6510451009', '01418111'),
('UC044', 'b6510451009', '01418112'),
('UC045', 'b6510451009', '01418113'),
('UC046', 'b6510451009', '01418221'),
('UC047', 'b6510451010', '01418112'),
('UC048', 'b6510451010', '01418113'),
('UC049', 'b6510451010', '01418211'),
('UC050', 'b6510451010', '01418221'),
('UC051', 'b6510451011', '01418112'),
('UC052', 'b6510451011', '01418113'),
('UC053', 'b6510451011', '01418211'),
('UC054', 'b6510451011', '01418221'),
('UC055', 'b6510451012', '01418112'),
('UC056', 'b6510451012', '01418113'),
('UC057', 'b6510451012', '01418211'),
('UC058', 'b6510451012', '01418221'),
('UC059', 'b6510451013', '01418112'),
('UC060', 'b6510451013', '01418113'),
('UC061', 'b6510451013', '01418211'),
('UC062', 'b6510451013', '01418221'),
('UC063', 'b6510451014', '01418112'),
('UC064', 'b6510451014', '01418113'),
('UC065', 'b6510451014', '01418231'),
('UC066', 'b6510451014', '01418232'),
('UC067', 'b6510451015', '01418112'),
('UC068', 'b6510451015', '01418113'),
('UC069', 'b6510451015', '01418231'),
('UC070', 'b6510451015', '01418232'),
('UC071', 'b6510451016', '01418112'),
('UC072', 'b6510451016', '01418113'),
('UC073', 'b6510451016', '01418231'),
('UC074', 'b6510451016', '01418232'),
('UC075', 'b6510451017', '01418112'),
('UC076', 'b6510451017', '01418113'),
('UC077', 'b6510451017', '01418231'),
('UC078', 'b6510451017', '01418232'),
('UC079', 'b6510451018', '01418112'),
('UC080', 'b6510451018', '01418113'),
('UC081', 'b6510451018', '01418236'),
('UC082', 'b6510451018', '01418321'),
('UC083', 'b6510451019', '01418112'),
('UC084', 'b6510451019', '01418113'),
('UC085', 'b6510451019', '01418236'),
('UC086', 'b6510451019', '01418321'),
('UC087', 'b6510451020', '01418112'),
('UC088', 'b6510451020', '01418113'),
('UC089', 'b6510451020', '01418236'),
('UC090', 'b6510451020', '01418321'),
('UC091', 'b6510451021', '01418112'),
('UC092', 'b6510451021', '01418113'),
('UC093', 'b6510451021', '01418236'),
('UC094', 'b6510451021', '01418321'),
('UC095', 'b6510451022', '01418221'),
('UC096', 'b6510451022', '01418231'),
('UC097', 'b6510451022', '01418232'),
('UC098', 'b6510451022', '01418321'),
('UC099', 'b6510451023', '01418221'),
('UC100', 'b6510451023', '01418231'),
('UC101', 'b6510451023', '01418232'),
('UC102', 'b6510451023', '01418321'),
('UC103', 'b6510451024', '01418221'),
('UC104', 'b6510451024', '01418231'),
('UC105', 'b6510451024', '01418232'),
('UC106', 'b6510451024', '01418321'),
('UC107', 'b6510451025', '01418221'),
('UC108', 'b6510451025', '01418231'),
('UC109', 'b6510451025', '01418232'),
('UC110', 'b6510451025', '01418321');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`Announcement_ID`),
  ADD KEY `FK_Announcement_USER` (`USER_ID`);

--
-- Indexes for table `announcement_image`
--
ALTER TABLE `announcement_image`
  ADD PRIMARY KEY (`Announcement_IMAGE_ID`),
  ADD KEY `FK_Announcement_IMAGE_Announcement` (`Announcement_ID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`Course_ID`);

--
-- Indexes for table `course_review`
--
ALTER TABLE `course_review`
  ADD PRIMARY KEY (`Review_Course_ID`),
  ADD KEY `FK_Course_Review_USER` (`USER_ID`),
  ADD KEY `FK_Course_Review_Course` (`Course_ID`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`Room_ID`);

--
-- Indexes for table `room_schedule`
--
ALTER TABLE `room_schedule`
  ADD PRIMARY KEY (`Room_schedule_ID`),
  ADD KEY `FK_Room_Schedule_Room` (`Room_ID`),
  ADD KEY `FK_Room_Schedule_Course` (`Course_ID`);

--
-- Indexes for table `section_form`
--
ALTER TABLE `section_form`
  ADD PRIMARY KEY (`Section_Form_ID`),
  ADD KEY `FK_Section_Form_Course` (`Course_ID`),
  ADD KEY `FK_Section_Form_USER` (`USER_ID`);

--
-- Indexes for table `section_form_nisit_list`
--
ALTER TABLE `section_form_nisit_list`
  ADD PRIMARY KEY (`Section_Form_Nisit_List_ID`),
  ADD KEY `FK_Section_Form_Nisit_List_Section_Form` (`Section_Form_ID`),
  ADD KEY `FK_Section_Form_Nisit_List_USER` (`USER_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`USER_ID`);

--
-- Indexes for table `user_s_course`
--
ALTER TABLE `user_s_course`
  ADD PRIMARY KEY (`USER_s_Course_ID`),
  ADD KEY `FK_USER_s_Course_USER` (`USER_ID`),
  ADD KEY `FK_USER_s_Course_Course` (`Course_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `room_schedule`
--
ALTER TABLE `room_schedule`
  MODIFY `Room_schedule_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcement`
--
ALTER TABLE `announcement`
  ADD CONSTRAINT `FK_Announcement_USER` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `announcement_image`
--
ALTER TABLE `announcement_image`
  ADD CONSTRAINT `FK_Announcement_IMAGE_Announcement` FOREIGN KEY (`Announcement_ID`) REFERENCES `announcement` (`Announcement_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `course_review`
--
ALTER TABLE `course_review`
  ADD CONSTRAINT `FK_Course_Review_Course` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Course_Review_USER` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `room_schedule`
--
ALTER TABLE `room_schedule`
  ADD CONSTRAINT `FK_Room_Schedule_Course` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Room_Schedule_Room` FOREIGN KEY (`Room_ID`) REFERENCES `room` (`Room_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `section_form`
--
ALTER TABLE `section_form`
  ADD CONSTRAINT `FK_Section_Form_Course` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Section_Form_USER` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `section_form_nisit_list`
--
ALTER TABLE `section_form_nisit_list`
  ADD CONSTRAINT `FK_Section_Form_Nisit_List_Section_Form` FOREIGN KEY (`Section_Form_ID`) REFERENCES `section_form` (`Section_Form_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Section_Form_Nisit_List_USER` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_s_course`
--
ALTER TABLE `user_s_course`
  ADD CONSTRAINT `FK_USER_s_Course_Course` FOREIGN KEY (`Course_ID`) REFERENCES `course` (`Course_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_USER_s_Course_USER` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

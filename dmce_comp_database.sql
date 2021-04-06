-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2020 at 04:16 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dmce_computer`
--
CREATE DATABASE IF NOT EXISTS `dmce_computer` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dmce_computer`;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `student_id` varchar(20) NOT NULL,
  `semester` int(2) NOT NULL,
  `year` year(4) NOT NULL,
  `month` varchar(20) NOT NULL,
  `attendance_percent` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `attendance`:
--

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`student_id`, `semester`, `year`, `month`, `attendance_percent`) VALUES
('2017FHCO091', 5, 2019, 'July', 70),
('2017FHCO063', 5, 2019, 'July', 57),
('2017FHCO053', 5, 2019, 'July', 0),
('2017FHCO005', 5, 2019, 'July', 63),
('2017FHCO087', 5, 2019, 'July', 81),
('2017FHCO060', 5, 2019, 'July', 78),
('2017FHCO001', 5, 2019, 'July', 51),
('2017FHCO044', 5, 2019, 'July', 88),
('2017FHCO040', 5, 2019, 'July', 80),
('2017FHCO014', 5, 2019, 'July', 58),
('2017FHCO102', 5, 2019, 'July', 60),
('2017FHCO039', 5, 2019, 'July', 70),
('2017FHCO065', 5, 2019, 'July', 85),
('2017FHCO079', 5, 2019, 'July', 74),
('2017FHCO017', 5, 2019, 'July', 75),
('2017FHCO105', 5, 2019, 'July', 66),
('2017FHCO024', 5, 2019, 'July', 84),
('2017FHCO054', 5, 2019, 'July', 55),
('2017FHCO041', 5, 2019, 'July', 76),
('2017FHCO077', 5, 2019, 'July', 11);

-- --------------------------------------------------------

--
-- Table structure for table `department_batches`
--

CREATE TABLE `department_batches` (
  `div_batch_id` varchar(5) NOT NULL,
  `year_of_study` int(1) NOT NULL,
  `division` varchar(1) NOT NULL,
  `batch` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `department_batches`:
--

--
-- Dumping data for table `department_batches`
--

INSERT INTO `department_batches` (`div_batch_id`, `year_of_study`, `division`, `batch`) VALUES
('TEA1', 3, 'A', 1);

-- --------------------------------------------------------

--
-- Table structure for table `department_projects`
--

CREATE TABLE `department_projects` (
  `student_id` varchar(20) NOT NULL,
  `professor_id` varchar(20) NOT NULL,
  `semester` int(1) NOT NULL,
  `subject_name_id` varchar(5) NOT NULL,
  `project_name` varchar(50) NOT NULL,
  `project_description` varchar(100) NOT NULL,
  `project_github_link` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `department_projects`:
--   `student_id`
--       `students` -> `student_id`
--   `professor_id`
--       `professors` -> `professor_id`
--   `subject_name_id`
--       `department_subjects` -> `subject_name_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `department_subjects`
--

CREATE TABLE `department_subjects` (
  `subject_name_id` varchar(5) NOT NULL,
  `semester` int(1) NOT NULL,
  `subject_name` varchar(20) NOT NULL,
  `elective` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `department_subjects`:
--

-- --------------------------------------------------------

--
-- Table structure for table `internal_assesements`
--

CREATE TABLE `internal_assesements` (
  `student_id` varchar(20) NOT NULL,
  `semester` int(1) NOT NULL,
  `subject_name_id` varchar(5) NOT NULL,
  `average_marks` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `internal_assesements`:
--   `student_id`
--       `students` -> `student_id`
--   `subject_name_id`
--       `department_subjects` -> `subject_name_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `parent_contact`
--

CREATE TABLE `parent_contact` (
  `student_id` varchar(20) NOT NULL,
  `father_or_mother` tinyint(1) NOT NULL,
  `mobile_no` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `parent_contact`:
--   `student_id`
--       `students` -> `student_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `parent_details`
--

CREATE TABLE `parent_details` (
  `student_id` varchar(20) NOT NULL,
  `father_or_mother` tinyint(1) NOT NULL,
  `name` varchar(50) NOT NULL,
  `occupation` varchar(100) NOT NULL,
  `office_address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `parent_details`:
--   `student_id`
--       `students` -> `student_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `parent_mail`
--

CREATE TABLE `parent_mail` (
  `student_id` varchar(20) NOT NULL,
  `father_or_mother` tinyint(1) NOT NULL,
  `email_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `parent_mail`:
--   `student_id`
--       `students` -> `student_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `professors`
--

CREATE TABLE `professors` (
  `professor_id` varchar(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` text NOT NULL,
  `date_of_birth` date NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `professors`:
--

-- --------------------------------------------------------

--
-- Table structure for table `professor_address`
--

CREATE TABLE `professor_address` (
  `professor_id` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `professor_address`:
--   `professor_id`
--       `professors` -> `professor_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `professor_assigned_subject`
--

CREATE TABLE `professor_assigned_subject` (
  `professor_id` varchar(20) NOT NULL,
  `subject_name_id` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `professor_assigned_subject`:
--   `professor_id`
--       `professors` -> `professor_id`
--   `subject_name_id`
--       `department_subjects` -> `subject_name_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `professor_contact`
--

CREATE TABLE `professor_contact` (
  `professor_id` varchar(20) NOT NULL,
  `mobile_no` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `professor_contact`:
--   `professor_id`
--       `professors` -> `professor_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `professor_current_role`
--

CREATE TABLE `professor_current_role` (
  `professor_id` varchar(20) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `professor_current_role`:
--   `professor_id`
--       `professors` -> `professor_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `professor_mail`
--

CREATE TABLE `professor_mail` (
  `professor_id` varchar(20) NOT NULL,
  `email_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `professor_mail`:
--   `professor_id`
--       `professors` -> `professor_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `student_id` varchar(20) NOT NULL,
  `semester` int(1) NOT NULL,
  `subject_name_id` varchar(5) NOT NULL,
  `subject_pointer` int(2) NOT NULL,
  `number_of_kt` int(2) NOT NULL,
  `final_pointer` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `result`:
--   `student_id`
--       `students` -> `student_id`
--   `subject_name_id`
--       `department_subjects` -> `subject_name_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` varchar(20) NOT NULL,
  `image` blob DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `pcm_aggregate` int(3) DEFAULT NULL,
  `jee_or_cet_aggregate` int(3) DEFAULT NULL,
  `cap_admission_details` varchar(10) DEFAULT NULL,
  `div_batch_id` varchar(5) DEFAULT NULL,
  `roll_no` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `students`:
--   `div_batch_id`
--       `department_batches` -> `div_batch_id`
--

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `image`, `first_name`, `last_name`, `date_of_birth`, `pcm_aggregate`, `jee_or_cet_aggregate`, `cap_admission_details`, `div_batch_id`, `roll_no`) VALUES
('2017FHCO001', '', '', '', '0000-00-00', 0, 0, '', 'TEA1', 0),
('2017FHCO005', '', '', '', '0000-00-00', 0, 0, '', 'TEA1', 0),
('2017FHCO014', '', '', '', '0000-00-00', 0, 0, '', 'TEA1', 0),
('2017FHCO017', '', '', '', '0000-00-00', 0, 0, '', 'TEA1', 0),
('2017FHCO024', '', '', '', '0000-00-00', 0, 0, '', 'TEA1', 0),
('2017FHCO039', '', '', '', '0000-00-00', 0, 0, '', 'TEA1', 0),
('2017FHCO040', '', '', '', '0000-00-00', 0, 0, '', 'TEA1', 0),
('2017FHCO041', '', '', '', '0000-00-00', 0, 0, '', 'TEA1', 0),
('2017FHCO044', '', '', '', '0000-00-00', 0, 0, '', 'TEA1', 0),
('2017FHCO053', '', '', '', '0000-00-00', 0, 0, '', 'TEA1', 0),
('2017FHCO054', '', '', '', '0000-00-00', 0, 0, '', 'TEA1', 0),
('2017FHCO060', '', '', '', '0000-00-00', 0, 0, '', 'TEA1', 0),
('2017FHCO063', '', '', '', '0000-00-00', 0, 0, '', 'TEA1', 0),
('2017FHCO065', '', '', '', '0000-00-00', 0, 0, '', 'TEA1', 0),
('2017FHCO077', '', '', '', '0000-00-00', 0, 0, '', 'TEA1', 0),
('2017FHCO079', '', '', '', '0000-00-00', 0, 0, '', 'TEA1', 0),
('2017FHCO087', '', '', '', '0000-00-00', 0, 0, '', 'TEA1', 0),
('2017FHCO091', '', 'Aditya', 'Adak', '0000-00-00', 75, 120, 'jee', 'TEA1', 1),
('2017FHCO102', '', '', '', '0000-00-00', 0, 0, '', 'TEA1', 0),
('2017FHCO105', '', '', '', '0000-00-00', 0, 0, '', 'TEA1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `student_abroad_documents`
--

CREATE TABLE `student_abroad_documents` (
  `student_id` varchar(20) NOT NULL,
  `recomendation_letter_scanned_image` blob NOT NULL,
  `issuing_professor_id` varchar(20) NOT NULL,
  `i20_scanned_image` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `student_abroad_documents`:
--   `student_id`
--       `students` -> `student_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `student_achviements`
--

CREATE TABLE `student_achviements` (
  `student_id` varchar(20) NOT NULL,
  `event_description` varchar(100) NOT NULL,
  `event_location` varchar(50) NOT NULL,
  `event_date` date NOT NULL,
  `ranks_prize` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `student_achviements`:
--   `student_id`
--       `students` -> `student_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `student_address`
--

CREATE TABLE `student_address` (
  `student_id` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `student_address`:
--   `student_id`
--       `students` -> `student_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `student_complaints`
--

CREATE TABLE `student_complaints` (
  `student_id` varchar(20) NOT NULL,
  `complaint_name` varchar(100) NOT NULL,
  `desscription` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `student_complaints`:
--   `student_id`
--       `students` -> `student_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `student_contact`
--

CREATE TABLE `student_contact` (
  `student_id` varchar(20) NOT NULL,
  `mobile_no` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `student_contact`:
--   `student_id`
--       `students` -> `student_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `student_mail`
--

CREATE TABLE `student_mail` (
  `student_id` varchar(20) NOT NULL,
  `email_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `student_mail`:
--   `student_id`
--       `students` -> `student_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `student_marksheets`
--

CREATE TABLE `student_marksheets` (
  `student_id` varchar(20) NOT NULL,
  `semester` int(1) NOT NULL,
  `scanned_image` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `student_marksheets`:
--   `student_id`
--       `students` -> `student_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `student_skills`
--

CREATE TABLE `student_skills` (
  `student_id` varchar(20) NOT NULL,
  `skill_type` tinyint(1) NOT NULL,
  `skill_name` varchar(50) NOT NULL,
  `certificate` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `student_skills`:
--   `student_id`
--       `students` -> `student_id`
--

-- --------------------------------------------------------

--
-- Table structure for table `student_technical_membership`
--

CREATE TABLE `student_technical_membership` (
  `student_id` varchar(20) NOT NULL,
  `committee_name` varchar(20) NOT NULL,
  `designation` varchar(20) NOT NULL,
  `years_active` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONSHIPS FOR TABLE `student_technical_membership`:
--   `student_id`
--       `students` -> `student_id`
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department_batches`
--
ALTER TABLE `department_batches`
  ADD PRIMARY KEY (`div_batch_id`);

--
-- Indexes for table `department_projects`
--
ALTER TABLE `department_projects`
  ADD KEY `student_id` (`student_id`),
  ADD KEY `professor_id` (`professor_id`),
  ADD KEY `subject_name_id` (`subject_name_id`);

--
-- Indexes for table `department_subjects`
--
ALTER TABLE `department_subjects`
  ADD PRIMARY KEY (`subject_name_id`);

--
-- Indexes for table `internal_assesements`
--
ALTER TABLE `internal_assesements`
  ADD KEY `student_id` (`student_id`),
  ADD KEY `subject_name_id` (`subject_name_id`);

--
-- Indexes for table `parent_contact`
--
ALTER TABLE `parent_contact`
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `parent_details`
--
ALTER TABLE `parent_details`
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `parent_mail`
--
ALTER TABLE `parent_mail`
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `professors`
--
ALTER TABLE `professors`
  ADD PRIMARY KEY (`professor_id`);

--
-- Indexes for table `professor_address`
--
ALTER TABLE `professor_address`
  ADD KEY `professor_id` (`professor_id`);

--
-- Indexes for table `professor_assigned_subject`
--
ALTER TABLE `professor_assigned_subject`
  ADD KEY `professor_id` (`professor_id`),
  ADD KEY `subject_name_id` (`subject_name_id`);

--
-- Indexes for table `professor_contact`
--
ALTER TABLE `professor_contact`
  ADD KEY `professor_id` (`professor_id`);

--
-- Indexes for table `professor_current_role`
--
ALTER TABLE `professor_current_role`
  ADD KEY `professor_id` (`professor_id`);

--
-- Indexes for table `professor_mail`
--
ALTER TABLE `professor_mail`
  ADD KEY `professor_id` (`professor_id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD KEY `student_id` (`student_id`),
  ADD KEY `subject_name_id` (`subject_name_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `students_ibfk_1` (`div_batch_id`);

--
-- Indexes for table `student_abroad_documents`
--
ALTER TABLE `student_abroad_documents`
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `student_achviements`
--
ALTER TABLE `student_achviements`
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `student_address`
--
ALTER TABLE `student_address`
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `student_complaints`
--
ALTER TABLE `student_complaints`
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `student_contact`
--
ALTER TABLE `student_contact`
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `student_mail`
--
ALTER TABLE `student_mail`
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `student_marksheets`
--
ALTER TABLE `student_marksheets`
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `student_skills`
--
ALTER TABLE `student_skills`
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `student_technical_membership`
--
ALTER TABLE `student_technical_membership`
  ADD KEY `student_id` (`student_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `department_projects`
--
ALTER TABLE `department_projects`
  ADD CONSTRAINT `department_projects_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `department_projects_ibfk_2` FOREIGN KEY (`professor_id`) REFERENCES `professors` (`professor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `department_projects_ibfk_3` FOREIGN KEY (`subject_name_id`) REFERENCES `department_subjects` (`subject_name_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `internal_assesements`
--
ALTER TABLE `internal_assesements`
  ADD CONSTRAINT `internal_assesements_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `internal_assesements_ibfk_2` FOREIGN KEY (`subject_name_id`) REFERENCES `department_subjects` (`subject_name_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `parent_contact`
--
ALTER TABLE `parent_contact`
  ADD CONSTRAINT `parent_contact_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `parent_details`
--
ALTER TABLE `parent_details`
  ADD CONSTRAINT `parent_details_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `parent_mail`
--
ALTER TABLE `parent_mail`
  ADD CONSTRAINT `parent_mail_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `professor_address`
--
ALTER TABLE `professor_address`
  ADD CONSTRAINT `professor_address_ibfk_1` FOREIGN KEY (`professor_id`) REFERENCES `professors` (`professor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `professor_assigned_subject`
--
ALTER TABLE `professor_assigned_subject`
  ADD CONSTRAINT `professor_assigned_subject_ibfk_1` FOREIGN KEY (`professor_id`) REFERENCES `professors` (`professor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `professor_assigned_subject_ibfk_2` FOREIGN KEY (`subject_name_id`) REFERENCES `department_subjects` (`subject_name_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `professor_contact`
--
ALTER TABLE `professor_contact`
  ADD CONSTRAINT `professor_contact_ibfk_1` FOREIGN KEY (`professor_id`) REFERENCES `professors` (`professor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `professor_current_role`
--
ALTER TABLE `professor_current_role`
  ADD CONSTRAINT `professor_current_role_ibfk_1` FOREIGN KEY (`professor_id`) REFERENCES `professors` (`professor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `professor_mail`
--
ALTER TABLE `professor_mail`
  ADD CONSTRAINT `professor_mail_ibfk_1` FOREIGN KEY (`professor_id`) REFERENCES `professors` (`professor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `result_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `result_ibfk_2` FOREIGN KEY (`subject_name_id`) REFERENCES `department_subjects` (`subject_name_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`div_batch_id`) REFERENCES `department_batches` (`div_batch_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `student_abroad_documents`
--
ALTER TABLE `student_abroad_documents`
  ADD CONSTRAINT `student_abroad_documents_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_achviements`
--
ALTER TABLE `student_achviements`
  ADD CONSTRAINT `student_achviements_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_address`
--
ALTER TABLE `student_address`
  ADD CONSTRAINT `student_address_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_complaints`
--
ALTER TABLE `student_complaints`
  ADD CONSTRAINT `student_complaints_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_contact`
--
ALTER TABLE `student_contact`
  ADD CONSTRAINT `student_contact_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_mail`
--
ALTER TABLE `student_mail`
  ADD CONSTRAINT `student_mail_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_marksheets`
--
ALTER TABLE `student_marksheets`
  ADD CONSTRAINT `student_marksheets_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_skills`
--
ALTER TABLE `student_skills`
  ADD CONSTRAINT `student_skills_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `student_technical_membership`
--
ALTER TABLE `student_technical_membership`
  ADD CONSTRAINT `student_technical_membership_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

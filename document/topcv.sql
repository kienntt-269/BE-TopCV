-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: top_cv
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `candidates_list`
--

DROP TABLE IF EXISTS `candidates_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidates_list` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `career_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_candidates_list_user_id` (`user_id`),
  KEY `FK_candidates_list_career_id` (`career_id`),
  CONSTRAINT `FK_candidates_list_career_id` FOREIGN KEY (`career_id`) REFERENCES `career_list` (`id`),
  CONSTRAINT `FK_candidates_list_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidates_list`
--

LOCK TABLES `candidates_list` WRITE;
/*!40000 ALTER TABLE `candidates_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidates_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `career_list`
--

DROP TABLE IF EXISTS `career_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `career_list` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `career_list`
--

LOCK TABLES `career_list` WRITE;
/*!40000 ALTER TABLE `career_list` DISABLE KEYS */;
INSERT INTO `career_list` VALUES (1,NULL,NULL,NULL,NULL,NULL,'IT - Phần mềm'),(2,NULL,NULL,NULL,NULL,NULL,'Bảo hiểm'),(3,NULL,NULL,NULL,NULL,NULL,'Bất động sản'),(4,NULL,NULL,NULL,NULL,NULL,'Chứng khoán'),(5,NULL,NULL,NULL,NULL,NULL,'Cơ khí'),(6,NULL,NULL,NULL,NULL,NULL,'Du lịch');
/*!40000 ALTER TABLE `career_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `current_job`
--

DROP TABLE IF EXISTS `current_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `current_job` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `company_id` bigint NOT NULL,
  `career_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_company_id` (`company_id`),
  CONSTRAINT `FK_company_id` FOREIGN KEY (`company_id`) REFERENCES `profile_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `current_job`
--

LOCK TABLES `current_job` WRITE;
/*!40000 ALTER TABLE `current_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `current_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_list`
--

DROP TABLE IF EXISTS `job_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_list` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `company_id` bigint NOT NULL,
  `basic_salary` text,
  `recruit_number` bigint DEFAULT NULL,
  `sex` varchar(30) DEFAULT NULL,
  `age` varchar(30) DEFAULT NULL,
  `english_ielts` float DEFAULT NULL,
  `experience` float DEFAULT NULL,
  `other_requirement` text,
  `job_description` text,
  `interests` text,
  `submit_deadline` datetime(6) DEFAULT NULL,
  `career_list_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_job_company_id` (`company_id`),
  KEY `FK_career_list_id` (`career_list_id`),
  CONSTRAINT `FK_career_list_id` FOREIGN KEY (`career_list_id`) REFERENCES `career_list` (`id`),
  CONSTRAINT `FK_job_company_id` FOREIGN KEY (`company_id`) REFERENCES `profile_company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_list`
--

LOCK TABLES `job_list` WRITE;
/*!40000 ALTER TABLE `job_list` DISABLE KEYS */;
INSERT INTO `job_list` VALUES (1,NULL,NULL,NULL,NULL,NULL,'Junior Developer – Freshly Graduate With English Proficiency',0,'0',50,'no','no',6.5,1,'Responsibilities/ Daily tasks you will take care:\n\n• Make research and discuss topics using Technology documents.\n\n• Prosecute tasks and presented before class.\n\n• Participated in projects stimulated actual programs, analyse requiements, design, code and test.\n\nBasic Qualification:\n\n• Bachelor Degree in Technology.\n\n• English proficiency','• We are looking for Junior Developer of any skills\n\n• Freshly Graduate with Technology background around Hanoi for a 2 months training program\n\n• Salary and transportation included.','• Salary package minimum of 9,000,000 VND\n\n• Transportation provided\n\n• Lunch allowance',NULL,1),(2,NULL,NULL,NULL,NULL,NULL,'Kỹ Sư Cầu Nối Thị Trường Nhật Bản (Brse)',0,'0',100,'no','no',6.5,2,'• Có từ 02 năm kinh nghiệm làm việc ở vị trí BA/BrSE hoặc vị trí tương đương;\n• Có kỹ năng: làm việc nhóm, phân tích, thiết kế, giao tiếp và thuyết trình bằng tiếng Nhật;\n• Chủ động, có năng lực tự học và thái độ tích cực trong công việc;\n• Thành thạo các công cụ UML, Design và Modelling;\n• Có kinh nghiệm với các dự án ERP, Dynamic 365, SAP là 1 lợi thế;\n• Có kinh nghiệm tạo các tài liệu high-level design: RD, BD, DD\n• Tiếng Nhật: giao tiếp lưu loát, có chứng chỉ N2 trở lên','• Cầu nối giữa công ty con tại Việt Nam và công ty mẹ ở Nhật Bản;\n• Trở thành một thành viên trong đội ngũ phát triển ứng dụng web của công ty;\n• Chịu trách nhiệm trong việc phát triển và bảo trì các sản phẩm;\n• Chiu trách nhiệm tiếp nhận yêu cầu từ công ty mẹ, phân tích và truyền đạt yêu cầu cho team Developer ở Việt Nam;\n• Hỗ trợ các bạn Developer phát triển các chức năng, kiểm tra các chức năng đã hoạt động đúng với yêu cầu của khách hàng;\n• Tham gia đóng góp ý tưởng và cải tiến chất lượng của sản phẩm.','• Middle level: Lương up to $2,000 Gross/ Package tối thiểu 350M Gross VNĐ/ năm;\n• Senior level: Lương up to $3,000 Gross/ Package tối thiểu 500M Gross VNĐ/ năm;\n• Signing Bonus: 15M – 25M – 35M (tùy thuộc vào level được đánh giá);\n• Môi trường làm việc sử dụng tiếng Nhật 100%, toàn bộ các member trong dự án đều sử dụng tiếng Nhật trong quá trình phát triển dự án;\n• Tài liệu 100% tiếng Nhật, có sự hỗ trợ từ PM, Team Lead và các BrSE dày dặn kinh nghiệm để bạn có thể nâng cao kỹ năng làm dự án full-Japanese-document trong thời gian ngắn nhất;\n• Tham gia làm BrSE Long term ngồi tại offshore, được tham gia vào các công đoạn đầu tiên của dự án (RD,BD..);\n• Thường xuyên đi onsite ngắn hạn để phân tích requirement (3 tháng sẽ có 1 lần onsite sang Nhật Bản);\n• Có cơ hội nâng cao kỹ năng quản lý và kỹ năng BrSE, kĩ năng đàm phán với khách hàng cũng như đối tác của khách hàng;\n• Được training về bussiness, các hệ thống khách hàng đang sử dụng;\n• Nhận ưu đãi học phí 20% khi cho con tham gia các trường thuộc hệ thống FPT Education (cấp 1 đến cấp 3)\n• Được cấp 01 tài khoản Udemy for Business (UFB)\n\nChính sách đặc biệt dành cho Senior level:\n• Gói chuyển vùng: Up to 100M (Dành cho Senior chuyển từ HN/HCM về Đà Nẵng); Hoặc\n• 01 suất mua căn hộ FPT Plaza2 tại Đà Nẵng với giá ưu đãi (20M/m2); Hoặc\n• Gói hỗ trợ vay vốn: 04% lãi suất (package 01-02 tỷ).\n\n• Working location: Đà Nẵng/ Onsite Nhật Bản',NULL,1),(3,NULL,NULL,NULL,NULL,NULL,'name',0,'0',100,'male','no',2.5,2,'• Nắm vững nguyên lý và mô hình lập trình MVC (Model – View – Controller);\n• Biết dùng HTML/CSS (HTML5, CSS3), Less or Sass, Javascript (JQuery, HighCharts, …);\n• Thành thạo sử dụng JSP (thư viện JSTL). t HTML/CSS/Javascript;\n\nĐối với tầng Controller:\n• Sử dụng thành thạo Java Core, nắm được điểm khác biệt của nền tảng J2SE/ J2ME/J2EE;\n• Đã làm việc với ít nhất một trong các framework như Spring MVC, JSF, Struts hoặc các framework tương tự;\n• Đã từng sử dụng các tool để thiết kế cơ sở dữ liệu của hệ thống quản trị thông tin;\n• Sử dụng thành thạo với một trong các hệ quản trị cơ sở dữ liệu: MySQL, PostgreSQL, … và công nghệ ORM (JPA2, Hibernate);\n• Đã từng làm việc với các hệ quản trị dữ liệu NoSQL như: Cassandra, MongoDB, HBase, Redis, … là một lợi thế;\n• Biết sử dụng các công cụ như: Git, Maven, công cụ quản lý lỗi và một trong các công cụ lập trình Netbeans, Eclipse, IntelliJ;\n• Tiếng Nhật: giao tiếp tốt (N3 trở lên).','• Tham gia đầy đủ vào các khâu trong quá trình phát triển sản phẩm: Phân tích, thiết kế, phát triển, tích hợp và đóng gói sản phẩm, ….;\n• Nghiên cứu/ đánh giá/ lựa chọn công nghệ cho mảng lĩnh vực mình phụ trách, đáp ứng yêu cầu đặt ra cho sản phẩm;\n• Tham gia thiết kế triến trúc hệ thống, thiết kế cơ sở dữ liệu, thiết kế mã nguồn (Interface), Design Pattern cùng các thành viên trong dự án;\n• Lập trình, phát triển các sản phẩm có hiệu năng cao, đáp ứng cho tập người dùng lớn.','• Middle level: Lương up to $2,000 Gross/ Package tối thiểu 350M Gross VNĐ/ năm;\n• Senior level: Lương up to $3,000 Gross/ Package tối thiểu 500M Gross VNĐ/ năm;\n• Signing Bonus: 15M – 25M – 35M (tùy thuộc vào level được đánh giá);\n• Môi trường làm việc sử dụng tiếng Nhật 100%, toàn bộ các member trong dự án đều sử dụng tiếng Nhật trong quá trình phát triển dự án;\n• Tài liệu 100% tiếng Nhật, có sự hỗ trợ từ PM, Team Lead và các BrSE dày dặn kinh nghiệm để bạn có thể nâng cao kỹ năng làm dự án full-Japanese-document trong thời gian ngắn nhất;\n• Tham gia làm BrSE Long term ngồi tại offshore, được tham gia vào các công đoạn đầu tiên của dự án (RD,BD..);\n• Thường xuyên đi onsite ngắn hạn để phân tích requirement (3 tháng sẽ có 1 lần onsite sang Nhật Bản);\n• Có cơ hội nâng cao kỹ năng quản lý và kỹ năng BrSE, kĩ năng đàm phán với khách hàng cũng như đối tác của khách hàng;\n• Được training về bussiness, các hệ thống khách hàng đang sử dụng;\n• Nhận ưu đãi học phí 20% khi cho con tham gia các trường thuộc hệ thống FPT Education (cấp 1 đến cấp 3)\n• Được cấp 01 tài khoản Udemy for Business (UFB)',NULL,1),(4,NULL,NULL,NULL,NULL,NULL,'Brse Tiếng Nhật - Signing Bonus Up To 35M',0,'0',100,'male','18 - 24',1.5,2,'• Có trình độ tiếng Nhật N2 trở lên (bắt buộc).\n• Có kinh nghiệm làm leader và quản lý nhóm (từng làm PM 2-3 năm)\n• Có kinh nghiệm làm việc với khách hàng Nhật\n• Chủ động, có khả năng thương lượng với khách hàng, partner nội bộ cũng như bên thứ 3.\n• Có hiểu biết 1 trong những ngôn ngữ phát triển phần mềm : .NET, JAVA, COBOL','• Tham gia xây dựng / kiến tạo dự án với vai trò PM/BRSE\n• Short-Onsite nếu cần để clear requirement, assessment dự án, thảo luận và final process/ template trong dự án với khách hàng\n• Report/báo cáo tiến độ, chất lượng dự án.\n• Control/tracking/giải quyết issue dự án , chịu trách nhiệm dự án.\n• Tham gia pre-sale, estimate effort/budget dự án và đề xuất với khách hàng.\n• Có kinh nghiệm tạo tài liệu design (basic design/Detail design)\n• Có kinh nghiệm các công đoạn từ coding - testing sản phẩm.\n• Có kỹ năng kinh nghiệm về process đảm bảo chất lượng sản phẩm.','• Thu nhập: 500,000,000-800,000,000 VNĐ/Year\n• Cơ hội điều hành các dự án lớn của khách hàng. Va chạm và học hỏi nhiều về hệ thống lớn, cách quản lý team size lớn.\n• Lộ trình thăng tiến rõ ràng, rất nhiều vị trí và cơ hội thăng tiến.\n• Được tham gia các hoạt động lễ tết, team building, nghỉ mát',NULL,1),(5,NULL,NULL,NULL,NULL,NULL,'Lập Trình Viên Front-End_Front-End Developer',0,'0',100,'female','19 - 23',4.5,2,'- Có tinh thần trách nhiệm cao, định hướng làm team leader\n\n- Thành thạo Javascript, Typescript, HTML5/CSS3, framework Vue.js\n\n- Có kinh nghiệm sử dụng Git\n\n- Có 3 năm kinh nghiệm ','- Phát triển team Front End\n\n- Phát triển ứng dụng web phía front-end, sử dụng framework Vue.js\n\n- Cắt HTML, CSS: chuyển file thiết kết Photoshop thành template HTML, CSS, Javascript\n\n- Thực hiện các công việc khác phát sinh ','- Thu nhập từ 500$-1500$ (hoặc thỏa thuận theo năng lực của ứng viên)\n\n- Thưởng tháng 13, review lương 2 lần một năm\n\n- Hỗ trợ ăn trưa, hỗ trợ phí đi lại\n\n- Trợ cấp thi chứng chỉ kỹ thuật, năng lực tiếng nhật, các seminar ngoài công ty\n\n- Tham gia bảo hiểm theo quy định của nhà nước\n\n- Khám sức khoẻ định kỳ 1 năm 1 lần\n\n- Nghỉ phép: theo quy định của nhà nước',NULL,1),(6,NULL,NULL,NULL,NULL,NULL,'Business Analyst',1,'0',100,'male','25 - 30',5,2,'• Trình độ:  Tốt nghiệp, Cao Đẳng, Đại học (chuyển ngành CNTT, Kinh tế, Khoa học máy tính hoặc các chuyên ngành liên quan) \n• Kinh nghiệm:  Từ 1 năm kinh nghiệm tại vị trí tương đương\n• Tin học: Sử dụng tốt các công công cụ BA, Test. \n• Yêu cầu khác: Có hiểu biết về quy trình, nghiệp vụ một trong các lĩnh vực: Quản trị dự án, Quản lý quy trình, Quản lý công văn, Chữ ký điện tử.\n• Kỹ năng:  \n- Kỹ năng giao tiếp, truyền đạt tốt\n- Kỹ năng làm việc nhóm và làm việc độc lập\n- Kỹ năng tổ chức và quản lý thời gian\n- Kỹ năng làm việc dưới áp lực\n• Thái độ:  Chăm chỉ, nhiệt tình, hòa đồng và có trách nhiệm trong công việc.','- Phân tích các yêu cầu kinh doanh / kỹ thuật bao gồm các yêu cầu chức năng và phi chức năng đối với các thành phần của dự án và các tài liệu liên quan khác bao gồm use cases/user stories.\n- Làm việc với các nhà cung cấp giải pháp bên trong và bên ngoài để xác định và đánh giá các lựa chọn giải pháp đáp ứng các yêu của người dùng và các mục tiêu tiến độ của dự án\n- Chịu trách nhiệm đánh giá các quy trình kinh doanh, xác định các yêu cầu kinh doanh và đề xuất các giải pháp tích hợp.\n- Cung cấp hỗ trợ cho Người dùng cuối; đáp ứng các yêu cầu, bao gồm nghiên cứu và khắc phục sự cố, đề xuất các giải pháp để đáp ứng nhu cầu kinh doanh.\n- Hỗ trợ các dự án và phát triển chức năng, cải tiến và triển khai hệ thống trong khi vẫn đảm bảo tài liệu về tất cả các yêu cầu nghiệp vụ, quy trình và thủ tục công việc.\n- Thực hiện các nhiệm vụ khác theo sự phân công.','- Lương thỏa thuận theo kinh nghiệm và năng lực\n- Có lương tháng thứ 13, thưởng lễ tết, thưởng hiệu quả kinh doanh theo quy định và theo kết quả kinh doanh của Công ty.\n- Được tham gia đào tạo nghiệp vụ trong và ngoài nước theo yêu cầu công việc.\n- Tham gia các khóa đào tạo kỹ năng mềm phục vụ cho công việc\n- Được làm việc trong một môi trường công việc thực tế, năng động cùng với các chuyên gia hàng đầu trong nhiều lĩnh vực của công ty.\n- Xét tăng lương hàng năm.\n- Chế độ bảo hiểm xã hội đầy đủ theo quy định của Luật.\n- Gói bảo hiểm chăm sóc sức khỏe toàn diện cho CBNV\n- Du lịch, team building 2-3 lần / năm.\n- Tủ sách miễn phí.\n- Nhiều chính sách đãi ngộ hấp dẫn khác.',NULL,1),(7,NULL,NULL,NULL,NULL,NULL,'Lập Trình Viên Backend/ Backend Developer',1,'0',100,'female','no',6,2,'other_requirement','job_description','interests',NULL,1),(8,NULL,NULL,NULL,NULL,NULL,'name',1,'0',100,'no','18-22',5,2,'Tốt nghiệp ĐH/CĐ chuyên ngành CNTT hoặc các chuyên ngành liên quan\nThành thạo các kiến thức về .NET Framework hoặc .NET Core (C#, ASP.NET, MVC, ...) Có kinh nghiệm xây dựng các hệ thống sử dụng .NET là lợi thế\nƯu tiên ứng viện có kinh nghiệm làm việc với Web API\nCó kinh nghiệm với 1 trong các cơ sở dữ liệu SQL Server, MySQL, PostgreSQL. Đã từng làm sản phẩm sử dụng NoSQL: MongoDB, CouchBase, Redis, RabbitMQ, … là lợi thế\nCó kiến thức về OOP, Design Pattern, nguyên lý SOLID, SOA/Micro Service\nƯu tiên ứng viên thích làm product, tư duy làm sản phẩm cao, sản phẩm hướng người dùng cuối.\nGiao tiếp tốt, chủ động, khả năng làm việc nhóm tốt','Tham gia phát triển các sản phẩm phục vụ cho hàng trăm nghìn khách hàng về các mảng Tài chính kế toán, Điều hành doanh nghiệp, Quản lý bán hàng cũng như eLearning\nXây dựng và tối ưu sản phẩm đáp ứng hàng trăm nghìn người sử dụng đồng thời\nTham gia nghiên cứu và ứng dụng các công nghệ mới vào sản phẩm: Blockchain, AI, Machine Learning, BigData, RPA, …\nPhối hợp cùng đội ngũ BA phân tích, thiết kế, đưa ra giải pháp để phát triển phần mềm đáp ứng đúng, đủ, tiện các yêu cầu của người dùng cuối','Lương cạnh tranh có thể lên tới 40tr/tháng (Phụ thuộc vào năng lực và kinh nghiệm của bạn, chúng tôi không bao giờ đãi ngộ thấp hơn khả năng của bạn)\nXem xét điều chỉnh lương cứng 2 lần/năm\nThưởng cuối năm theo năng suất làm việc từ 2 tháng lương\nĂn trưa miễn phí tại công ty\nThời gian làm việc: 8h - 17h30 (thứ 2- thứ 6)\nQuà tặng sinh nhật, chế độ ốm đau, thai sản, nghỉ mát, teambuilding, khám sức khỏe đầy đủ\nCó các CLB Văn hóa, Thể thao và nhiều chương trình văn thể mỹ sinh hoạt thường xuyên\nKhông gian làm việc hiện đại, thoáng đãng, nhiều tiện ích giải trí: quầy bar, sân golf mini, khu leo núi…\nKhuôn viên xung quanh văn phòng thoáng mát, thuận tiện giao thông',NULL,1),(9,NULL,NULL,NULL,NULL,NULL,'Java Developer',2,'0',100,'female','no',2,2,'• Có chuyên môn về phát triển phần mềm bằng Java và Spring, Microservices, Rest API\n\n• Có kinh nghiệm sử dụng các framework Spring, Angular, ReactJS, Hibernate\n\n• Có thể sử dụng một trong các hệ quản trị cơ sở dữ liệu Mysql, Oracle, Sql server và cơ sở dữ liệu NoSQL\n\n• Hiểu biết về webservice SOAP/Restful, chuẩn message JSON, XML, OOP, Design pattern ...\n\n• Hiểu biết thành thạo về các công cụ hỗ trợ phát triển như Git, Jira\n\n• Có tư duy logic và kỹ năng giải quyết vấn đề\n\n• Là sinh viên đã/sắp tốt nghiệp chuyên ngành Công nghệ thông tin, Toán tin, Khoa học máy tính, Kỹ thuật phần mềm, Ứng dụng di động, Điện tử viễn thông... hoặc các chuyên ngành có liên quan.','• Nghiên cứu phát triển nền tảng, ứng dụng và hệ sinh thái IoT: IoT Platform, M2M & eSIM Platform, Smart Home ecosystem\n\n• Nghiên cứu phát triển các phần mềm và nền tảng Chuyển đổi số Doanh nghiệp\n\n• Nghiên cứu phát triển nền tảng và hệ thống lõi viễn thông hiệu năng cao','• Xét lương 2 lần/năm, 16 tháng lương/1 năm\n\n• Thưởng hấp dẫn, được tham gia đóng BHXN BHYT\n\n• Tiếp cận CN mới nhất IoT, 5G, Cloud, Big Data\n\n• Môi trường trẻ trung, chuyên nghiệp, ăn trưa free',NULL,1),(10,NULL,NULL,NULL,NULL,NULL,'Junior/Senior Frontend Developer',3,'0',100,'no','25-30',1,2,'- Kinh nghiệm về lập trình web ít nhất 1 năm.\n\n- Có từ 1 năm kinh nghiệm phát triển dự án Vue.js.\n\n- Có kinh nghiệm làm việc với NuxtJS là một lợi thế.\n\n- Có khả năng làm việc tốt với CSS, SCSS, JavaScript.\n\n- Có kinh nghiệm làm việc với Tailwind CSS là một lợi thế.','- Tham gia phát triển ứng dụng web trên nền tảng Vue.js (NuxtJS).\n\n- Tối ưu một số tính năng sẵn có của các hệ thống hiện tại.\n\n- Nghiên cứu các công nghệ mới để cải thiện tính năng và phát triển các tính năng mới.','- Lương thoả thuận, có thể lên đến 25 triệu.\n\n- Review lương theo năng lực và hiệu quả 2 lần 1 năm\n\n- Lương tháng 13\n\n- Hỗ trợ ăn trưa\n\n- Ngày nghỉ: 12 ngày phép/năm\n\n- Tham gia đầy đủ các chế độ BHYT, BHXH, BHTN\n\n- Teambuilding 2 lần/năm.',NULL,1),(11,NULL,NULL,NULL,NULL,NULL,'Junior Android Developer',4,'0',100,'female','35-40',3.5,2,'- Có kinh nghiệm lập trình Android tối thiểu 6 tháng.\n- Nắm được khái niệm Android cơ bản (Activity/Service/View System, Resource, Storage, Thread Handling).\n- Đã từng sử dụng một trong các kiến trúc MVP, MVVM.\n- Hiểu biết Design Pattern là một lợi thế.\n- Có khả năng dựng module độc lập là một lợi thế.\n- Có hiểu biết về Web, Cloud technology là một lợi thế.\n- Am hiểu Agile Scrum là một lợi thế.\n- Đam mê, chủ động công việc, có kỹ năng làm việc nhóm, làm việc độc lập.\n- Đam mê phát triển sản phẩm.\n- Có kỹ năng làm việc nhóm/theo quy trình là một lợi thế.','- Phát triển ứng dụng, module ứng dụng Android theo phân phối của Team Leader.\n- Tham gia phân tích, thiết kế kiến trúc, luồng nghiệp vụ của ứng dụng di động theo phân phối của team leader.\n- Phối hợp với Level Middle/Senior Developer thực hành code review.\n- Phối hợp với các team liên quan vận hành dự án theo quy trình.\n- Tham gia hướng dẫn, đào tạo member mới.\n- Được phép tự do nghiên cứu công nghệ mới, đề xuất ý tưởng đóng góp vào dự án.','- Môi trường thẳng thắn cực đoan - trà đá, bàn tròn, ném đá sếp, áp dụng triệt để văn hóa 6K startup, TSB3C.\n- Luyện lên level cùng hệ sinh thái các sản phẩm có 30 triệu người dùng hàng tháng trên toàn cầu: Âu, Úc, Mỹ, Ấn Độ, Brazil, South Africa...\n- Thực chiến cùng quản lý, chuyên gia từ các tập đoàn lớn: Topica, VNG, Samsung,...\n- Mức lương hấp dẫn từ 12.000.000 - 20.000.000 VNĐ.\n- Cơ chế đãi ngộ tập trung vào phát triển nhân tài và xây dựng theo concept gia tốc: Nhân sự Top đầu tăng lương gấp 6 lần nhân sự Top dưới.\n- Thưởng 4-6 tháng lương 1 năm với nhân sự Top đầu.\n- Bổ nhiệm ngay khi có chiến công đặc biệt.\n- Văn hóa làm việc GenZ: trẻ trung, sáng tạo, dám nghĩ - dám làm.\n- Tham gia các hoạt động vui chơi giải trí, du lịch, team building, ăn uống cùng các thành viên trong công ty.',NULL,1),(12,'0','2022-09-17 23:37:42.637000',NULL,'0','2022-09-17 23:37:42.637000','Data Engineer',7,'',1,'no','no',NULL,4,'- Ít nhất 3 năm kinh nghiệm làm việc với Apache Spark hoặc tương đương.- Có kinh nghiệm tốt về thiết kế và phát triển ứng dụng hướng đối tượng.- Có kinh nghiệm làm việc với Big Data, Data Lake, Data Warehouse.- Kinh nghiệm trong giải quyết vấn đề, thuật toán, cấu trúc dữ liệu, design pattern.- Kiến thức tốt về các hệ quản trị cơ sở dữ liệu.- Biết rõ SQL và cải thiện tốc độ truy vấn.- Kinh nghiệm về triển khai hệ thống, xây dựng cơ sở dữ liệu.- Hiểu biết vững về vòng đời phát triển phần mềm (SDLC), là một quy trinh tiêu chuẩn để thiết kế ứng dụng.','- Phân tích, thiết kế mô hình cơ sở dữ liệu và hỗ trợ truy xuất dữ liệu.- Xây dựng các tiến trình trích xuất, biến đổi và tải dữ liệu (ETL).- Thực hiện các quy trình và giám sát chất lượng dữ liệu, đảm bảo dữ liệu luôn chính xác và sẵn có cho các bên liên quan.- Tích hợp các công nghệ quản lý dữ liệu và kỹ thuật phần mềm đang phát triển vào cấu trúc dữ liệu hiện có.- Phát triển các quy trình thiết lập để khai thác dữ liệu, mô hình hóa dữ liệu.- Phối hợp với các thành viên khác trong nhóm để đảm bảo chất lượng và thời gian phân phối triển khai sản phẩm được liên tục.- Khám phá các công nghệ mới để giải quyết các thách thức kỹ thuật.- Đưa ra giải pháp kỹ thuật cho vấn đề cụ thể và thực hiện giải pháp.- Góp phần cải thiện nền tảng sản phẩm.','24','2022-09-17 23:37:27.790000',1);
/*!40000 ALTER TABLE `job_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `permission_key` varchar(50) NOT NULL,
  `permission_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'USER_CREATE','tạo user'),(2,'USER_READ','xem user'),(3,'USER_UPDATE','sửa user'),(4,'USER_DELETE','xóa user');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_company`
--

DROP TABLE IF EXISTS `profile_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_company` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `born` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `name_asc` varchar(255) DEFAULT NULL,
  `introduction` text,
  `staff_number` bigint DEFAULT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `current_address` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_company`
--

LOCK TABLES `profile_company` WRITE;
/*!40000 ALTER TABLE `profile_company` DISABLE KEYS */;
INSERT INTO `profile_company` VALUES (1,NULL,NULL,NULL,NULL,NULL,'https://cdn.topcv.vn/80/company_logos/fpt-software-6073b38a10cb4.jpg',NULL,'FPT Software','fpt-software','FPT Software là công ty thành viên thuộc Tập đoàn FPT. Được thành lập từ năm 1999, FPT Software hiện là công ty chuyên cung cấp các dịch vụ và giải pháp phần mềm cho các khách hàng quốc tế, với hơn 20.000 nhân viên, hiện diện tại 27 quốc gia trên toàn cầu. Nhiều năm liền, FPT Software được bình chọn là Nhà Tuyển dụng được yêu thích nhất và nằm trong TOP các công ty có môi trường làm việc tốt nhất châu Á.',15000,NULL,'FPT Building, 17 Duy Tân Str., Cầu Giấy District, Hanoi,','https://www.fpt-software.com'),(2,NULL,NULL,NULL,NULL,NULL,'https://cdn.topcv.vn/140/company_logos/cong-ty-tnhh-cmc-global-1d94bf2be044cc832cd72d2f4f8fad66-5e72d0edadcfb.jpg',NULL,'Công ty TNHH CMC GLOBAL','cmc-global','CMC Global ra đời từ kinh nghiệm 25 năm trong lĩnh vực ICT và hơn 10 năm kinh nghiệm trong lĩnh vực Outsourcing của Tập đoàn công nghệ CMC, với sứ mệnh trở thành đơn vị cung cấp nhân lực kỹ sư phần mềm chất lượng cao, cung cấp các giải pháp, dịch vụ CNTT cho thị trường quốc tế. Hiện CMC Global đang sở hữu đến 700++ nhân viên, cùng một công ty thành viên tại Nhật Bản.\n\nTập đoàn công nghệ CMC cùng CMC Global tự hào là một trong những doanh nghiệp hàng đầu Việt Nam trong lĩnh vực phát triển, cung cấp các giải pháp và dịch vụ phần mềm. Chia sẻ chung những tiêu chí tiên quyết cho sự phát triển của Tập đoàn CMC: Sáng tạo, Chuyên nghiệp, Đồng đội, CMC Global luôn nỗ lực không ngừng để xây dựng một tập thể vững mạnh, tiên phong trong nền công nghệ Việt Nam và ngày một vươn xa ra thế giới.\n\nVới mục tiêu đưa các sản phẩm và dịch vụ công nghệ cao của CMC ra thế giới, CMC Global đang xây dựng những nền móng đầu tiên với tham vọng: có ít nhất 2.000 người làm việc ở nước ngoài vào năm 2022; doanh thu phần mềm và dịch vụ từ thị trường xuất khẩu lớn hơn thị trường trong nước; có nhiều sản phẩm và dịch vụ đạt tiêu chuẩn hàng đầu thế giới. Trong tương lai, ngoài công ty thành viên CMC Japan tại Nhật Bản, CMC Global sẽ mở thêm các chi nhánh tại các nước châu Á như Singapore, Malaysia,….\n\nChiến lược đầu tư của CMC Global được định vị có phần khác biệt so với các công ty outsourcing cũng ngành ở thị trường Việt Nam. CMC Global sẽ chú trọng vào việc phát triển nguồn lực, chuẩn hóa qui trình cung cấp dịch vụ và phát triển phần mềm, đào tạo nhân sự chất lượng cao, cùng lúc thu hút số lượng lớn các nhân tài trong lĩnh vực công nghệ thông tin. Đồng thời, CMC Global cũng sẽ là đại diện, cầu nối cho các công ty thành viên của CMC trong việc cung cấp các giải pháp và dịch vụ tích hợp trọn gói ra thế giới.',1000,NULL,'Tầng 8-9, Tòa CMC, Duy Tân, Cầu Giấy, Hà Nội','http://cmcglobal.com.vn'),(3,NULL,NULL,NULL,NULL,NULL,'https://cdn.topcv.vn/140/company_logos/cong-ty-co-phan-ha-tang-vien-thong-cmc-telecom-5af4f4a61b6e4_rs.jpg',NULL,'CÔNG TY CỔ PHẦN HẠ TẦNG VIỄN THÔNG CMC TELECOM','cmc-telecom','CMC Telecom là một trong 8 công ty thành viên của Tập đoàn Công nghệ CMC. Với gần 9 năm xây dựng, phát triển, CMC Telecom là công ty hạ tầng viễn thông nằm trong TOP 4 các công ty viễn thông hàng đầu Việt Nam. CMC Telecom là nhà cung cấp đầu tiên áp dụng công nghệ GPON và sở hữu hạ tầng truyền dẫn 100% cáp quang.\n\nCMC Telecom được biết tới là nhà cung cấp dịch vụ toàn diện với các sản phẩm truyền số liệu chuyên biệt cho doanh nghiệp như Internet Leased Line, dịch vụ Wan nội hạt; liên tỉnh; quốc tế, Internet cáp quang cho doanh nghiệp và đặc biệt là sản phẩm Internet trên mạng Truyền hình cáp Việt Nam (VTVnet) cho gia đình. Không chỉ cung cấp những dịch vụ viễn thông cơ bản, CMC Telecom còn cung cấp cả các dịch vụ gia tăng cho khối khách hàng doanh nghiệp như Video Conference, Bảo mật Hệ thống và dịch vụ Managed Service…\n\nHai (02) Data Center trung lập tiêu chuẩn Tier3 của CMC Telecom tại Hà Nội và TP Hồ Chí Minh (thuộc Liên minh Dữ liệu Á Châu ADCA) đã nhận được chứng nhận về bảo mật, an toàn thông tin theo tiêu chuẩn quốc tế IEC/ISO 27001.\n\n* VÌ SAO BẠN LẠI LỰA CHỌN CMC Telecom LÀ NƠI PHÁT TRIỂN SỰ NGHIỆP:\n\nNgay từ những ngày đầu thành lập, chúng tôi luôn mong muốn tập hợp được đội ngũ nhân sự có trình độ chuyên môn cao, có tư cách đạo đức tốt để cùng hợp tác, phát triển và chung tay xây dựng công ty ngày càng lớn mạnh và phát triển không ngừng.\n\nĐối với chúng tôi, nhân lực là tài sản quý giá nhất. Sự thành công của CMC Telecom ngày hôm nay có được là nhờ sự đóng góp to lớn của những thế hệ đã và đang làm việc từ khi mới thành lập cho đến hôm nay. Chúng tôi đã, đang và mãi mãi ý thức như vậy.\n\nChúng tôi cam kết sẽ tạo điều kiện cho các ứng cử viên trúng tuyển được làm việc trong một môi trường chuyên nghiệp, thân thiện và cạnh tranh lành mạnh. Chúng tôi cam kết sẽ tạo ra những cơ hội để tất cả cán bộ nhân viên trong công ty có thể phát huy tốt nhất khả năng, chuyên môn, nhiệt huyết làm việc để cống hiến cho công ty, cho xã hội, và được hưởng các quyền lợi xứng đáng với công sức của mình. Chúng tôi cam kết đảm bảo thu nhập ổn định ở mức cao, đáp ứng đầy đủ các quyền lợi của người lao động được quy định tại luật lao động.., và hơn thế nữa.',1000,NULL,'Tầng 11, Tòa nhà CMC, 11 đường Duy Tân, quận Cầu Giấy, Hà Nội','https://cmctelecom.vn'),(4,NULL,NULL,NULL,NULL,NULL,'https://cdn.topcv.vn/55/company_logos/3b9ba543cd74b31f90a4b3826d7f7d19-5f3dffc4706b7.jpg',NULL,'TRUNG TÂM CNTT BẢO VIỆT','bao-viet','Tập đoàn Bảo Việt, với hơn 50 năm kinh nghiệm trong lĩnh vực kinh doanh bảo hiểm, đầu tư tài chính. Là doanh nghiệp tiên phong chuyển đổi mô hình hoạt động từ Tổng Công ty Nhà nước sang Tập đoàn cổ phần kinh doanh đa ngành (bảo hiểm phi nhân thọ, bảo hiểm nhân thọ, chứng khoán, đầu tư tài chính, quản lý quỹ, ngân hàng, bất động sản và các dịch vụ tài chính khác).\n\nChi nhánh Trung tâm CNTT là đơn vị hạch toán phụ thuộc trực thuộc Tập đoàn Bảo Việt, có trụ sở tại 71 Ngô Sỹ Liên, Đống Đa, Hà Nội. Với tổng số CBNV gần 150 người, hiện đang cung cấp dịch vụ CNTT phục vụ hoạt động kinh doanh của Tập đoàn, các Công ty con và định hướng cung cấp dịch vụ CNTT đến các đơn vị bên ngoài Bảo Việt.',499,NULL,'Số 71 Ngô Sĩ Liên, Văn Miếu, Đống Đa, Hà Nội','https://www.baoviet.com.vn'),(5,NULL,NULL,NULL,NULL,NULL,'https://cdn.topcv.vn/55/company_logos/cong-ty-co-phan-vien-thong-fpt-5d5f5980e317c.jpg',NULL,'Công ty Cổ phần viễn thông FPT','fpt-telecom','Là thành viên thuộc Tập đoàn công nghệ hàng đầu Việt Nam FPT, Công ty Cổ phần Viễn thông FPT (tên gọi tắt là FPT Telecom) hiện là một trong những nhà cung cấp dịch vụ viễn thông và Internet có uy tín và được khách hàng yêu mến tại Việt Nam và khu vực.\n\n\n\nThành lập ngày 31/01/1997, khởi nguồn từ Trung tâm Dịch vụ Trực tuyến do 4 thành viên sáng lập cùng sản phẩm mạng Intranet đầu tiên của Việt Nam mang tên “Trí tuệ Việt Nam – TTVN”, sản phẩm được coi là đặt nền móng cho sự phát triển của Internet tại Việt Nam. Sau 20 năm hoạt động, FPT Telecom đã lớn mạnh vượt bậc với hơn 7,000 nhân viên chính thức, gần 200 văn phòng điểm giao dịch thuộc hơn 80 chi nhánh tại 59 tỉnh thành trên toàn quốc. Bên cạnh đó, Công ty đã và đang đặt dấu ấn trên trường quốc tế bằng 8 chi nhánh trải dài khắp Campuchia, cũng như việc được cấp giấy phép kinh doanh dịch vụ tại Myanmar.\n\n\n\nVới sứ mệnh tiên phong đưa Internet đến với người dân Việt Nam và mong muốn mỗi gia đình Việt Nam đều sử dụng ít nhất một dịch vụ của FPT Telecom, đồng hành cùng phương châm “Khách hàng là trọng tâm”, chúng tôi không ngừng nỗ lực đầu tư hạ tầng, nâng cấp chất lượng sản phẩm – dịch vụ, tăng cường ứng dụng công nghệ mới để mang đến cho khách hàng những trải nghiệm sản phẩm dịch vụ vượt trội.',5000,NULL,'FPT Building, 17 Duy Tân Str., Cầu Giấy District, Hanoi,','https://www.fpt-software.com'),(6,'0','2022-09-17 16:56:43.767000',NULL,'0','2022-09-17 16:56:43.767000',NULL,NULL,'CÔNG TY TNHH THIẾT BỊ VÀ PHỤ KIỆN HUY HOÀNG','thiet-bi-va-phu-kien-huy-hoang','thiet-bi-va-phu-kien-huy-hoang',24,'Hà Nội: Ngõ 98, tổ 12, đường Lâm Tiên, Thị trấn Đông Anh, Huyện Đông Anh, Tp. Hà Nội, Đông Anh, Đông Anh','Hà Nội: Ngõ 98, tổ 12, đường Lâm Tiên, Thị trấn Đông Anh, Huyện Đông Anh, Tp. Hà Nội, Đông Anh, Đông Anh','https://www.topcv.vn/viec-lam/ky-su-dien-tu-dong-hoa-kinh-nghiem-tu-2-nam-tro-len/800179.html?ta_source=BoxFeatureJob'),(7,'0','2022-09-17 23:16:51.088000',NULL,'0','2022-09-17 23:16:51.088000',NULL,NULL,'CÔNG TY TNHH GIẢI PHÁP CÔNG NGHỆ APOLLO','giai-phap-cong-nghe-apollo','Công ty TNHH Giải pháp và Công Nghệ Apollo là công ty về Công nghệ với đội ngũ nhân sự trình độ cao, chuyên cung cấp các giải pháp tích hợp, phân tích dữ liệu, hỗ trợ các giải pháp chuyển đổi số.',99,'261 Nguyễn Văn Trỗi, Phường 10, Quận Phú Nhuận, Thành phố Hồ Chí Minh, Việt Namh','261 Nguyễn Văn Trỗi, Phường 10, Quận Phú Nhuận, Thành phố Hồ Chí Minh, Việt Nam','https://www.topcv.vn/cong-ty/cong-ty-tnhh-giai-phap-cong-nghe-apollo/60466.html'),(8,'0','2022-09-19 21:17:36.542000',NULL,'0','2022-09-19 21:17:36.542000',NULL,NULL,'CÔNG TY TNHH GIẢI PHÁP CÔNG NGHỆ TEST','giai-phap-cong-nghe-test','Công ty TNHH Giải pháp và Công Nghệ Test là công ty về Công nghệ với đội ngũ nhân sự trình độ cao, chuyên cung cấp các giải pháp tích hợp, phân tích dữ liệu, hỗ trợ các giải pháp chuyển đổi số.',99,'261 Lý Thái Tổ, Thành phố Bắc Ninh, Việt Nam','261 Lý Thái Tổ, Thành phố Bắc Ninh, Việt Nam','https://www.google.com'),(9,'0',NULL,NULL,'0',NULL,NULL,NULL,'CÔNG TY TNHH GIẢI PHÁP CÔNG NGHỆ A','giai-phap-cong-nghe-a','Công ty TNHH Giải pháp và Công Nghệ Test là công ty về Công giải pháp chuyển đổi số.',50,'100 Lý Thái Tổ, Thành phố Bắc Ninh, Việt Nam','100 Lý Thái Tổ, Thành phố Bắc Ninh, Việt Nam','https://www.google.com'),(10,'0',NULL,NULL,'0',NULL,NULL,NULL,'CÔNG TY TNHH GIẢI PHÁP CÔNG NGHỆ A','giai-phap-cong-nghe-a','Công ty TNHH Giải pháp và Công Nghệ Test là công ty về Công giải pháp chuyển đổi số.',50,'100 Lý Thái Tổ, Thành phố Bắc Ninh, Việt Nam','100 Lý Thái Tổ, Thành phố Bắc Ninh, Việt Nam','https://www.google.com');
/*!40000 ALTER TABLE `profile_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_user`
--

DROP TABLE IF EXISTS `profile_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `high_school` varchar(255) DEFAULT NULL,
  `register_book` varchar(255) DEFAULT NULL,
  `cccd` varchar(255) DEFAULT NULL,
  `hobbies` varchar(255) DEFAULT NULL,
  `native_land` varchar(255) DEFAULT NULL,
  `genitive` varchar(255) DEFAULT NULL,
  `culture_level` varchar(255) DEFAULT NULL,
  `wish` varchar(255) DEFAULT NULL,
  `career` varchar(255) DEFAULT NULL,
  `special_condition` varchar(255) DEFAULT NULL,
  `wage` varchar(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `current_job_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_current_job_id` (`current_job_id`),
  KEY `FK_profile_user_id` (`user_id`),
  CONSTRAINT `FK_current_job_id` FOREIGN KEY (`current_job_id`) REFERENCES `current_job` (`id`),
  CONSTRAINT `FK_profile_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_user`
--

LOCK TABLES `profile_user` WRITE;
/*!40000 ALTER TABLE `profile_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `role_key` varchar(50) DEFAULT NULL,
  `role_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,NULL,NULL,NULL,NULL,NULL,'ADMIN','Supper User'),(2,NULL,NULL,NULL,NULL,NULL,'CUSTOMER','Khách');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permission` (
  `role_id` bigint NOT NULL,
  `permission_id` bigint NOT NULL,
  KEY `FK_role_permission_id` (`role_id`),
  KEY `FK_permission_id` (`permission_id`),
  CONSTRAINT `FK_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`),
  CONSTRAINT `FK_role_permission_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permission`
--

LOCK TABLES `role_permission` WRITE;
/*!40000 ALTER TABLE `role_permission` DISABLE KEYS */;
INSERT INTO `role_permission` VALUES (1,1),(1,2),(1,3),(1,4);
/*!40000 ALTER TABLE `role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `token` text,
  `token_exp_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,'0','2022-09-13 22:08:58.610000',NULL,'0','2022-09-13 22:08:58.610000','eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NjM5NDU3MzgsInVzZXIiOnsibmF0aXZlTGFuZCI6bnVsbCwiYXJlYSI6bnVsbCwicmVnaXN0ZXJCb29rIjpudWxsLCJjYXJlZXIiOm51bGwsImN1bHR1cmVMZXZlbCI6bnVsbCwid2VpZ2h0IjpudWxsLCJleHBlcmllbmNlIjpudWxsLCJ1c2VySWQiOjIsImF1dGhvcml0aWVzIjpbXSwiY2NjZCI6bnVsbCwic3BlY2lhbENvbmRpdGlvbiI6bnVsbCwid2lzaCI6bnVsbCwicGFzc3dvcmQiOiIkMmEkMTAkeHhIZWJvMGg0LjdcL0REem5JYnpDZXVKOVBNaFJ2RlBXbnBZMW5UUGNmLkREWlNaYWJoS0ZxIiwicHJvdmluY2UiOm51bGwsImhvYmJpZXMiOm51bGwsImhpZ2hTY2hvb2wiOm51bGwsImdlbml0aXZlIjpudWxsLCJjdXJyZW50Sm9iSWQiOm51bGwsInVzZXJuYW1lIjoia2llbjIiLCJoZWlnaHQiOm51bGwsIndhZ2UiOm51bGx9fQ.i8de3UAaCTynm-mKMqXMExgu8BnCSbNwsEHZj2RpUVg','2022-09-23 22:08:58.603000'),(2,'0','2022-09-14 10:12:55.502000',NULL,'0','2022-09-14 10:12:55.502000','eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NjM5ODkxNzUsInVzZXIiOnsibmF0aXZlTGFuZCI6bnVsbCwiYXJlYSI6bnVsbCwicmVnaXN0ZXJCb29rIjpudWxsLCJjYXJlZXIiOm51bGwsImN1bHR1cmVMZXZlbCI6bnVsbCwid2VpZ2h0IjpudWxsLCJleHBlcmllbmNlIjpudWxsLCJ1c2VySWQiOjIsImF1dGhvcml0aWVzIjpbXSwiY2NjZCI6bnVsbCwic3BlY2lhbENvbmRpdGlvbiI6bnVsbCwid2lzaCI6bnVsbCwicGFzc3dvcmQiOiIkMmEkMTAkeHhIZWJvMGg0LjdcL0REem5JYnpDZXVKOVBNaFJ2RlBXbnBZMW5UUGNmLkREWlNaYWJoS0ZxIiwicHJvdmluY2UiOm51bGwsImhvYmJpZXMiOm51bGwsImhpZ2hTY2hvb2wiOm51bGwsImdlbml0aXZlIjpudWxsLCJjdXJyZW50Sm9iSWQiOm51bGwsInVzZXJuYW1lIjoia2llbjIiLCJoZWlnaHQiOm51bGwsIndhZ2UiOm51bGx9fQ.X2jSsAJksyDYFZEv45II8AhzkGdnul1mGcNZzyg_MPc','2022-09-24 10:12:55.313000'),(3,'0','2022-09-14 10:14:57.953000',NULL,'0','2022-09-14 10:14:57.953000','eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NjM5ODkyOTcsInVzZXIiOnsibmF0aXZlTGFuZCI6bnVsbCwiYXJlYSI6bnVsbCwicmVnaXN0ZXJCb29rIjpudWxsLCJjYXJlZXIiOm51bGwsImN1bHR1cmVMZXZlbCI6bnVsbCwid2VpZ2h0IjpudWxsLCJleHBlcmllbmNlIjpudWxsLCJ1c2VySWQiOjIsImF1dGhvcml0aWVzIjpbXSwiY2NjZCI6bnVsbCwic3BlY2lhbENvbmRpdGlvbiI6bnVsbCwid2lzaCI6bnVsbCwicGFzc3dvcmQiOiIkMmEkMTAkeHhIZWJvMGg0LjdcL0REem5JYnpDZXVKOVBNaFJ2RlBXbnBZMW5UUGNmLkREWlNaYWJoS0ZxIiwicHJvdmluY2UiOm51bGwsImhvYmJpZXMiOm51bGwsImhpZ2hTY2hvb2wiOm51bGwsImdlbml0aXZlIjpudWxsLCJjdXJyZW50Sm9iSWQiOm51bGwsInVzZXJuYW1lIjoia2llbjIiLCJoZWlnaHQiOm51bGwsIndhZ2UiOm51bGx9fQ.bxGtq-0sQwukHzs3vLoZn8F44eCMUMdp_C397-Br0rg','2022-09-24 10:14:57.953000'),(4,'0','2022-09-14 10:15:24.665000',NULL,'0','2022-09-14 10:15:24.665000','eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NjM5ODkzMjQsInVzZXIiOnsibmF0aXZlTGFuZCI6bnVsbCwiYXJlYSI6bnVsbCwicmVnaXN0ZXJCb29rIjpudWxsLCJjYXJlZXIiOm51bGwsImN1bHR1cmVMZXZlbCI6bnVsbCwid2VpZ2h0IjpudWxsLCJleHBlcmllbmNlIjpudWxsLCJ1c2VySWQiOjMsImF1dGhvcml0aWVzIjpbXSwiY2NjZCI6bnVsbCwic3BlY2lhbENvbmRpdGlvbiI6bnVsbCwid2lzaCI6bnVsbCwicGFzc3dvcmQiOiIkMmEkMTAkYmJTbDdlbG1yY1A2b1pzUFpcL1FveGVcL3dLcXBMdUgxbW16YWltODl3U2RWM295Y2xEVG1QaSIsInByb3ZpbmNlIjpudWxsLCJob2JiaWVzIjpudWxsLCJoaWdoU2Nob29sIjpudWxsLCJnZW5pdGl2ZSI6bnVsbCwiY3VycmVudEpvYklkIjpudWxsLCJ1c2VybmFtZSI6ImtpZW4zIiwiaGVpZ2h0IjpudWxsLCJ3YWdlIjpudWxsfX0.S4MOhE4farolzQSAZBi0pi1rt-q69UZapKXStCcCLlI','2022-09-24 10:15:24.665000'),(5,'0','2022-09-14 10:17:58.317000',NULL,'0','2022-09-14 10:17:58.317000','eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NjM5ODk0NzgsInVzZXIiOnsibmF0aXZlTGFuZCI6bnVsbCwiYXJlYSI6bnVsbCwicmVnaXN0ZXJCb29rIjpudWxsLCJjYXJlZXIiOm51bGwsImN1bHR1cmVMZXZlbCI6bnVsbCwid2VpZ2h0IjpudWxsLCJleHBlcmllbmNlIjpudWxsLCJ1c2VySWQiOjMsImF1dGhvcml0aWVzIjpbXSwidG9rZW4iOm51bGwsImNjY2QiOm51bGwsInNwZWNpYWxDb25kaXRpb24iOm51bGwsIndpc2giOm51bGwsInBhc3N3b3JkIjoiJDJhJDEwJGJiU2w3ZWxtcmNQNm9ac1BaXC9Rb3hlXC93S3FwTHVIMW1temFpbTg5d1NkVjNveWNsRFRtUGkiLCJwcm92aW5jZSI6bnVsbCwiaG9iYmllcyI6bnVsbCwiaGlnaFNjaG9vbCI6bnVsbCwiZ2VuaXRpdmUiOm51bGwsImN1cnJlbnRKb2JJZCI6bnVsbCwidXNlcm5hbWUiOiJraWVuMyIsImhlaWdodCI6bnVsbCwid2FnZSI6bnVsbH19.E89U9MccExdEz3Dsuc-5T2ag1cKsK4dVvQYVZMWc5iw','2022-09-24 10:17:58.236000'),(6,'0','2022-09-14 10:31:22.726000',NULL,'0','2022-09-14 10:31:22.726000','eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NjM5OTAyODIsInVzZXIiOnsibmF0aXZlTGFuZCI6bnVsbCwiYXJlYSI6bnVsbCwicmVnaXN0ZXJCb29rIjpudWxsLCJjYXJlZXIiOm51bGwsImN1bHR1cmVMZXZlbCI6bnVsbCwid2VpZ2h0IjpudWxsLCJleHBlcmllbmNlIjpudWxsLCJ1c2VySWQiOjMsImF1dGhvcml0aWVzIjpbXSwidG9rZW4iOm51bGwsImNjY2QiOm51bGwsInNwZWNpYWxDb25kaXRpb24iOm51bGwsIndpc2giOm51bGwsInBhc3N3b3JkIjoiJDJhJDEwJGJiU2w3ZWxtcmNQNm9ac1BaXC9Rb3hlXC93S3FwTHVIMW1temFpbTg5d1NkVjNveWNsRFRtUGkiLCJwcm92aW5jZSI6bnVsbCwiaG9iYmllcyI6bnVsbCwiaGlnaFNjaG9vbCI6bnVsbCwiZ2VuaXRpdmUiOm51bGwsImN1cnJlbnRKb2JJZCI6bnVsbCwidXNlcm5hbWUiOiJraWVuMyIsImhlaWdodCI6bnVsbCwid2FnZSI6bnVsbH19._vZOUgwqNBjI04sjsZRZMTDet9qIvzMqaAIZRMlx0EU','2022-09-24 10:31:22.566000'),(7,'0','2022-09-14 10:40:09.074000',NULL,'0','2022-09-14 10:40:09.074000','eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NjM5OTA4MDgsInVzZXIiOnsibmF0aXZlTGFuZCI6bnVsbCwiYXJlYSI6bnVsbCwicmVnaXN0ZXJCb29rIjpudWxsLCJjYXJlZXIiOm51bGwsImN1bHR1cmVMZXZlbCI6bnVsbCwid2VpZ2h0IjpudWxsLCJleHBlcmllbmNlIjpudWxsLCJ1c2VySWQiOjMsImF1dGhvcml0aWVzIjpbXSwidG9rZW4iOm51bGwsImNjY2QiOm51bGwsInNwZWNpYWxDb25kaXRpb24iOm51bGwsIndpc2giOm51bGwsInBhc3N3b3JkIjoiJDJhJDEwJGJiU2w3ZWxtcmNQNm9ac1BaXC9Rb3hlXC93S3FwTHVIMW1temFpbTg5d1NkVjNveWNsRFRtUGkiLCJwcm92aW5jZSI6bnVsbCwiaG9iYmllcyI6bnVsbCwiaGlnaFNjaG9vbCI6bnVsbCwiZ2VuaXRpdmUiOm51bGwsImN1cnJlbnRKb2JJZCI6bnVsbCwidXNlcm5hbWUiOiJraWVuMyIsImhlaWdodCI6bnVsbCwid2FnZSI6bnVsbH19.I4AJtZKqrJ7nDHONhJ4ueiMTPtGtWRX0UBRsgPJBW5g','2022-09-24 10:40:09.018000'),(8,'0','2022-09-17 23:37:11.068000',NULL,'0','2022-09-17 23:37:11.068000','eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2NjQyOTY2MzAsInVzZXIiOnsibmF0aXZlTGFuZCI6bnVsbCwiYXJlYSI6bnVsbCwicmVnaXN0ZXJCb29rIjpudWxsLCJjYXJlZXIiOm51bGwsImN1bHR1cmVMZXZlbCI6bnVsbCwid2VpZ2h0IjpudWxsLCJleHBlcmllbmNlIjpudWxsLCJ1c2VySWQiOjMsImF1dGhvcml0aWVzIjpbXSwidG9rZW4iOm51bGwsImNjY2QiOm51bGwsInNwZWNpYWxDb25kaXRpb24iOm51bGwsIndpc2giOm51bGwsInBhc3N3b3JkIjoiJDJhJDEwJGJiU2w3ZWxtcmNQNm9ac1BaXC9Rb3hlXC93S3FwTHVIMW1temFpbTg5d1NkVjNveWNsRFRtUGkiLCJwcm92aW5jZSI6bnVsbCwiaG9iYmllcyI6bnVsbCwiaGlnaFNjaG9vbCI6bnVsbCwiZ2VuaXRpdmUiOm51bGwsImN1cnJlbnRKb2JJZCI6bnVsbCwidXNlcm5hbWUiOiJraWVuMyIsImhlaWdodCI6bnVsbCwid2FnZSI6bnVsbH19.OTlOLFptvkG4NzutReH0amqdxmljJ9dQhlYRK4-HyOk','2022-09-27 23:37:10.990000');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `deleted_flag` bit(1) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `born` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,NULL,NULL,NULL,NULL,NULL,'kien@gmail.com','kien','$2a$10$VObHxmxycf0.QJNXlwqEc.mFZ.iYkS5V4zAJ0xdIMSoEYoW18O7cu',NULL,NULL,NULL),(2,'0','2022-09-13 22:08:06.055000',NULL,'0','2022-09-13 22:08:06.055000','kien2@gmail.com','kien2','$2a$10$xxHebo0h4.7/DDznIbzCeuJ9PMhRvFPWnpY1nTPcf.DDZSZabhKFq',NULL,NULL,NULL),(3,'0','2022-09-14 10:15:14.241000',NULL,'0','2022-09-14 10:15:14.241000','kien3@gmail.com','kien3','$2a$10$bbSl7elmrcP6oZsPZ/Qoxe/wKqpLuH1mmzaim89wSdV3oyclDTmPi',NULL,NULL,NULL),(4,'0','2022-09-17 23:37:27.790000',NULL,'0','2022-09-17 23:37:27.790000','kien4@gmail.com','kien4','$2a$10$/ziR.vSuNgs9I0.cYP059OkpNcF9cSudUVfBxD8kPd5MWs312XX3u',NULL,NULL,NULL),(5,'0','2022-09-18 11:30:03.023000',NULL,'0','2022-09-18 11:30:03.023000','kien5@gmail.com','kien5','$2a$10$BJ/ij41iiHs12SehphYIL.OLvQNwEnzl3Tc8lt2f5RP029mJDmbdu',NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  KEY `FK_user_id` (`user_id`),
  KEY `FK_role_id` (`role_id`),
  CONSTRAINT `FK_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FK_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-19 21:28:55

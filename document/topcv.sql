-- MySQL Script generated by MySQL Workbench
-- Wed Aug 31 23:43:56 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema top_cv
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema top_cv
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `top_cv` DEFAULT CHARACTER SET utf8 ;
USE `top_cv` ;

-- -----------------------------------------------------
-- Table `top_cv`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `top_cv`.`user` (
  `id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `created_by` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME(6) NULL DEFAULT NULL,
  `deleted_flag` BIT(1) NULL DEFAULT NULL,
  `updated_by` VARCHAR(255) NULL DEFAULT NULL,
  `updated_at` DATETIME(6) NULL DEFAULT NULL,
  `email` VARCHAR(255) NOT NULL,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `fullname` VARCHAR(255) NULL DEFAULT NULL,
  `sex` VARCHAR(20) NULL DEFAULT NULL,
  `born` DATETIME(6) NULL DEFAULT NULL);
  
  -- -----------------------------------------------------
-- Table `top_cv`.`token`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `top_cv`.`token` (
  `id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `created_by` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME(6) NULL DEFAULT NULL,
  `deleted_flag` BIT(1) NULL DEFAULT NULL,
  `updated_by` VARCHAR(255) NULL DEFAULT NULL,
  `updated_at` DATETIME(6) NULL DEFAULT NULL,
  `token` TEXT NULL DEFAULT NULL,
  `token_exp_date` DATETIME(6) NULL DEFAULT NULL);


-- -----------------------------------------------------
-- Table `top_cv`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `top_cv`.`role` (
  `id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `created_by` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME(6) NULL DEFAULT NULL,
  `deleted_flag` BIT(1) NULL DEFAULT NULL,
  `updated_by` VARCHAR(255) NULL DEFAULT NULL,
  `updated_at` DATETIME(6) NULL DEFAULT NULL,
  `role_key` VARCHAR(50) NULL DEFAULT NULL,
  `role_name` VARCHAR(50) NULL DEFAULT NULL);


-- -----------------------------------------------------
-- Table `top_cv`.`user_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `top_cv`.`user_role` (
  `user_id` BIGINT(20) NOT NULL,
  `role_id` BIGINT(20) NOT NULL,
  INDEX `FK_user_id` (`user_id` ASC) VISIBLE,
  INDEX `FK_role_id` (`role_id` ASC) VISIBLE,
  CONSTRAINT `FK_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `top_cv`.`user` (`id`),
  CONSTRAINT `FK_role_id`
    FOREIGN KEY (`role_id`)
    REFERENCES `top_cv`.`role` (`id`));


-- -----------------------------------------------------
-- Table `top_cv`.`permission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `top_cv`.`permission` (
  `id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `permission_key` VARCHAR(50) NOT NULL,
  `permission_name` VARCHAR(50) NOT NULL);


-- -----------------------------------------------------
-- Table `top_cv`.`role_permission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `top_cv`.`role_permission` (
  `role_id` BIGINT(20) NOT NULL,
  `permission_id` BIGINT(20) NOT NULL,
  INDEX `FK_role_permission_id` (`role_id` ASC) VISIBLE,
  INDEX `FK_permission_id` (`permission_id` ASC) VISIBLE,
  CONSTRAINT `FK_role_permission_id`
    FOREIGN KEY (`role_id`)
    REFERENCES `top_cv`.`role` (`id`),
  CONSTRAINT `FK_permission_id`
    FOREIGN KEY (`permission_id`)
    REFERENCES `top_cv`.`permission` (`id`));


-- -----------------------------------------------------
-- Table `top_cv`.`current_job`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `top_cv`.`current_job` (
  `id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `company_id` BIGINT(20) NOT NULL,
  `career_id` BIGINT(20) NOT NULL,
  INDEX `FK_company_id` (`company_id` ASC) VISIBLE,
  CONSTRAINT `FK_company_id`
    FOREIGN KEY (`company_id`)
    REFERENCES `top_cv`.`profile_company` (`id`)
);


-- -----------------------------------------------------
-- Table `top_cv`.`profile_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `top_cv`.`profile_user` (
  `id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `created_by` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME(6) NULL DEFAULT NULL,
  `deleted_flag` BIT(1) NULL DEFAULT NULL,
  `updated_by` VARCHAR(255) NULL DEFAULT NULL,
  `updated_at` DATETIME(6) NULL DEFAULT NULL,
  `user_id` BIGINT(20) NULL DEFAULT NULL,
  `height` VARCHAR(255) NULL DEFAULT NULL,
  `weight` VARCHAR(255) NULL DEFAULT NULL,
  `experience` VARCHAR(255) NULL DEFAULT NULL,
  `high_school` VARCHAR(255) NULL DEFAULT NULL,
  `register_book` VARCHAR(255) NULL DEFAULT NULL,
  `cccd` VARCHAR(255) NULL DEFAULT NULL,
  `hobbies` VARCHAR(255) NULL DEFAULT NULL,
  `native_land` VARCHAR(255) NULL DEFAULT NULL,
  `genitive` VARCHAR(255) NULL DEFAULT NULL,
  `culture_level` VARCHAR(255) NULL DEFAULT NULL,
  `wish` VARCHAR(255) NULL DEFAULT NULL,
  `career` VARCHAR(255) NULL DEFAULT NULL,
  `special_condition` VARCHAR(255) NULL DEFAULT NULL,
  `wage` VARCHAR(255) NULL DEFAULT NULL,
  `area` VARCHAR(255) NULL DEFAULT NULL,
  `province` VARCHAR(255) NULL DEFAULT NULL,
  `current_job_id` BIGINT(20) NULL DEFAULT NULL,
  INDEX `FK_current_job_id` (`current_job_id` ASC) VISIBLE,
  INDEX `FK_profile_user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `FK_current_job_id`
    FOREIGN KEY (`current_job_id`)
    REFERENCES `top_cv`.`current_job` (`id`),
  CONSTRAINT `FK_profile_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `top_cv`.`user` (`id`));

-- -----------------------------------------------------
-- Table `top_cv`.`profile_company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `top_cv`.`profile_company` (
  `id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `created_by` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME(6) NULL DEFAULT NULL,
  `deleted_flag` BIT(1) NULL DEFAULT NULL,
  `updated_by` VARCHAR(255) NULL DEFAULT NULL,
  `updated_at` DATETIME(6) NULL DEFAULT NULL,
  `avatar` VARCHAR(255) NULL DEFAULT NULL,
  `born` DATETIME(6) NULL DEFAULT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `name_asc` VARCHAR(255) NULL DEFAULT NULL,
  `introduction` TEXT NULL DEFAULT NULL,
  `staff_number` BIGINT(20) NULL DEFAULT NULL,
  `contact_info` VARCHAR(255) NULL DEFAULT NULL,
  `current_address` VARCHAR(255) NULL DEFAULT NULL,
  `website` VARCHAR(255) NULL DEFAULT NULL);


-- -----------------------------------------------------
-- Table `top_cv`.`candidates_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `top_cv`.`candidates_list` (
  `id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `user_id` BIGINT(20)  NOT NULL,
  `career_id` BIGINT(20) NOT NULL,
  INDEX `FK_candidates_list_user_id` (`user_id` ASC) VISIBLE,
  INDEX `FK_candidates_list_career_id` (`career_id` ASC) VISIBLE,
  CONSTRAINT `FK_candidates_list_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `top_cv`.`user` (`id`),
  CONSTRAINT `FK_candidates_list_career_id`
    FOREIGN KEY (`career_id`)
    REFERENCES `top_cv`.`career_list` (`id`)
);

CREATE TABLE IF NOT EXISTS `top_cv`.`job_list` (
  `id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `created_by` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME(6) NULL DEFAULT NULL,
  `deleted_flag` BIT(1) NULL DEFAULT NULL,
  `updated_by` VARCHAR(255) NULL DEFAULT NULL,
  `updated_at` DATETIME(6) NULL DEFAULT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `company_id` BIGINT(20) NOT NULL,
  `basic_salary` TEXT NULL DEFAULT NULL,
  `recruit_number` BIGINT(20) NULL DEFAULT NULL,
  `sex` VARCHAR(30) NULL DEFAULT NULL,
  `age` VARCHAR(30) NULL DEFAULT NULL,
  `english_ielts` FLOAT(8) NULL DEFAULT NULL,
  `experience` FLOAT(8) NULL DEFAULT NULL,
  `other_requirement` TEXT NULL DEFAULT NULL,
  `job_description` TEXT NULL DEFAULT NULL,
  `interests` TEXT NULL DEFAULT NULL,
  `submit_deadline` DATETIME(6) NULL DEFAULT NULL,
  `career_list_id` BIGINT(20) NULL DEFAULT NULL,
  INDEX `FK_job_company_id` (`company_id` ASC) VISIBLE,
  INDEX `FK_career_list_id` (`career_list_id` ASC) VISIBLE,
  CONSTRAINT `FK_job_company_id`
    FOREIGN KEY (`company_id`)
    REFERENCES `top_cv`.`profile_company` (`id`),
  CONSTRAINT `FK_career_list_id`
    FOREIGN KEY (`career_list_id`)
    REFERENCES `top_cv`.`career_list` (`id`)
);

CREATE TABLE IF NOT EXISTS `top_cv`.`career_list` (
  `id` BIGINT(20) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `created_by` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME(6) NULL DEFAULT NULL,
  `deleted_flag` BIT(1) NULL DEFAULT NULL,
  `updated_by` VARCHAR(255) NULL DEFAULT NULL,
  `updated_at` DATETIME(6) NULL DEFAULT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL
);

INSERT INTO `top_cv`.`permission` (`permission_key`, `permission_name`) VALUES
 ('USER_CREATE', 'tạo user'), ('USER_READ','xem user'), ('USER_UPDATE', 'sửa user'), ('USER_DELETE', 'xóa user');
INSERT INTO `top_cv`.`role` (`role_key`, `role_name`) VALUES
 ('ADMIN', 'Supper User'), ('CUSTOMER', 'Khách');
INSERT INTO `top_cv`.`user` (`username`, `password`, `email`) VALUES
 ('kien', '$2a$10$VObHxmxycf0.QJNXlwqEc.mFZ.iYkS5V4zAJ0xdIMSoEYoW18O7cu', 'kien@gmail.com');
INSERT INTO `top_cv`.`role_permission` (`role_id`, `permission_id`) VALUES
 (1, 1), (1, 2), (1, 3), (1, 4);
INSERT INTO `top_cv`.`user_role` (`user_id`, `role_id`) VALUES
 (1, 1);

INSERT INTO `top_cv`.`career_list` (`name`) VALUES
 ('IT - Phần mềm'),
 ('Bảo hiểm'),
 ('Bất động sản'),
 ('Chứng khoán'),
 ('Cơ khí'),
 ('Du lịch');

INSERT INTO `top_cv`.`profile_company` (`avatar`, `name`, `name_asc`, `introduction`, `staff_number`, `contact_info`, `current_address`, `website`) VALUES
 ('https://cdn.topcv.vn/80/company_logos/fpt-software-6073b38a10cb4.jpg', 'FPT Software', 'fpt-software', 'FPT Software là công ty thành viên thuộc Tập đoàn FPT. Được thành lập từ năm 1999, FPT Software hiện là công ty chuyên cung cấp các dịch vụ và giải pháp phần mềm cho các khách hàng quốc tế, với hơn 20.000 nhân viên, hiện diện tại 27 quốc gia trên toàn cầu. Nhiều năm liền, FPT Software được bình chọn là Nhà Tuyển dụng được yêu thích nhất và nằm trong TOP các công ty có môi trường làm việc tốt nhất châu Á.', 15000, NULL, 'FPT Building, 17 Duy Tân Str., Cầu Giấy District, Hanoi,', 'https://www.fpt-software.com'),
 ('https://cdn.topcv.vn/140/company_logos/cong-ty-tnhh-cmc-global-1d94bf2be044cc832cd72d2f4f8fad66-5e72d0edadcfb.jpg', 'Công ty TNHH CMC GLOBAL', 'cmc-global', 'CMC Global ra đời từ kinh nghiệm 25 năm trong lĩnh vực ICT và hơn 10 năm kinh nghiệm trong lĩnh vực Outsourcing của Tập đoàn công nghệ CMC, với sứ mệnh trở thành đơn vị cung cấp nhân lực kỹ sư phần mềm chất lượng cao, cung cấp các giải pháp, dịch vụ CNTT cho thị trường quốc tế. Hiện CMC Global đang sở hữu đến 700++ nhân viên, cùng một công ty thành viên tại Nhật Bản.

Tập đoàn công nghệ CMC cùng CMC Global tự hào là một trong những doanh nghiệp hàng đầu Việt Nam trong lĩnh vực phát triển, cung cấp các giải pháp và dịch vụ phần mềm. Chia sẻ chung những tiêu chí tiên quyết cho sự phát triển của Tập đoàn CMC: Sáng tạo, Chuyên nghiệp, Đồng đội, CMC Global luôn nỗ lực không ngừng để xây dựng một tập thể vững mạnh, tiên phong trong nền công nghệ Việt Nam và ngày một vươn xa ra thế giới.

Với mục tiêu đưa các sản phẩm và dịch vụ công nghệ cao của CMC ra thế giới, CMC Global đang xây dựng những nền móng đầu tiên với tham vọng: có ít nhất 2.000 người làm việc ở nước ngoài vào năm 2022; doanh thu phần mềm và dịch vụ từ thị trường xuất khẩu lớn hơn thị trường trong nước; có nhiều sản phẩm và dịch vụ đạt tiêu chuẩn hàng đầu thế giới. Trong tương lai, ngoài công ty thành viên CMC Japan tại Nhật Bản, CMC Global sẽ mở thêm các chi nhánh tại các nước châu Á như Singapore, Malaysia,….

Chiến lược đầu tư của CMC Global được định vị có phần khác biệt so với các công ty outsourcing cũng ngành ở thị trường Việt Nam. CMC Global sẽ chú trọng vào việc phát triển nguồn lực, chuẩn hóa qui trình cung cấp dịch vụ và phát triển phần mềm, đào tạo nhân sự chất lượng cao, cùng lúc thu hút số lượng lớn các nhân tài trong lĩnh vực công nghệ thông tin. Đồng thời, CMC Global cũng sẽ là đại diện, cầu nối cho các công ty thành viên của CMC trong việc cung cấp các giải pháp và dịch vụ tích hợp trọn gói ra thế giới.', 1000, NULL, 'Tầng 8-9, Tòa CMC, Duy Tân, Cầu Giấy, Hà Nội', 'http://cmcglobal.com.vn'),
 ('https://cdn.topcv.vn/140/company_logos/cong-ty-co-phan-ha-tang-vien-thong-cmc-telecom-5af4f4a61b6e4_rs.jpg', 'CÔNG TY CỔ PHẦN HẠ TẦNG VIỄN THÔNG CMC TELECOM', 'cmc-telecom', 'CMC Telecom là một trong 8 công ty thành viên của Tập đoàn Công nghệ CMC. Với gần 9 năm xây dựng, phát triển, CMC Telecom là công ty hạ tầng viễn thông nằm trong TOP 4 các công ty viễn thông hàng đầu Việt Nam. CMC Telecom là nhà cung cấp đầu tiên áp dụng công nghệ GPON và sở hữu hạ tầng truyền dẫn 100% cáp quang.

CMC Telecom được biết tới là nhà cung cấp dịch vụ toàn diện với các sản phẩm truyền số liệu chuyên biệt cho doanh nghiệp như Internet Leased Line, dịch vụ Wan nội hạt; liên tỉnh; quốc tế, Internet cáp quang cho doanh nghiệp và đặc biệt là sản phẩm Internet trên mạng Truyền hình cáp Việt Nam (VTVnet) cho gia đình. Không chỉ cung cấp những dịch vụ viễn thông cơ bản, CMC Telecom còn cung cấp cả các dịch vụ gia tăng cho khối khách hàng doanh nghiệp như Video Conference, Bảo mật Hệ thống và dịch vụ Managed Service…

Hai (02) Data Center trung lập tiêu chuẩn Tier3 của CMC Telecom tại Hà Nội và TP Hồ Chí Minh (thuộc Liên minh Dữ liệu Á Châu ADCA) đã nhận được chứng nhận về bảo mật, an toàn thông tin theo tiêu chuẩn quốc tế IEC/ISO 27001.

* VÌ SAO BẠN LẠI LỰA CHỌN CMC Telecom LÀ NƠI PHÁT TRIỂN SỰ NGHIỆP:

Ngay từ những ngày đầu thành lập, chúng tôi luôn mong muốn tập hợp được đội ngũ nhân sự có trình độ chuyên môn cao, có tư cách đạo đức tốt để cùng hợp tác, phát triển và chung tay xây dựng công ty ngày càng lớn mạnh và phát triển không ngừng.

Đối với chúng tôi, nhân lực là tài sản quý giá nhất. Sự thành công của CMC Telecom ngày hôm nay có được là nhờ sự đóng góp to lớn của những thế hệ đã và đang làm việc từ khi mới thành lập cho đến hôm nay. Chúng tôi đã, đang và mãi mãi ý thức như vậy.

Chúng tôi cam kết sẽ tạo điều kiện cho các ứng cử viên trúng tuyển được làm việc trong một môi trường chuyên nghiệp, thân thiện và cạnh tranh lành mạnh. Chúng tôi cam kết sẽ tạo ra những cơ hội để tất cả cán bộ nhân viên trong công ty có thể phát huy tốt nhất khả năng, chuyên môn, nhiệt huyết làm việc để cống hiến cho công ty, cho xã hội, và được hưởng các quyền lợi xứng đáng với công sức của mình. Chúng tôi cam kết đảm bảo thu nhập ổn định ở mức cao, đáp ứng đầy đủ các quyền lợi của người lao động được quy định tại luật lao động.., và hơn thế nữa.', 1000, NULL, 'Tầng 11, Tòa nhà CMC, 11 đường Duy Tân, quận Cầu Giấy, Hà Nội', 'https://cmctelecom.vn'),
 ('https://cdn.topcv.vn/55/company_logos/3b9ba543cd74b31f90a4b3826d7f7d19-5f3dffc4706b7.jpg', 'TRUNG TÂM CNTT BẢO VIỆT', 'bao-viet', 'Tập đoàn Bảo Việt, với hơn 50 năm kinh nghiệm trong lĩnh vực kinh doanh bảo hiểm, đầu tư tài chính. Là doanh nghiệp tiên phong chuyển đổi mô hình hoạt động từ Tổng Công ty Nhà nước sang Tập đoàn cổ phần kinh doanh đa ngành (bảo hiểm phi nhân thọ, bảo hiểm nhân thọ, chứng khoán, đầu tư tài chính, quản lý quỹ, ngân hàng, bất động sản và các dịch vụ tài chính khác).

Chi nhánh Trung tâm CNTT là đơn vị hạch toán phụ thuộc trực thuộc Tập đoàn Bảo Việt, có trụ sở tại 71 Ngô Sỹ Liên, Đống Đa, Hà Nội. Với tổng số CBNV gần 150 người, hiện đang cung cấp dịch vụ CNTT phục vụ hoạt động kinh doanh của Tập đoàn, các Công ty con và định hướng cung cấp dịch vụ CNTT đến các đơn vị bên ngoài Bảo Việt.', 499, NULL, 'Số 71 Ngô Sĩ Liên, Văn Miếu, Đống Đa, Hà Nội', 'https://www.baoviet.com.vn'),
 ('https://cdn.topcv.vn/55/company_logos/cong-ty-co-phan-vien-thong-fpt-5d5f5980e317c.jpg', 'Công ty Cổ phần viễn thông FPT', 'fpt-telecom', 'Là thành viên thuộc Tập đoàn công nghệ hàng đầu Việt Nam FPT, Công ty Cổ phần Viễn thông FPT (tên gọi tắt là FPT Telecom) hiện là một trong những nhà cung cấp dịch vụ viễn thông và Internet có uy tín và được khách hàng yêu mến tại Việt Nam và khu vực.



Thành lập ngày 31/01/1997, khởi nguồn từ Trung tâm Dịch vụ Trực tuyến do 4 thành viên sáng lập cùng sản phẩm mạng Intranet đầu tiên của Việt Nam mang tên “Trí tuệ Việt Nam – TTVN”, sản phẩm được coi là đặt nền móng cho sự phát triển của Internet tại Việt Nam. Sau 20 năm hoạt động, FPT Telecom đã lớn mạnh vượt bậc với hơn 7,000 nhân viên chính thức, gần 200 văn phòng điểm giao dịch thuộc hơn 80 chi nhánh tại 59 tỉnh thành trên toàn quốc. Bên cạnh đó, Công ty đã và đang đặt dấu ấn trên trường quốc tế bằng 8 chi nhánh trải dài khắp Campuchia, cũng như việc được cấp giấy phép kinh doanh dịch vụ tại Myanmar.



Với sứ mệnh tiên phong đưa Internet đến với người dân Việt Nam và mong muốn mỗi gia đình Việt Nam đều sử dụng ít nhất một dịch vụ của FPT Telecom, đồng hành cùng phương châm “Khách hàng là trọng tâm”, chúng tôi không ngừng nỗ lực đầu tư hạ tầng, nâng cấp chất lượng sản phẩm – dịch vụ, tăng cường ứng dụng công nghệ mới để mang đến cho khách hàng những trải nghiệm sản phẩm dịch vụ vượt trội.', 5000, NULL, 'FPT Building, 17 Duy Tân Str., Cầu Giấy District, Hanoi,', 'https://www.fpt-software.com');
INSERT INTO `top_cv`.`job_list` (`career_list_id`, `name`, `company_id`, `basic_salary`, `recruit_number`, `sex`, `age`, `english_ielts`, `experience`, `other_requirement`, `job_description`, `interests`,`submit_deadline`) VALUES
 (0 ,'Junior Developer – Freshly Graduate With English Proficiency', 0, 0, 50, 'no', 'no', 6.5, 1, 'Responsibilities/ Daily tasks you will take care:

• Make research and discuss topics using Technology documents.

• Prosecute tasks and presented before class.

• Participated in projects stimulated actual programs, analyse requiements, design, code and test.

Basic Qualification:

• Bachelor Degree in Technology.

• English proficiency', '• We are looking for Junior Developer of any skills

• Freshly Graduate with Technology background around Hanoi for a 2 months training program

• Salary and transportation included.', '• Salary package minimum of 9,000,000 VND

• Transportation provided

• Lunch allowance', NULL),
(0 ,'Kỹ Sư Cầu Nối Thị Trường Nhật Bản (Brse)', 0, 0, 100, 'no', 'no', 6.5, 2, '• Có từ 02 năm kinh nghiệm làm việc ở vị trí BA/BrSE hoặc vị trí tương đương;
• Có kỹ năng: làm việc nhóm, phân tích, thiết kế, giao tiếp và thuyết trình bằng tiếng Nhật;
• Chủ động, có năng lực tự học và thái độ tích cực trong công việc;
• Thành thạo các công cụ UML, Design và Modelling;
• Có kinh nghiệm với các dự án ERP, Dynamic 365, SAP là 1 lợi thế;
• Có kinh nghiệm tạo các tài liệu high-level design: RD, BD, DD
• Tiếng Nhật: giao tiếp lưu loát, có chứng chỉ N2 trở lên', '• Cầu nối giữa công ty con tại Việt Nam và công ty mẹ ở Nhật Bản;
• Trở thành một thành viên trong đội ngũ phát triển ứng dụng web của công ty;
• Chịu trách nhiệm trong việc phát triển và bảo trì các sản phẩm;
• Chiu trách nhiệm tiếp nhận yêu cầu từ công ty mẹ, phân tích và truyền đạt yêu cầu cho team Developer ở Việt Nam;
• Hỗ trợ các bạn Developer phát triển các chức năng, kiểm tra các chức năng đã hoạt động đúng với yêu cầu của khách hàng;
• Tham gia đóng góp ý tưởng và cải tiến chất lượng của sản phẩm.', '• Middle level: Lương up to $2,000 Gross/ Package tối thiểu 350M Gross VNĐ/ năm;
• Senior level: Lương up to $3,000 Gross/ Package tối thiểu 500M Gross VNĐ/ năm;
• Signing Bonus: 15M – 25M – 35M (tùy thuộc vào level được đánh giá);
• Môi trường làm việc sử dụng tiếng Nhật 100%, toàn bộ các member trong dự án đều sử dụng tiếng Nhật trong quá trình phát triển dự án;
• Tài liệu 100% tiếng Nhật, có sự hỗ trợ từ PM, Team Lead và các BrSE dày dặn kinh nghiệm để bạn có thể nâng cao kỹ năng làm dự án full-Japanese-document trong thời gian ngắn nhất;
• Tham gia làm BrSE Long term ngồi tại offshore, được tham gia vào các công đoạn đầu tiên của dự án (RD,BD..);
• Thường xuyên đi onsite ngắn hạn để phân tích requirement (3 tháng sẽ có 1 lần onsite sang Nhật Bản);
• Có cơ hội nâng cao kỹ năng quản lý và kỹ năng BrSE, kĩ năng đàm phán với khách hàng cũng như đối tác của khách hàng;
• Được training về bussiness, các hệ thống khách hàng đang sử dụng;
• Nhận ưu đãi học phí 20% khi cho con tham gia các trường thuộc hệ thống FPT Education (cấp 1 đến cấp 3)
• Được cấp 01 tài khoản Udemy for Business (UFB)

Chính sách đặc biệt dành cho Senior level:
• Gói chuyển vùng: Up to 100M (Dành cho Senior chuyển từ HN/HCM về Đà Nẵng); Hoặc
• 01 suất mua căn hộ FPT Plaza2 tại Đà Nẵng với giá ưu đãi (20M/m2); Hoặc
• Gói hỗ trợ vay vốn: 04% lãi suất (package 01-02 tỷ).

• Working location: Đà Nẵng/ Onsite Nhật Bản',NULL),
(0 ,'name', 0, 0, 100, 'male', 'no', 2.5, 2, '• Nắm vững nguyên lý và mô hình lập trình MVC (Model – View – Controller);
• Biết dùng HTML/CSS (HTML5, CSS3), Less or Sass, Javascript (JQuery, HighCharts, …);
• Thành thạo sử dụng JSP (thư viện JSTL). t HTML/CSS/Javascript;

Đối với tầng Controller:
• Sử dụng thành thạo Java Core, nắm được điểm khác biệt của nền tảng J2SE/ J2ME/J2EE;
• Đã làm việc với ít nhất một trong các framework như Spring MVC, JSF, Struts hoặc các framework tương tự;
• Đã từng sử dụng các tool để thiết kế cơ sở dữ liệu của hệ thống quản trị thông tin;
• Sử dụng thành thạo với một trong các hệ quản trị cơ sở dữ liệu: MySQL, PostgreSQL, … và công nghệ ORM (JPA2, Hibernate);
• Đã từng làm việc với các hệ quản trị dữ liệu NoSQL như: Cassandra, MongoDB, HBase, Redis, … là một lợi thế;
• Biết sử dụng các công cụ như: Git, Maven, công cụ quản lý lỗi và một trong các công cụ lập trình Netbeans, Eclipse, IntelliJ;
• Tiếng Nhật: giao tiếp tốt (N3 trở lên).', '• Tham gia đầy đủ vào các khâu trong quá trình phát triển sản phẩm: Phân tích, thiết kế, phát triển, tích hợp và đóng gói sản phẩm, ….;
• Nghiên cứu/ đánh giá/ lựa chọn công nghệ cho mảng lĩnh vực mình phụ trách, đáp ứng yêu cầu đặt ra cho sản phẩm;
• Tham gia thiết kế triến trúc hệ thống, thiết kế cơ sở dữ liệu, thiết kế mã nguồn (Interface), Design Pattern cùng các thành viên trong dự án;
• Lập trình, phát triển các sản phẩm có hiệu năng cao, đáp ứng cho tập người dùng lớn.', '• Middle level: Lương up to $2,000 Gross/ Package tối thiểu 350M Gross VNĐ/ năm;
• Senior level: Lương up to $3,000 Gross/ Package tối thiểu 500M Gross VNĐ/ năm;
• Signing Bonus: 15M – 25M – 35M (tùy thuộc vào level được đánh giá);
• Môi trường làm việc sử dụng tiếng Nhật 100%, toàn bộ các member trong dự án đều sử dụng tiếng Nhật trong quá trình phát triển dự án;
• Tài liệu 100% tiếng Nhật, có sự hỗ trợ từ PM, Team Lead và các BrSE dày dặn kinh nghiệm để bạn có thể nâng cao kỹ năng làm dự án full-Japanese-document trong thời gian ngắn nhất;
• Tham gia làm BrSE Long term ngồi tại offshore, được tham gia vào các công đoạn đầu tiên của dự án (RD,BD..);
• Thường xuyên đi onsite ngắn hạn để phân tích requirement (3 tháng sẽ có 1 lần onsite sang Nhật Bản);
• Có cơ hội nâng cao kỹ năng quản lý và kỹ năng BrSE, kĩ năng đàm phán với khách hàng cũng như đối tác của khách hàng;
• Được training về bussiness, các hệ thống khách hàng đang sử dụng;
• Nhận ưu đãi học phí 20% khi cho con tham gia các trường thuộc hệ thống FPT Education (cấp 1 đến cấp 3)
• Được cấp 01 tài khoản Udemy for Business (UFB)',NULL),
(0 ,'Brse Tiếng Nhật - Signing Bonus Up To 35M', 0, 0, 100, 'male', '18 - 24', 1.5, 2, '• Có trình độ tiếng Nhật N2 trở lên (bắt buộc).
• Có kinh nghiệm làm leader và quản lý nhóm (từng làm PM 2-3 năm)
• Có kinh nghiệm làm việc với khách hàng Nhật
• Chủ động, có khả năng thương lượng với khách hàng, partner nội bộ cũng như bên thứ 3.
• Có hiểu biết 1 trong những ngôn ngữ phát triển phần mềm : .NET, JAVA, COBOL', '• Tham gia xây dựng / kiến tạo dự án với vai trò PM/BRSE
• Short-Onsite nếu cần để clear requirement, assessment dự án, thảo luận và final process/ template trong dự án với khách hàng
• Report/báo cáo tiến độ, chất lượng dự án.
• Control/tracking/giải quyết issue dự án , chịu trách nhiệm dự án.
• Tham gia pre-sale, estimate effort/budget dự án và đề xuất với khách hàng.
• Có kinh nghiệm tạo tài liệu design (basic design/Detail design)
• Có kinh nghiệm các công đoạn từ coding - testing sản phẩm.
• Có kỹ năng kinh nghiệm về process đảm bảo chất lượng sản phẩm.', '• Thu nhập: 500,000,000-800,000,000 VNĐ/Year
• Cơ hội điều hành các dự án lớn của khách hàng. Va chạm và học hỏi nhiều về hệ thống lớn, cách quản lý team size lớn.
• Lộ trình thăng tiến rõ ràng, rất nhiều vị trí và cơ hội thăng tiến.
• Được tham gia các hoạt động lễ tết, team building, nghỉ mát',NULL),
(0 ,'Lập Trình Viên Front-End_Front-End Developer', 0, 0, 100, 'female', '19 - 23', 4.5, 2, '- Có tinh thần trách nhiệm cao, định hướng làm team leader

- Thành thạo Javascript, Typescript, HTML5/CSS3, framework Vue.js

- Có kinh nghiệm sử dụng Git

- Có 3 năm kinh nghiệm ', '- Phát triển team Front End

- Phát triển ứng dụng web phía front-end, sử dụng framework Vue.js

- Cắt HTML, CSS: chuyển file thiết kết Photoshop thành template HTML, CSS, Javascript

- Thực hiện các công việc khác phát sinh ', '- Thu nhập từ 500$-1500$ (hoặc thỏa thuận theo năng lực của ứng viên)

- Thưởng tháng 13, review lương 2 lần một năm

- Hỗ trợ ăn trưa, hỗ trợ phí đi lại

- Trợ cấp thi chứng chỉ kỹ thuật, năng lực tiếng nhật, các seminar ngoài công ty

- Tham gia bảo hiểm theo quy định của nhà nước

- Khám sức khoẻ định kỳ 1 năm 1 lần

- Nghỉ phép: theo quy định của nhà nước',NULL),
(0 ,'Business Analyst', 1, 0, 100, 'male', '25 - 30', 5, 2, '• Trình độ:  Tốt nghiệp, Cao Đẳng, Đại học (chuyển ngành CNTT, Kinh tế, Khoa học máy tính hoặc các chuyên ngành liên quan) 
• Kinh nghiệm:  Từ 1 năm kinh nghiệm tại vị trí tương đương
• Tin học: Sử dụng tốt các công công cụ BA, Test. 
• Yêu cầu khác: Có hiểu biết về quy trình, nghiệp vụ một trong các lĩnh vực: Quản trị dự án, Quản lý quy trình, Quản lý công văn, Chữ ký điện tử.
• Kỹ năng:  
- Kỹ năng giao tiếp, truyền đạt tốt
- Kỹ năng làm việc nhóm và làm việc độc lập
- Kỹ năng tổ chức và quản lý thời gian
- Kỹ năng làm việc dưới áp lực
• Thái độ:  Chăm chỉ, nhiệt tình, hòa đồng và có trách nhiệm trong công việc.', '- Phân tích các yêu cầu kinh doanh / kỹ thuật bao gồm các yêu cầu chức năng và phi chức năng đối với các thành phần của dự án và các tài liệu liên quan khác bao gồm use cases/user stories.
- Làm việc với các nhà cung cấp giải pháp bên trong và bên ngoài để xác định và đánh giá các lựa chọn giải pháp đáp ứng các yêu của người dùng và các mục tiêu tiến độ của dự án
- Chịu trách nhiệm đánh giá các quy trình kinh doanh, xác định các yêu cầu kinh doanh và đề xuất các giải pháp tích hợp.
- Cung cấp hỗ trợ cho Người dùng cuối; đáp ứng các yêu cầu, bao gồm nghiên cứu và khắc phục sự cố, đề xuất các giải pháp để đáp ứng nhu cầu kinh doanh.
- Hỗ trợ các dự án và phát triển chức năng, cải tiến và triển khai hệ thống trong khi vẫn đảm bảo tài liệu về tất cả các yêu cầu nghiệp vụ, quy trình và thủ tục công việc.
- Thực hiện các nhiệm vụ khác theo sự phân công.', '- Lương thỏa thuận theo kinh nghiệm và năng lực
- Có lương tháng thứ 13, thưởng lễ tết, thưởng hiệu quả kinh doanh theo quy định và theo kết quả kinh doanh của Công ty.
- Được tham gia đào tạo nghiệp vụ trong và ngoài nước theo yêu cầu công việc.
- Tham gia các khóa đào tạo kỹ năng mềm phục vụ cho công việc
- Được làm việc trong một môi trường công việc thực tế, năng động cùng với các chuyên gia hàng đầu trong nhiều lĩnh vực của công ty.
- Xét tăng lương hàng năm.
- Chế độ bảo hiểm xã hội đầy đủ theo quy định của Luật.
- Gói bảo hiểm chăm sóc sức khỏe toàn diện cho CBNV
- Du lịch, team building 2-3 lần / năm.
- Tủ sách miễn phí.
- Nhiều chính sách đãi ngộ hấp dẫn khác.',NULL),
(0 ,'Lập Trình Viên Backend/ Backend Developer', 1, 0, 100, 'female', 'no', 6, 2, 'other_requirement', 'job_description', 'interests',NULL),
(0 ,'name', 1, 0, 100, 'no', '18-22', 5, 2, 'Tốt nghiệp ĐH/CĐ chuyên ngành CNTT hoặc các chuyên ngành liên quan
Thành thạo các kiến thức về .NET Framework hoặc .NET Core (C#, ASP.NET, MVC, ...) Có kinh nghiệm xây dựng các hệ thống sử dụng .NET là lợi thế
Ưu tiên ứng viện có kinh nghiệm làm việc với Web API
Có kinh nghiệm với 1 trong các cơ sở dữ liệu SQL Server, MySQL, PostgreSQL. Đã từng làm sản phẩm sử dụng NoSQL: MongoDB, CouchBase, Redis, RabbitMQ, … là lợi thế
Có kiến thức về OOP, Design Pattern, nguyên lý SOLID, SOA/Micro Service
Ưu tiên ứng viên thích làm product, tư duy làm sản phẩm cao, sản phẩm hướng người dùng cuối.
Giao tiếp tốt, chủ động, khả năng làm việc nhóm tốt', 'Tham gia phát triển các sản phẩm phục vụ cho hàng trăm nghìn khách hàng về các mảng Tài chính kế toán, Điều hành doanh nghiệp, Quản lý bán hàng cũng như eLearning
Xây dựng và tối ưu sản phẩm đáp ứng hàng trăm nghìn người sử dụng đồng thời
Tham gia nghiên cứu và ứng dụng các công nghệ mới vào sản phẩm: Blockchain, AI, Machine Learning, BigData, RPA, …
Phối hợp cùng đội ngũ BA phân tích, thiết kế, đưa ra giải pháp để phát triển phần mềm đáp ứng đúng, đủ, tiện các yêu cầu của người dùng cuối', 'Lương cạnh tranh có thể lên tới 40tr/tháng (Phụ thuộc vào năng lực và kinh nghiệm của bạn, chúng tôi không bao giờ đãi ngộ thấp hơn khả năng của bạn)
Xem xét điều chỉnh lương cứng 2 lần/năm
Thưởng cuối năm theo năng suất làm việc từ 2 tháng lương
Ăn trưa miễn phí tại công ty
Thời gian làm việc: 8h - 17h30 (thứ 2- thứ 6)
Quà tặng sinh nhật, chế độ ốm đau, thai sản, nghỉ mát, teambuilding, khám sức khỏe đầy đủ
Có các CLB Văn hóa, Thể thao và nhiều chương trình văn thể mỹ sinh hoạt thường xuyên
Không gian làm việc hiện đại, thoáng đãng, nhiều tiện ích giải trí: quầy bar, sân golf mini, khu leo núi…
Khuôn viên xung quanh văn phòng thoáng mát, thuận tiện giao thông',NULL),
(0 ,'Java Developer', 2, 0, 100, 'female', 'no', 2, 2, '• Có chuyên môn về phát triển phần mềm bằng Java và Spring, Microservices, Rest API

• Có kinh nghiệm sử dụng các framework Spring, Angular, ReactJS, Hibernate

• Có thể sử dụng một trong các hệ quản trị cơ sở dữ liệu Mysql, Oracle, Sql server và cơ sở dữ liệu NoSQL

• Hiểu biết về webservice SOAP/Restful, chuẩn message JSON, XML, OOP, Design pattern ...

• Hiểu biết thành thạo về các công cụ hỗ trợ phát triển như Git, Jira

• Có tư duy logic và kỹ năng giải quyết vấn đề

• Là sinh viên đã/sắp tốt nghiệp chuyên ngành Công nghệ thông tin, Toán tin, Khoa học máy tính, Kỹ thuật phần mềm, Ứng dụng di động, Điện tử viễn thông... hoặc các chuyên ngành có liên quan.', '• Nghiên cứu phát triển nền tảng, ứng dụng và hệ sinh thái IoT: IoT Platform, M2M & eSIM Platform, Smart Home ecosystem

• Nghiên cứu phát triển các phần mềm và nền tảng Chuyển đổi số Doanh nghiệp

• Nghiên cứu phát triển nền tảng và hệ thống lõi viễn thông hiệu năng cao', '• Xét lương 2 lần/năm, 16 tháng lương/1 năm

• Thưởng hấp dẫn, được tham gia đóng BHXN BHYT

• Tiếp cận CN mới nhất IoT, 5G, Cloud, Big Data

• Môi trường trẻ trung, chuyên nghiệp, ăn trưa free',NULL),
(0 ,'Junior/Senior Frontend Developer', 3, 0, 100, 'no', '25-30', 1, 2, '- Kinh nghiệm về lập trình web ít nhất 1 năm.

- Có từ 1 năm kinh nghiệm phát triển dự án Vue.js.

- Có kinh nghiệm làm việc với NuxtJS là một lợi thế.

- Có khả năng làm việc tốt với CSS, SCSS, JavaScript.

- Có kinh nghiệm làm việc với Tailwind CSS là một lợi thế.', '- Tham gia phát triển ứng dụng web trên nền tảng Vue.js (NuxtJS).

- Tối ưu một số tính năng sẵn có của các hệ thống hiện tại.

- Nghiên cứu các công nghệ mới để cải thiện tính năng và phát triển các tính năng mới.', '- Lương thoả thuận, có thể lên đến 25 triệu.

- Review lương theo năng lực và hiệu quả 2 lần 1 năm

- Lương tháng 13

- Hỗ trợ ăn trưa

- Ngày nghỉ: 12 ngày phép/năm

- Tham gia đầy đủ các chế độ BHYT, BHXH, BHTN

- Teambuilding 2 lần/năm.',NULL),
(0 ,'Junior Android Developer', 4, 0, 100, 'female', '35-40', 3.5, 2, '- Có kinh nghiệm lập trình Android tối thiểu 6 tháng.
- Nắm được khái niệm Android cơ bản (Activity/Service/View System, Resource, Storage, Thread Handling).
- Đã từng sử dụng một trong các kiến trúc MVP, MVVM.
- Hiểu biết Design Pattern là một lợi thế.
- Có khả năng dựng module độc lập là một lợi thế.
- Có hiểu biết về Web, Cloud technology là một lợi thế.
- Am hiểu Agile Scrum là một lợi thế.
- Đam mê, chủ động công việc, có kỹ năng làm việc nhóm, làm việc độc lập.
- Đam mê phát triển sản phẩm.
- Có kỹ năng làm việc nhóm/theo quy trình là một lợi thế.', '- Phát triển ứng dụng, module ứng dụng Android theo phân phối của Team Leader.
- Tham gia phân tích, thiết kế kiến trúc, luồng nghiệp vụ của ứng dụng di động theo phân phối của team leader.
- Phối hợp với Level Middle/Senior Developer thực hành code review.
- Phối hợp với các team liên quan vận hành dự án theo quy trình.
- Tham gia hướng dẫn, đào tạo member mới.
- Được phép tự do nghiên cứu công nghệ mới, đề xuất ý tưởng đóng góp vào dự án.', '- Môi trường thẳng thắn cực đoan - trà đá, bàn tròn, ném đá sếp, áp dụng triệt để văn hóa 6K startup, TSB3C.
- Luyện lên level cùng hệ sinh thái các sản phẩm có 30 triệu người dùng hàng tháng trên toàn cầu: Âu, Úc, Mỹ, Ấn Độ, Brazil, South Africa...
- Thực chiến cùng quản lý, chuyên gia từ các tập đoàn lớn: Topica, VNG, Samsung,...
- Mức lương hấp dẫn từ 12.000.000 - 20.000.000 VNĐ.
- Cơ chế đãi ngộ tập trung vào phát triển nhân tài và xây dựng theo concept gia tốc: Nhân sự Top đầu tăng lương gấp 6 lần nhân sự Top dưới.
- Thưởng 4-6 tháng lương 1 năm với nhân sự Top đầu.
- Bổ nhiệm ngay khi có chiến công đặc biệt.
- Văn hóa làm việc GenZ: trẻ trung, sáng tạo, dám nghĩ - dám làm.
- Tham gia các hoạt động vui chơi giải trí, du lịch, team building, ăn uống cùng các thành viên trong công ty.',NULL);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
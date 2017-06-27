-- MySQL dump 10.13  Distrib 5.5.50, for debian-linux-gnu (x86_64)
--
-- Host: sql.fotonower.com    Database: IMTMeta
-- ------------------------------------------------------
-- Server version	5.6.27-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `IMTMeta`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `IMTMeta` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `IMTMeta`;

--
-- Table structure for table `imt_city_mtr_search`
--

DROP TABLE IF EXISTS `imt_city_mtr_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imt_city_mtr_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NOT NULL,
  `search_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `imt_city_mtr_search_city_fk_idx` (`city_id`),
  KEY `imt_city_mtr_search_search_fk_idx` (`search_id`),
  CONSTRAINT `imt_city_mtr_search_city_fk` FOREIGN KEY (`city_id`) REFERENCES `imt_places` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `imt_city_mtr_search_search_fk` FOREIGN KEY (`search_id`) REFERENCES `MTRUser`.`search_params` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=450 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imt_city_tag_portfolios`
--

DROP TABLE IF EXISTS `imt_city_tag_portfolios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imt_city_tag_portfolios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `portfolio_id` int(11) NOT NULL,
  `prod` bit(1) DEFAULT b'0',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_tag_ptfl` (`tag_id`,`city_id`),
  KEY `imt_city_tag_portfolios_city_fk_idx` (`city_id`),
  KEY `imt_city_tag_portfolios_portoflio_fk_idx` (`portfolio_id`),
  CONSTRAINT `imt_city_tag_portfolios_city_fk` FOREIGN KEY (`city_id`) REFERENCES `imt_places` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `imt_city_tag_portfolios_portoflio_fk` FOREIGN KEY (`portfolio_id`) REFERENCES `MTRUser`.`mtr_portfolios` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `imt_city_tag_portfolios_tag_fk` FOREIGN KEY (`tag_id`) REFERENCES `imt_tags` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8233 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imt_places`
--

DROP TABLE IF EXISTS `imt_places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imt_places` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(190) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `popularity` double unsigned NOT NULL DEFAULT '0',
  `category` smallint(5) unsigned NOT NULL DEFAULT '0',
  `prod` bit(1) NOT NULL DEFAULT b'0',
  `updated_at` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`),
  KEY `search` (`id`,`name`,`latitude`,`longitude`,`popularity`,`category`,`prod`)
) ENGINE=InnoDB AUTO_INCREMENT=1582 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imt_tags`
--

DROP TABLE IF EXISTS `imt_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imt_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(190) NOT NULL,
  `filename` varchar(256) DEFAULT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_unique_imt` (`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=6988 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `MTRAdmin`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `MTRAdmin` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `MTRAdmin`;

--
-- Table structure for table `count_portfolio_display`
--

DROP TABLE IF EXISTS `count_portfolio_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `count_portfolio_display` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_portfolio_id` int(11) NOT NULL,
  `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `count_portfolio_display_mtr_portfolio_id_idx` (`mtr_portfolio_id`),
  KEY `search` (`id`,`mtr_portfolio_id`,`timestamp`),
  CONSTRAINT `count_portfolio_display_mtr_portfolio_id` FOREIGN KEY (`mtr_portfolio_id`) REFERENCES `MTRUser`.`mtr_portfolios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1615088 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `count_user_connection`
--

DROP TABLE IF EXISTS `count_user_connection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `count_user_connection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_user_id` int(11) NOT NULL,
  `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `count_user_connection_mtr_user_id` (`mtr_user_id`),
  KEY `search` (`id`,`mtr_user_id`,`timestamp`),
  CONSTRAINT `count_user_connection_mtr_user_id` FOREIGN KEY (`mtr_user_id`) REFERENCES `MTRUser`.`mtr_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=65979 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fotocells`
--

DROP TABLE IF EXISTS `fotocells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fotocells` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `latitude` double DEFAULT NULL COMMENT 'latitude of the center',
  `longitude` double DEFAULT NULL COMMENT 'longitude of the center',
  `radius` double DEFAULT NULL COMMENT 'in meters',
  `parent_id` int(11) DEFAULT NULL COMMENT 'to manage splitting and merging',
  `hashtag` varchar(128) DEFAULT NULL,
  `user` varchar(128) DEFAULT NULL,
  `count_request` int(11) NOT NULL DEFAULT '0',
  `prod` bit(1) NOT NULL DEFAULT b'1',
  `period` double DEFAULT NULL COMMENT 'in s',
  `min_photos_date` timestamp NULL DEFAULT NULL,
  `max_photos_date` timestamp NULL DEFAULT NULL,
  `status` varchar(512) DEFAULT NULL,
  `count_period_retrieved` int(11) NOT NULL DEFAULT '0' COMMENT 'in difference of timestamp',
  `count_photos` int(11) NOT NULL DEFAULT '0',
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `center_radius_unique` (`latitude`,`longitude`,`radius`,`hashtag`,`user`),
  KEY `search_key_geo_cell` (`latitude`,`id`,`longitude`,`radius`,`prod`,`period`,`min_photos_date`,`max_photos_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fotonower_cookies`
--

DROP TABLE IF EXISTS `fotonower_cookies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fotonower_cookies` (
  `id` varchar(256) CHARACTER SET latin1 NOT NULL,
  `mtr_user_id` int(11) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT NULL,
  `lastUsed` timestamp NULL DEFAULT NULL,
  `expirationDate` timestamp NULL DEFAULT NULL,
  `ip` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expiration_cookies` (`expirationDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job_launch_log`
--

DROP TABLE IF EXISTS `job_launch_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_launch_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `command` varchar(512) CHARACTER SET utf8mb4 NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hostname` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  `launched` bit(1) NOT NULL DEFAULT b'0',
  `finished` bit(1) NOT NULL DEFAULT b'0',
  `mtr_user_id` int(11) DEFAULT '0',
  `search_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `search` (`id`,`created_at`,`updated_at`,`hostname`,`limit`,`launched`,`finished`,`mtr_user_id`,`search_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3804096 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_slow_query`
--

DROP TABLE IF EXISTS `log_slow_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_slow_query` (
  `id` int(11) NOT NULL COMMENT 'Log slow query is also now recording all query in order to rerun them if needed',
  `query` varchar(4096) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` double DEFAULT NULL COMMENT 'in msecond',
  `mtr_user_id` int(11) DEFAULT NULL,
  `context` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `info` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_results` int(11) DEFAULT NULL,
  `data_answer_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible` bit(1) DEFAULT b'1',
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mtr_portfolio_id` int(11) DEFAULT NULL,
  `descriptors_computed` bit(1) DEFAULT b'0',
  `timestamp` datetime DEFAULT NULL COMMENT 'in GMT',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_unique_log_slow_query` (`id`),
  KEY `mtr_portfolio_id_slow_query_idx` (`mtr_portfolio_id`),
  CONSTRAINT `mtr_portfolio_id_slow_query` FOREIGN KEY (`mtr_portfolio_id`) REFERENCES `MTRUser`.`mtr_portfolios` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_portfolio_photos`
--

DROP TABLE IF EXISTS `mtr_portfolio_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_portfolio_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_portfolio_id` int(11) DEFAULT NULL,
  `mtr_photo_id` int(11) DEFAULT NULL,
  `hide_status` int(11) DEFAULT '0' COMMENT '0 : show\n1 : hidden manually\n2 : hidden automatically (to be implemented)\n\n',
  `display_text` bit(1) DEFAULT b'1',
  `display_hashtag` bit(1) DEFAULT b'1',
  `display_username` bit(1) DEFAULT b'1',
  `order` int(11) DEFAULT NULL,
  `mtr_user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mtr_port_phot_many_to_one` (`mtr_portfolio_id`,`mtr_photo_id`),
  KEY `mtr_portfolio_in_photo_id_idx` (`mtr_photo_id`),
  KEY `search` (`id`,`mtr_portfolio_id`,`mtr_photo_id`,`order`),
  CONSTRAINT `mtr_photo_portfolio_mtruserphotos` FOREIGN KEY (`mtr_photo_id`) REFERENCES `mtr_photos` (`photo_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=50628571 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_pricing_condition`
--

DROP TABLE IF EXISTS `mtr_pricing_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_pricing_condition` (
  `id` int(11) NOT NULL,
  `mtr_user_id` int(11) DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mtr_pricing_condition_mtr_user_id_idx` (`mtr_user_id`),
  CONSTRAINT `mtr_pricing_condition_mtr_user_id` FOREIGN KEY (`mtr_user_id`) REFERENCES `MTRUser`.`mtr_users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_reported_pic`
--

DROP TABLE IF EXISTS `mtr_reported_pic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_reported_pic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_id` bigint(20) NOT NULL,
  `mtr_user_id` int(11) NOT NULL,
  `message` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `treated` int(11) DEFAULT '0',
  `mtr_user_id_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `unique_keys` (`photo_id`,`mtr_user_id`),
  KEY `treated_index` (`treated`),
  KEY `date_index` (`created_at`,`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_right_request_actions`
--

DROP TABLE IF EXISTS `mtr_right_request_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_right_request_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mrr_id` int(11) DEFAULT NULL,
  `mtr_user_id` int(11) DEFAULT NULL,
  `mtr_license_type` int(11) DEFAULT NULL,
  `status_from` int(11) DEFAULT NULL,
  `status_to` int(11) DEFAULT NULL,
  `comment` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_api_call` bit(1) DEFAULT b'0',
  `log_external_query` varchar(1024) CHARACTER SET utf8mb4 DEFAULT NULL,
  `url_query` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_external_api_call` int(11) DEFAULT NULL,
  `log` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mtr_right_request_actions_user_fk_idx` (`mtr_user_id`),
  KEY `mtr_right_request_actions_mrr_fk_idx` (`mrr_id`),
  KEY `mtr_right_request_actions_license_type_idx` (`mtr_license_type`),
  KEY `mtr_right_request_actions_search` (`id`,`mrr_id`,`mtr_user_id`,`status_from`,`status_to`,`created_at`,`mtr_license_type`,`updated_at`),
  CONSTRAINT `mtr_right_request_actions_license_type` FOREIGN KEY (`mtr_license_type`) REFERENCES `MTRLegal`.`mtr_license_message` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mtr_right_request_actions_mrr_fk` FOREIGN KEY (`mrr_id`) REFERENCES `MTRUser`.`mtr_request_rights` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `mtr_right_request_actions_user_fk` FOREIGN KEY (`mtr_user_id`) REFERENCES `MTRUser`.`mtr_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28310 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `photo_desc_test`
--

DROP TABLE IF EXISTS `photo_desc_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_desc_test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_id` int(11) NOT NULL,
  `desc` varbinary(16384) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `is_gpu_loaded` bit(1) DEFAULT b'0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_by_type` (`photo_id`,`type`),
  KEY `search_test` (`id`,`photo_id`,`type`,`created_at`,`updated_at`),
  KEY `search_2_test` (`is_gpu_loaded`,`type`,`photo_id`),
  KEY `search_3_test` (`id`,`photo_id`,`type`,`is_gpu_loaded`),
  KEY `photo_desc_type_fk_idx_test` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ping_portfolio`
--

DROP TABLE IF EXISTS `ping_portfolio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ping_portfolio` (
  `ping_id` int(11) NOT NULL AUTO_INCREMENT,
  `ping_time` timestamp NULL DEFAULT NULL,
  `ping_result` tinyint(4) DEFAULT NULL,
  `ping_duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`ping_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1355431 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `bot` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unsollicited` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unsollicited_requests_and_bot`
--

DROP TABLE IF EXISTS `unsollicited_requests_and_bot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unsollicited_requests_and_bot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL,
  `bot` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unsollicited` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `MTRBack`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `MTRBack` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `MTRBack`;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `city` varchar(200) NOT NULL,
  `area` varchar(200) NOT NULL,
  `point_rank` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `complete_history` bit(1) DEFAULT b'1',
  `prod` bit(1) DEFAULT b'0' COMMENT 'We list the geolocalization that have generated geocells.',
  `type` varchar(50) DEFAULT NULL COMMENT '''city'' , ''area'', or null\n''country''',
  UNIQUE KEY `secondary` (`city`,`area`,`point_rank`,`latitude`,`longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deleted_photos`
--

DROP TABLE IF EXISTS `deleted_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deleted_photos` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` varchar(45) NOT NULL,
  `place_id` int(11) NOT NULL,
  `url` varchar(500) NOT NULL,
  `url_small` varchar(500) NOT NULL,
  `url_medium` varchar(500) NOT NULL,
  `timeStamp` datetime DEFAULT NULL,
  `uploaded_at` int(11) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `is_video` bit(1) DEFAULT NULL,
  `video_low_bandwidth` varchar(500) DEFAULT NULL,
  `video_low_resolution` varchar(500) DEFAULT NULL,
  `video_standard_resolution` varchar(500) DEFAULT NULL,
  `mtr_photo_category_id` int(11) NOT NULL DEFAULT '14',
  `external_user_id` varchar(32) DEFAULT NULL,
  `sourcename` varchar(32) DEFAULT NULL,
  `tags` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'utf8mb4_unicode_ci',
  `nb_comments` int(11) DEFAULT NULL,
  `nb_likes` int(11) DEFAULT NULL,
  `users_in_photo` varchar(128) DEFAULT NULL,
  `caption` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'utf8mb4_unicode_ci',
  `cite_url` varchar(128) DEFAULT NULL,
  `filter` varchar(45) DEFAULT NULL,
  `username` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `profile_picture` varchar(512) DEFAULT NULL,
  `text` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'utf8mb4_unicode_ci',
  `nb_followers` int(11) DEFAULT NULL,
  `nb_followed` int(11) DEFAULT NULL,
  `nb_media` int(11) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `dcreated_at` datetime DEFAULT NULL,
  `dupdated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`photo_id`),
  UNIQUE KEY `secondary` (`sourcename`,`source_id`),
  KEY `place_deleted_photos_id_IDX` (`place_id`),
  KEY `deleted_photos_id_idx` (`photo_id`),
  KEY `deleted_photos_time_idx` (`timeStamp`),
  KEY `deleted_photos_id_time_idx` (`photo_id`,`timeStamp`),
  KEY `deleted_photos_omb_photo_category_id_idx` (`mtr_photo_category_id`),
  KEY `deleted_photos_search_idx` (`latitude`,`longitude`,`place_id`,`timeStamp`,`mtr_photo_category_id`,`photo_id`,`score`,`nb_likes`,`is_video`)
) ENGINE=InnoDB AUTO_INCREMENT=908998603 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fotocell_hashtag_day_counter`
--

DROP TABLE IF EXISTS `fotocell_hashtag_day_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fotocell_hashtag_day_counter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fotocell_id` int(11) NOT NULL,
  `day` date NOT NULL,
  `hashtag_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_data` (`fotocell_id`,`day`,`hashtag_id`),
  KEY `hashtag_fk_for_count_idx` (`hashtag_id`),
  CONSTRAINT `fotocell_fk_for_count` FOREIGN KEY (`fotocell_id`) REFERENCES `fotocells` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `hashtag_fk_for_count` FOREIGN KEY (`hashtag_id`) REFERENCES `hashtags` (`hashtag_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1040041666 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fotocells`
--

DROP TABLE IF EXISTS `fotocells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fotocells` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `latitude` double DEFAULT NULL COMMENT 'latitude of the center',
  `longitude` double DEFAULT NULL COMMENT 'longitude of the center',
  `radius` double DEFAULT NULL COMMENT 'in meters',
  `parent_id` int(11) DEFAULT NULL COMMENT 'to manage splitting and merging',
  `hashtag` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `user` varchar(128) DEFAULT NULL,
  `place_id` varchar(128) DEFAULT '0',
  `count_request` int(11) NOT NULL DEFAULT '0',
  `prod` bit(1) NOT NULL DEFAULT b'1',
  `period` double DEFAULT NULL COMMENT 'in s',
  `min_photos_date` timestamp NULL DEFAULT NULL,
  `max_photos_date` timestamp NULL DEFAULT NULL,
  `status` varchar(512) DEFAULT NULL,
  `count_period_retrieved` int(11) NOT NULL DEFAULT '0' COMMENT 'in difference of timestamp',
  `count_photos` int(11) NOT NULL DEFAULT '0',
  `count_all_photos_by_time` int(11) DEFAULT '0',
  `count_new_photos` int(11) DEFAULT '0',
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `center_radius_unique` (`latitude`,`longitude`,`radius`,`hashtag`,`user`,`place_id`),
  KEY `search_key_geo_cell` (`latitude`,`id`,`longitude`,`radius`,`prod`,`period`,`min_photos_date`,`max_photos_date`)
) ENGINE=InnoDB AUTO_INCREMENT=21217839 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hashtag_count_per_photo_by_hashtag`
--

DROP TABLE IF EXISTS `hashtag_count_per_photo_by_hashtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hashtag_count_per_photo_by_hashtag` (
  `hashtag_id_searched` int(11) NOT NULL,
  `hashtag_id_counted` int(11) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`hashtag_id_searched`,`hashtag_id_counted`),
  KEY `hcppbh_hashtag_counted_id_fk_idx` (`hashtag_id_counted`),
  CONSTRAINT `hcppbh_hashtag_counted_id_fk` FOREIGN KEY (`hashtag_id_counted`) REFERENCES `hashtags` (`hashtag_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `hcppbh_hashtag_searched_id_fk` FOREIGN KEY (`hashtag_id_searched`) REFERENCES `hashtags` (`hashtag_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hashtag_metrics`
--

DROP TABLE IF EXISTS `hashtag_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hashtag_metrics` (
  `hashtag_metric_id` int(11) NOT NULL AUTO_INCREMENT,
  `hashtag_id` int(11) NOT NULL,
  `metric_name` varchar(45) NOT NULL,
  `timestamp` datetime NOT NULL,
  `value` double NOT NULL,
  PRIMARY KEY (`hashtag_metric_id`,`hashtag_id`),
  KEY `hashtag_fk_idx` (`hashtag_id`),
  CONSTRAINT `hashtag_fk` FOREIGN KEY (`hashtag_id`) REFERENCES `hashtags` (`hashtag_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hashtag_trend`
--

DROP TABLE IF EXISTS `hashtag_trend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hashtag_trend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hashtag_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `zone` varchar(45) NOT NULL,
  `trend_score` float NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_idx_trend_hashtag` (`hashtag_id`,`date`,`zone`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=14908 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hashtags`
--

DROP TABLE IF EXISTS `hashtags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hashtags` (
  `hashtag_id` int(11) NOT NULL AUTO_INCREMENT,
  `hashtag_utf8_bin` varchar(190) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '""',
  `hashtag` varchar(190) CHARACTER SET utf8mb4 NOT NULL,
  `hashtag_mb4_cs` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'nil',
  `nb_occurences` int(11) NOT NULL DEFAULT '0',
  `score` double NOT NULL DEFAULT '0',
  `prefix_1_hid` int(11) DEFAULT NULL,
  `prefix_2_hid` int(11) DEFAULT NULL,
  `prefix_3_hid` int(11) DEFAULT NULL,
  PRIMARY KEY (`hashtag_id`),
  UNIQUE KEY `hashtag_mb4_ci_UNIQUE` (`hashtag`),
  KEY `hashtag_order` (`hashtag_id`,`nb_occurences`),
  KEY `fk_id_prefix_one` (`prefix_1_hid`),
  KEY `fk_id_prefix_two` (`prefix_2_hid`),
  KEY `fk_id_prefix_three` (`prefix_3_hid`),
  KEY `hashtag_mb4_cs_not_yet_uq` (`hashtag_mb4_cs`),
  KEY `search` (`hashtag`,`nb_occurences`,`score`,`hashtag_id`,`prefix_1_hid`,`prefix_2_hid`,`prefix_3_hid`),
  KEY `score_hashtag_idx` (`hashtag_id`,`score`,`hashtag`,`nb_occurences`),
  KEY `score_idx` (`score`),
  CONSTRAINT `fk_id_prefix_one` FOREIGN KEY (`prefix_1_hid`) REFERENCES `hashtags` (`hashtag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_prefix_three` FOREIGN KEY (`prefix_3_hid`) REFERENCES `hashtags` (`hashtag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_prefix_two` FOREIGN KEY (`prefix_2_hid`) REFERENCES `hashtags` (`hashtag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2014461167 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `manual_tagging_problem`
--

DROP TABLE IF EXISTS `manual_tagging_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manual_tagging_problem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_user_id` int(11) NOT NULL DEFAULT '31',
  `name` varchar(128) NOT NULL COMMENT 'Will be an hashtag name !',
  `pb_hashtag_id` int(11) NOT NULL COMMENT 'Will be an hashtag id !',
  `hashtag_id_list` varchar(512) NOT NULL COMMENT 'csv list of hashtag_ids',
  `button_legend_list` varchar(512) NOT NULL COMMENT 'csv list of button legend',
  `portfolio_id_lists` varchar(512) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `photo_hashtag_type` int(10) unsigned DEFAULT NULL,
  `photo_desc_type` int(11) DEFAULT '2',
  `svm_limit` int(11) DEFAULT '10000',
  `limit_tagging` int(11) DEFAULT '1000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_hahstg_id` (`pb_hashtag_id`),
  UNIQUE KEY `unique_name` (`name`),
  KEY `fk_pb_tagging_hahstag_id` (`pb_hashtag_id`),
  KEY `manual_tagging_problem_mtr_user_id_idx` (`mtr_user_id`),
  KEY `type_fk_pb_type` (`photo_hashtag_type`),
  CONSTRAINT `type_fk_pb_type` FOREIGN KEY (`photo_hashtag_type`) REFERENCES `photo_hashtag_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_licenses`
--

DROP TABLE IF EXISTS `mtr_licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(2048) DEFAULT NULL,
  `comment` varchar(4096) DEFAULT NULL,
  `tags` varchar(128) DEFAULT NULL,
  `hashtags_theme` varchar(4096) DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `complete_license` mediumtext,
  `free_license` bit(1) DEFAULT b'1',
  `full_size_picture` bit(1) DEFAULT b'0',
  `mtr_user_id` int(11) NOT NULL DEFAULT '31',
  `lang` varchar(2) DEFAULT 'fr',
  `main_license_id` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sell_license` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `mtr_licenses_ mtr_licenses_traduction_idx` (`main_license_id`),
  CONSTRAINT `mtr_licenses_ mtr_licenses_traduction` FOREIGN KEY (`main_license_id`) REFERENCES `mtr_licenses` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_photo_categories_deprecated_112015`
--

DROP TABLE IF EXISTS `mtr_photo_categories_deprecated_112015`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_photo_categories_deprecated_112015` (
  `mtr_photo_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_photo_category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`mtr_photo_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_photo_right_status_deprecated_112015`
--

DROP TABLE IF EXISTS `mtr_photo_right_status_deprecated_112015`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_photo_right_status_deprecated_112015` (
  `id` int(11) NOT NULL,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'It lists the different mtr_photo_category_id status.\n',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `photo_hashtag_ids`
--

DROP TABLE IF EXISTS `photo_hashtag_ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_hashtag_ids` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `photo_id` int(11) NOT NULL,
  `hashtag_id` int(11) NOT NULL,
  `type` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0 : Instagram\n1 : Champ semantique',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phi_cross_index_new_timed` (`photo_id`,`hashtag_id`,`type`),
  KEY `phi_photo_id_fk_pid_hid_idx_new_timed` (`photo_id`),
  KEY `phi_hashtag_id_fk_pid_hid_idx_new_timed` (`hashtag_id`),
  KEY `index_search_type_hashtag_id_new_timed` (`type`,`id`),
  KEY `phi_cross_index_new_and_timestamp_timed` (`photo_id`,`hashtag_id`,`type`,`timestamp`,`id`),
  CONSTRAINT `phi_hashtag_id_fk_pid_hid_new_timed` FOREIGN KEY (`hashtag_id`) REFERENCES `hashtags` (`hashtag_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `phi_photo_id_fk_new_timed` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`photo_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `type_fk_phi_type_timed` FOREIGN KEY (`type`) REFERENCES `photo_hashtag_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12535545479 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `photo_hashtag_ids_bp`
--

DROP TABLE IF EXISTS `photo_hashtag_ids_bp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_hashtag_ids_bp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `photo_id` int(11) NOT NULL,
  `hashtag_id` int(11) NOT NULL,
  `type` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0 : Instagram\n1 : Champ semantique',
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phi_cross_index_new_timed_bp` (`photo_id`,`hashtag_id`,`type`),
  KEY `phi_photo_id_fk_pid_hid_idx_new_timed_bp` (`photo_id`),
  KEY `phi_hashtag_id_fk_pid_hid_idx_new_timed_bp` (`hashtag_id`),
  KEY `index_search_type_hashtag_id_new_timed_bp` (`type`,`id`),
  KEY `phi_cross_index_new_and_timestamp_timed_bp` (`photo_id`,`hashtag_id`,`type`,`timestamp`,`id`),
  CONSTRAINT `phi_hashtag_id_fk_pid_hid_new_timed_bp` FOREIGN KEY (`hashtag_id`) REFERENCES `hashtags` (`hashtag_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `phi_photo_id_fk_new_timed_bp` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`photo_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `type_fk_phi_type_timed_bp` FOREIGN KEY (`type`) REFERENCES `photo_hashtag_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11464826514 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `photo_hashtag_type`
--

DROP TABLE IF EXISTS `photo_hashtag_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_hashtag_type` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` varchar(45) NOT NULL,
  `place_id` int(11) NOT NULL,
  `url` varchar(500) NOT NULL,
  `url_small` varchar(500) NOT NULL,
  `url_medium` varchar(500) NOT NULL,
  `timeStamp` datetime NOT NULL,
  `uploaded_at` int(11) DEFAULT NULL COMMENT 'Uploaded on social media',
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `is_video` bit(1) DEFAULT b'0',
  `video_low_bandwidth` varchar(500) DEFAULT NULL,
  `video_low_resolution` varchar(500) DEFAULT NULL,
  `video_standard_resolution` varchar(500) DEFAULT NULL,
  `right_categories` int(11) NOT NULL DEFAULT '0' COMMENT '14 should be treated as 0 until we have reset all past photo to 0',
  `external_user_id` varchar(32) DEFAULT NULL,
  `sourcename` varchar(32) DEFAULT NULL,
  `tags` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'utf8mb4_unicode_ci',
  `nb_comments` int(11) DEFAULT NULL,
  `nb_likes` int(11) DEFAULT NULL,
  `users_in_photo` varchar(128) DEFAULT NULL,
  `caption` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'utf8mb4_unicode_ci',
  `cite_url` varchar(128) DEFAULT NULL,
  `filter` varchar(45) DEFAULT NULL,
  `username` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `profile_picture` varchar(512) DEFAULT NULL,
  `text` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'utf8mb4_unicode_ci',
  `nb_followers` int(11) DEFAULT NULL,
  `nb_followed` int(11) DEFAULT NULL,
  `nb_media` int(11) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `dcreated_at` datetime DEFAULT NULL,
  `dupdated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`photo_id`),
  UNIQUE KEY `secondary` (`sourcename`,`source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=909018651 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `photos_search`
--

DROP TABLE IF EXISTS `photos_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos_search` (
  `photo_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  `uploaded_at` int(11) DEFAULT NULL COMMENT 'Uploaded on social media',
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `is_video` bit(1) DEFAULT b'0',
  `is_cv_indexed` bit(1) DEFAULT NULL,
  `right_categories` int(11) NOT NULL DEFAULT '0',
  `sourcename` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_user_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb_likes` int(11) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `nb_comments` int(11) DEFAULT NULL,
  `nb_followers` int(11) DEFAULT NULL,
  `nb_followeds` int(11) DEFAULT NULL,
  `nb_media` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`photo_id`),
  KEY `ph_place_id_IDX` (`place_id`),
  KEY `ph_photo_id_idx` (`photo_id`),
  KEY `ph_mtr_photo_category_id_idx` (`right_categories`),
  KEY `ph_photo_update_idx` (`uploaded_at`),
  KEY `ph_photo_id_update_idx` (`photo_id`,`uploaded_at`),
  KEY `photo_user_id_search` (`external_user_id`),
  KEY `ph_photo_search_idx` (`latitude`,`longitude`,`place_id`,`uploaded_at`,`right_categories`,`photo_id`,`score`,`nb_likes`,`external_user_id`,`is_video`,`is_cv_indexed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `photos_search_all`
--

DROP TABLE IF EXISTS `photos_search_all`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos_search_all` (
  `photo_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  `uploaded_at` int(11) DEFAULT NULL COMMENT 'Uploaded on social media',
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `is_video` bit(1) DEFAULT b'0',
  `is_cv_indexed` bit(1) DEFAULT NULL,
  `right_categories` int(11) NOT NULL DEFAULT '0',
  `sourcename` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_user_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb_likes` int(11) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `nb_comments` int(11) DEFAULT NULL,
  `nb_followers` int(11) DEFAULT NULL,
  `nb_followeds` int(11) DEFAULT NULL,
  `nb_media` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`photo_id`),
  KEY `ph_place_id_IDX` (`place_id`),
  KEY `ph_photo_id_idx` (`photo_id`),
  KEY `ph_mtr_photo_category_id_idx` (`right_categories`),
  KEY `ph_photo_update_idx` (`uploaded_at`),
  KEY `ph_photo_id_update_idx` (`photo_id`,`uploaded_at`),
  KEY `photo_user_id_search` (`external_user_id`),
  KEY `ph_photo_search_idx` (`latitude`,`longitude`,`place_id`,`uploaded_at`,`right_categories`,`photo_id`,`score`,`nb_likes`,`external_user_id`,`is_video`,`is_cv_indexed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `photos_search_bp`
--

DROP TABLE IF EXISTS `photos_search_bp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos_search_bp` (
  `photo_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  `uploaded_at` int(11) DEFAULT NULL COMMENT 'Uploaded on social media',
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `is_video` bit(1) DEFAULT b'0',
  `is_cv_indexed` bit(1) DEFAULT NULL,
  `right_categories` int(11) NOT NULL DEFAULT '0',
  `sourcename` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_user_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb_likes` int(11) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `nb_comments` int(11) DEFAULT NULL,
  `nb_followers` int(11) DEFAULT NULL,
  `nb_followeds` int(11) DEFAULT NULL,
  `nb_media` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`photo_id`),
  KEY `ph_place_id_IDX_bp` (`place_id`),
  KEY `ph_photo_id_idx_bp` (`photo_id`),
  KEY `ph_mtr_photo_category_id_idx_bp` (`right_categories`),
  KEY `ph_photo_update_idx_bp` (`uploaded_at`),
  KEY `ph_photo_id_update_idx_bp` (`photo_id`,`uploaded_at`),
  KEY `photo_user_id_search_bp` (`external_user_id`),
  KEY `ph_photo_search_idx_bp` (`latitude`,`longitude`,`place_id`,`uploaded_at`,`right_categories`,`photo_id`,`score`,`nb_likes`,`external_user_id`,`is_video`,`is_cv_indexed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `photos_search_bp_2`
--

DROP TABLE IF EXISTS `photos_search_bp_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos_search_bp_2` (
  `photo_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  `uploaded_at` int(11) DEFAULT NULL COMMENT 'Uploaded on social media',
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `is_video` bit(1) DEFAULT b'0',
  `is_cv_indexed` bit(1) DEFAULT NULL,
  `right_categories` int(11) NOT NULL DEFAULT '0',
  `sourcename` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_user_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb_likes` int(11) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `nb_comments` int(11) DEFAULT NULL,
  `nb_followers` int(11) DEFAULT NULL,
  `nb_followeds` int(11) DEFAULT NULL,
  `nb_media` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`photo_id`),
  KEY `ph_place_id_IDX_bp_2` (`place_id`),
  KEY `ph_photo_id_idx_bp_2` (`photo_id`),
  KEY `ph_mtr_photo_category_id_idx_bp_2` (`right_categories`),
  KEY `ph_photo_update_idx_bp_2` (`uploaded_at`),
  KEY `ph_photo_id_update_idx_bp_2` (`photo_id`,`uploaded_at`),
  KEY `photo_user_id_search_bp_2` (`external_user_id`),
  KEY `ph_photo_search_idx_bp_2` (`latitude`,`longitude`,`place_id`,`uploaded_at`,`right_categories`,`photo_id`,`score`,`nb_likes`,`external_user_id`,`is_video`,`is_cv_indexed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `photos_search_bp_3`
--

DROP TABLE IF EXISTS `photos_search_bp_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos_search_bp_3` (
  `photo_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  `uploaded_at` int(11) DEFAULT NULL COMMENT 'Uploaded on social media',
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `is_video` bit(1) DEFAULT b'0',
  `is_cv_indexed` bit(1) DEFAULT NULL,
  `right_categories` int(11) NOT NULL DEFAULT '0',
  `sourcename` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_user_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb_likes` int(11) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `nb_comments` int(11) DEFAULT NULL,
  `nb_followers` int(11) DEFAULT NULL,
  `nb_followeds` int(11) DEFAULT NULL,
  `nb_media` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`photo_id`),
  KEY `ph_place_id_IDX_bp_3` (`place_id`),
  KEY `ph_photo_id_idx_bp_3` (`photo_id`),
  KEY `ph_mtr_photo_category_id_idx_bp_3` (`right_categories`),
  KEY `ph_photo_update_idx_bp_3` (`uploaded_at`),
  KEY `ph_photo_id_update_idx_bp_3` (`photo_id`,`uploaded_at`),
  KEY `photo_user_id_search_bp_3` (`external_user_id`),
  KEY `ph_photo_search_idx_bp_3` (`latitude`,`longitude`,`place_id`,`uploaded_at`,`right_categories`,`photo_id`,`score`,`nb_likes`,`external_user_id`,`is_video`,`is_cv_indexed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `source_keys`
--

DROP TABLE IF EXISTS `source_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source_keys` (
  `sourcename` varchar(45) NOT NULL,
  `key1` varchar(200) DEFAULT NULL COMMENT 'Token',
  `key2` varchar(200) DEFAULT NULL,
  `key3` varchar(200) DEFAULT NULL COMMENT 'client id',
  `key4` varchar(200) DEFAULT NULL COMMENT 'client secret',
  `source_key_id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`source_key_id`),
  UNIQUE KEY `secondary` (`sourcename`,`key3`,`key4`,`key1`,`key2`),
  KEY `fk_sourcename_fk` (`sourcename`)
) ENGINE=InnoDB AUTO_INCREMENT=378 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sources`
--

DROP TABLE IF EXISTS `sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sources` (
  `source_id` int(11) NOT NULL,
  `sourcename` varchar(45) NOT NULL,
  PRIMARY KEY (`sourcename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `test_photo_aux`
--

DROP TABLE IF EXISTS `test_photo_aux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_photo_aux` (
  `photo_id` int(21) unsigned NOT NULL,
  PRIMARY KEY (`photo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `MTRCache`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `MTRCache` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `MTRCache`;

--
-- Table structure for table `comments_instagram`
--

DROP TABLE IF EXISTS `comments_instagram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments_instagram` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `photo_id` int(11) DEFAULT NULL,
  `photo_id_bi` bigint(20) unsigned DEFAULT NULL,
  `comment_id` bigint(20) unsigned DEFAULT NULL,
  `text` varchar(1048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_user_id` bigint(20) unsigned DEFAULT NULL,
  `hide_status` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `comments_instagram_comment_id_unique` (`comment_id`),
  KEY `comments_instagram _external_user_id_idx` (`external_user_id`),
  KEY `comments_instagram_photo_id_idx` (`photo_id`),
  KEY `search` (`photo_id_bi`,`external_user_id`,`id`,`created_at`,`hide_status`,`comment_id`),
  CONSTRAINT `comments_instagram _external_user_id` FOREIGN KEY (`external_user_id`) REFERENCES `instagram_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `comments_instagram_photo_id` FOREIGN KEY (`photo_id`) REFERENCES `MTRBack`.`photos` (`photo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43662865 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `instagram_date_data`
--

DROP TABLE IF EXISTS `instagram_date_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instagram_date_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `instagram_user_id` bigint(20) unsigned DEFAULT NULL,
  `nb_followers` int(11) DEFAULT NULL,
  `nb_media` int(11) DEFAULT NULL,
  `nb_followed` int(11) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `search` (`id`,`instagram_user_id`,`nb_followers`,`nb_media`,`nb_followed`,`timestamp`),
  KEY `external_user_id_instagram_idx` (`instagram_user_id`),
  CONSTRAINT `instagram_date_data_fk_user` FOREIGN KEY (`instagram_user_id`) REFERENCES `instagram_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=225629993 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `instagram_user`
--

DROP TABLE IF EXISTS `instagram_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instagram_user` (
  `id` bigint(20) unsigned NOT NULL,
  `username` varchar(128) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sourcename` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `source_id_instagram_place_unique` (`source_id`,`sourcename`)
) ENGINE=InnoDB AUTO_INCREMENT=76824642 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `MTRLabel`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `MTRLabel` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `MTRLabel`;

--
-- Table structure for table `DescriptionPhotoCars`
--

DROP TABLE IF EXISTS `DescriptionPhotoCars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DescriptionPhotoCars` (
  `Id_Photo` varchar(40) NOT NULL,
  `mtr_photo_id` bigint(20) DEFAULT NULL,
  `Id_Veh` int(11) NOT NULL,
  `Prix` int(11) NOT NULL,
  `Ville` varchar(40) NOT NULL,
  `Marque` varchar(22) NOT NULL,
  `Modele` varchar(18) NOT NULL,
  `Annee_Modele` int(11) NOT NULL,
  `Kilometrage` int(11) NOT NULL,
  `Carburant` varchar(10) NOT NULL,
  `Boite_de_vitesse` varchar(6190) NOT NULL,
  `Ref` varchar(6190) NOT NULL,
  PRIMARY KEY (`Id_Photo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `MTRLegal`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `MTRLegal` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `MTRLegal`;

--
-- Table structure for table `mtr_languages`
--

DROP TABLE IF EXISTS `mtr_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `short` varchar(2) DEFAULT NULL,
  `long` varchar(64) DEFAULT NULL,
  `wikipedia_url` varchar(512) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `short_UNIQUE` (`short`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_license_languages`
--

DROP TABLE IF EXISTS `mtr_license_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_license_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_license_id` int(11) DEFAULT NULL,
  `mtr_lang_id` int(11) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `tags` varchar(128) DEFAULT NULL,
  `license_link` varchar(45) DEFAULT NULL,
  `created_at` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mtr_license_languages_unique` (`mtr_license_id`,`mtr_lang_id`),
  KEY `mtr_license_languages_uq` (`mtr_license_id`,`mtr_lang_id`),
  KEY `mtr_license_languages_languages_idx` (`mtr_lang_id`),
  CONSTRAINT `mtr_license_languages_languages` FOREIGN KEY (`mtr_lang_id`) REFERENCES `mtr_languages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mtr_license_languages_licnese` FOREIGN KEY (`mtr_license_id`) REFERENCES `mtr_license_message` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_license_message`
--

DROP TABLE IF EXISTS `mtr_license_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_license_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(2048) DEFAULT NULL,
  `comment` varchar(4096) DEFAULT NULL,
  `tags` varchar(128) DEFAULT NULL,
  `hashtags_theme` varchar(4096) DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `complete_license` mediumtext,
  `free_license` bit(1) DEFAULT b'1',
  `full_size_picture` bit(1) DEFAULT b'0',
  `mtr_user_id` int(11) NOT NULL DEFAULT '31',
  `lang` varchar(2) DEFAULT 'fr',
  `main_license_id` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sell_license` bit(1) DEFAULT b'0',
  `photo_licence_ids` varchar(45) DEFAULT NULL COMMENT 'Just for information !',
  PRIMARY KEY (`id`),
  KEY `mtr_licenses_ mtr_licenses_traduction_idx` (`main_license_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_licenses_access_users`
--

DROP TABLE IF EXISTS `mtr_licenses_access_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_licenses_access_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license_type` int(11) DEFAULT NULL,
  `mtr_user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mtr_licenses_access_users)unique` (`license_type`,`mtr_user_id`),
  KEY `mtr_licenses_access_users_user_idx` (`mtr_user_id`),
  KEY `mtr_licenses_access_users_license_idx` (`license_type`),
  KEY `mtr_licenses_access_users_search` (`id`,`license_type`,`mtr_user_id`,`created_at`,`updated_at`),
  CONSTRAINT `mtr_licenses_access_users_license` FOREIGN KEY (`license_type`) REFERENCES `mtr_license_message` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mtr_licenses_access_users_user` FOREIGN KEY (`mtr_user_id`) REFERENCES `MTRUser`.`mtr_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_photo_category_rigths_list`
--

DROP TABLE IF EXISTS `mtr_photo_category_rigths_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_photo_category_rigths_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `url_photo_protected` bit(1) DEFAULT b'0',
  `mtr_user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mtr_photo_category_rigths_list_user_idx` (`mtr_user_id`),
  CONSTRAINT `mtr_photo_category_rigths_list_user` FOREIGN KEY (`mtr_user_id`) REFERENCES `MTRUser`.`mtr_users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_users_licenses_answers`
--

DROP TABLE IF EXISTS `mtr_users_licenses_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_users_licenses_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_license_id` int(11) DEFAULT NULL,
  `hashtag` varchar(128) DEFAULT NULL,
  `social_user` varchar(45) DEFAULT NULL,
  `sourcename` int(11) DEFAULT NULL COMMENT '0 : instagram\n1 : twitter\n2 : facebook\n3 : ...\n',
  `answer` int(11) DEFAULT NULL COMMENT '0 : asked \n5 : refused\n3 : discussion\n10 : accepted',
  `photo_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mtr_users_licenses_answers_unique` (`mtr_license_id`,`social_user`,`sourcename`),
  KEY `search` (`mtr_license_id`,`id`,`hashtag`,`social_user`,`sourcename`,`answer`,`created_at`,`updated_at`),
  CONSTRAINT `mtr_users_licenses_answers_license` FOREIGN KEY (`mtr_license_id`) REFERENCES `mtr_license_message` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4152 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `MTRMetaClassification`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `MTRMetaClassification` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `MTRMetaClassification`;

--
-- Table structure for table `mtr_classification_extraction_type`
--

DROP TABLE IF EXISTS `mtr_classification_extraction_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_classification_extraction_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `classification_type` varchar(128) DEFAULT NULL,
  `pretreatment_type` varchar(128) DEFAULT NULL,
  `extraction_type` varchar(128) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=321 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_classification_label_user`
--

DROP TABLE IF EXISTS `mtr_classification_label_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_classification_label_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `extraction_classification_type` int(10) unsigned DEFAULT NULL,
  `external_user_id` varchar(128) DEFAULT NULL,
  `label` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mtr_classification_label_user_unique` (`extraction_classification_type`,`external_user_id`),
  KEY `mtr_classification_label_user_extaction_type_idx` (`extraction_classification_type`),
  CONSTRAINT `mtr_classification_label_user_extaction_type` FOREIGN KEY (`extraction_classification_type`) REFERENCES `mtr_classification_extraction_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18691 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_extraction_data`
--

DROP TABLE IF EXISTS `mtr_extraction_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_extraction_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `extraction_classification_type_id` int(11) DEFAULT NULL COMMENT 'we should do an extraction type maybe ??? VR 21-12-15',
  `external_user_id` varchar(128) DEFAULT NULL,
  `data` varbinary(1024) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mtr_extraction_data_unique` (`extraction_classification_type_id`,`external_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=740446 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `photos_search_bp`
--

DROP TABLE IF EXISTS `photos_search_bp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos_search_bp` (
  `photo_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  `uploaded_at` int(11) DEFAULT NULL COMMENT 'Uploaded on social media',
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `is_video` bit(1) DEFAULT b'0',
  `is_cv_indexed` bit(1) DEFAULT NULL,
  `right_categories` int(11) NOT NULL DEFAULT '0',
  `sourcename` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_user_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb_likes` int(11) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `nb_comments` int(11) DEFAULT NULL,
  `nb_followers` int(11) DEFAULT NULL,
  `nb_followeds` int(11) DEFAULT NULL,
  `nb_media` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`photo_id`),
  KEY `ph_place_id_IDX_bp` (`place_id`),
  KEY `ph_photo_id_idx_bp` (`photo_id`),
  KEY `ph_mtr_photo_category_id_idx_bp` (`right_categories`),
  KEY `ph_photo_update_idx_bp` (`uploaded_at`),
  KEY `ph_photo_id_update_idx_bp` (`photo_id`,`uploaded_at`),
  KEY `photo_user_id_search_bp` (`external_user_id`),
  KEY `ph_photo_search_idx_bp` (`latitude`,`longitude`,`place_id`,`uploaded_at`,`right_categories`,`photo_id`,`score`,`nb_likes`,`external_user_id`,`is_video`,`is_cv_indexed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `MTRPhoto`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `MTRPhoto` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `MTRPhoto`;

--
-- Table structure for table `manual_tagging_problem`
--

DROP TABLE IF EXISTS `manual_tagging_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manual_tagging_problem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_user_id` int(11) NOT NULL DEFAULT '31',
  `name` varchar(128) NOT NULL COMMENT 'Will be an hashtag name !',
  `pb_hashtag_id` int(11) NOT NULL COMMENT 'Will be an hashtag id !',
  `hashtag_id_list` varchar(512) NOT NULL COMMENT 'csv list of hashtag_ids',
  `button_legend_list` varchar(512) NOT NULL COMMENT 'csv list of button legend',
  `portfolio_id_lists` varchar(512) DEFAULT NULL,
  `photo_hashtag_type` int(11) DEFAULT '69',
  `photo_desc_type` int(11) DEFAULT '2',
  `svm_limit` int(11) DEFAULT '10000',
  `limit_tagging` int(11) DEFAULT '1000',
  `is_public` bit(1) NOT NULL DEFAULT b'0',
  `live` bit(1) DEFAULT b'0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`name`),
  KEY `fk_pb_tagging_hahstag_id` (`pb_hashtag_id`),
  KEY `manual_tagging_problem_mtr_user_id_idx` (`mtr_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_auto_labels`
--

DROP TABLE IF EXISTS `mtr_auto_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_auto_labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_id` int(11) DEFAULT NULL,
  `hashtag_id` int(11) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT 'Previously pb_hashtag_id',
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mtr_auto_labels_pb_hashtag_id_idx` (`type`),
  KEY `mtr_auto_labels_photo_id_idx` (`photo_id`),
  KEY `search` (`id`,`photo_id`,`hashtag_id`,`score`,`type`,`created_at`),
  KEY `mtr_auto_labels_hashtag_id_idx` (`hashtag_id`),
  KEY `unique` (`photo_id`,`hashtag_id`,`type`),
  CONSTRAINT `mtr_auto_labels_hashtag_id` FOREIGN KEY (`hashtag_id`) REFERENCES `MTRBack`.`hashtags` (`hashtag_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `mtr_auto_labels_photo_id` FOREIGN KEY (`photo_id`) REFERENCES `MTRBack`.`photos` (`photo_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1854615 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `photo_desc`
--

DROP TABLE IF EXISTS `photo_desc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_desc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_id` int(11) NOT NULL,
  `desc` varbinary(16384) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `is_gpu_loaded` bit(1) DEFAULT b'0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_by_type` (`photo_id`,`type`),
  KEY `search` (`id`,`photo_id`,`type`,`created_at`,`updated_at`),
  KEY `search_2` (`is_gpu_loaded`,`type`,`photo_id`),
  KEY `search_3` (`id`,`photo_id`,`type`,`is_gpu_loaded`),
  KEY `photo_desc_type_fk_idx` (`type`),
  CONSTRAINT `photo_desc_photo_desc_search_fkfk` FOREIGN KEY (`id`) REFERENCES `photo_desc_search` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `photo_desc_type` FOREIGN KEY (`type`) REFERENCES `photo_desc_type_params` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `photo_id_data_descriptors` FOREIGN KEY (`photo_id`) REFERENCES `MTRBack`.`photos` (`photo_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=78560242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `photo_desc_search`
--

DROP TABLE IF EXISTS `photo_desc_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_desc_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_id` int(11) NOT NULL,
  `type_store` int(11) NOT NULL DEFAULT '0' COMMENT '0 : sql,\n1 : s3,\n2 : sql + s3',
  `type` int(11) DEFAULT NULL,
  `is_gpu_loaded` bit(1) DEFAULT b'0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_by_type_search` (`photo_id`,`type`),
  KEY `search_search` (`id`,`photo_id`,`type`,`type_store`,`created_at`,`updated_at`),
  KEY `search_2_search` (`is_gpu_loaded`,`type`,`photo_id`),
  KEY `search_3_search` (`id`,`photo_id`,`type`,`is_gpu_loaded`),
  KEY `photo_desc_type_fk_idx_search` (`type`),
  CONSTRAINT `photo_desc_type_search` FOREIGN KEY (`type`) REFERENCES `photo_desc_type_params` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `photo_id_data_descriptors_search` FOREIGN KEY (`photo_id`) REFERENCES `MTRBack`.`photos` (`photo_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=78560361 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `photo_desc_type_params`
--

DROP TABLE IF EXISTS `photo_desc_type_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_desc_type_params` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `svm_number_of_descriptors` int(11) DEFAULT NULL,
  `size_desc` int(11) DEFAULT NULL,
  `caffemodel_name` varchar(512) CHARACTER SET utf8mb4 DEFAULT NULL,
  `layer_name` varchar(512) CHARACTER SET utf8mb4 DEFAULT NULL,
  `scale_desc` double DEFAULT NULL,
  `folder_install_caffe_version` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mean_file` varchar(4096) CHARACTER SET utf8mb4 DEFAULT NULL,
  `nb_discretization` int(11) DEFAULT '256',
  `main_photo_desc_type` int(11) DEFAULT NULL,
  `crop_stripes` tinyint(4) DEFAULT '0',
  `special_desc` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'geo, time ...',
  `nb_bit` int(11) NOT NULL DEFAULT '8',
  `photo_id_for_centroid` int(11) DEFAULT NULL,
  `number_centroids` int(11) DEFAULT NULL,
  `shift_desc` double DEFAULT NULL,
  `default_storage_type` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `MTRPhoto_ photo_desc_type_params_type_idx` (`photo_id_for_centroid`),
  CONSTRAINT `MTRPhoto_ photo_desc_type_params_type` FOREIGN KEY (`photo_id_for_centroid`) REFERENCES `MTRBack`.`photos` (`photo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1890 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vision_tree`
--

DROP TABLE IF EXISTS `vision_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vision_tree` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_user_id` int(11) DEFAULT NULL,
  `mtr_portfolio_id` int(11) DEFAULT NULL,
  `pids` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  `photo_desc_type` int(11) DEFAULT NULL,
  `name` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vision_tree_mtr_user_id_idx` (`mtr_user_id`),
  KEY `vision_tree_photo_desc_type_idx` (`photo_desc_type`),
  KEY `unique_vision_Tree` (`mtr_user_id`,`mtr_portfolio_id`,`limit`,`photo_desc_type`),
  CONSTRAINT `vision_tree_mtr_user_id` FOREIGN KEY (`mtr_user_id`) REFERENCES `MTRUser`.`mtr_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `vision_tree_pdt` FOREIGN KEY (`photo_desc_type`) REFERENCES `photo_desc_type_params` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vision_tree_arrows`
--

DROP TABLE IF EXISTS `vision_tree_arrows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vision_tree_arrows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `velours_tree_id` int(11) DEFAULT NULL,
  `node_id_1` int(11) DEFAULT NULL,
  `node_id_2` int(11) DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vision_tree_arrows _velours_tree_id_idx` (`velours_tree_id`),
  KEY `vision_tree_arrows_node_id_1_idx` (`node_id_1`),
  KEY `vision_tree_arrows_node_id_1_idx_fk` (`node_id_1`),
  KEY `vision_tree_arrows_node_id_1_idx_fkfkfk` (`node_id_1`),
  CONSTRAINT `vision_tree_arrows_velours_tree_id` FOREIGN KEY (`velours_tree_id`) REFERENCES `vision_tree` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=123951 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vision_tree_nodes`
--

DROP TABLE IF EXISTS `vision_tree_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vision_tree_nodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `velours_tree_id` int(11) DEFAULT NULL,
  `node_id` int(11) DEFAULT NULL,
  `nodes_type` varchar(45) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'photo or set of photo',
  `mtr_photo_id` int(11) DEFAULT NULL,
  `photo_desc_type` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vision_tree_nodes_velours_tree_id_idx` (`velours_tree_id`),
  CONSTRAINT `vision_tree_nodes_velours_tree_id` FOREIGN KEY (`velours_tree_id`) REFERENCES `vision_tree` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=124715 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `MTRPublish`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `MTRPublish` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `MTRPublish`;

--
-- Table structure for table `mtr_anonymous_users`
--

DROP TABLE IF EXISTS `mtr_anonymous_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_anonymous_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) NOT NULL,
  `user_agent` varchar(45) NOT NULL,
  `hash` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `search` (`id`,`ip`,`user_agent`,`hash`,`created_at`,`updated_at`),
  KEY `unique` (`ip`,`user_agent`,`hash`)
) ENGINE=InnoDB AUTO_INCREMENT=802 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_likes`
--

DROP TABLE IF EXISTS `mtr_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_user_id` int(11) DEFAULT NULL,
  `mtr_portfolio_id` int(11) DEFAULT NULL,
  `photo_id` int(11) DEFAULT NULL,
  `action` tinyint(4) DEFAULT NULL COMMENT '0 : like\n1 : dislike\n',
  `mtr_anonymous_user` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `search` (`id`,`mtr_user_id`,`mtr_portfolio_id`,`photo_id`,`action`,`mtr_anonymous_user`,`created_at`,`updated_at`),
  KEY `photo_id_like_idx` (`photo_id`),
  KEY `portfolio_id_idx` (`mtr_portfolio_id`),
  KEY `mtr_user_like_idx` (`mtr_user_id`),
  CONSTRAINT `mtr_user_like` FOREIGN KEY (`mtr_user_id`) REFERENCES `MTRUser`.`mtr_users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `photo_id_like` FOREIGN KEY (`photo_id`) REFERENCES `MTRBack`.`photos` (`photo_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `portfolio_id_like` FOREIGN KEY (`mtr_portfolio_id`) REFERENCES `MTRUser`.`mtr_portfolios` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=798 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `newsletter_sents`
--

DROP TABLE IF EXISTS `newsletter_sents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_sents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newsletter_id` int(11) DEFAULT NULL,
  `subscriber_id` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriber_id_idx` (`subscriber_id`),
  KEY `newsletter_id_idx` (`newsletter_id`),
  CONSTRAINT `newsletter_id` FOREIGN KEY (`newsletter_id`) REFERENCES `newsletters` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `subscriber_id` FOREIGN KEY (`subscriber_id`) REFERENCES `newsletter_subscribers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `newsletter_subscribers`
--

DROP TABLE IF EXISTS `newsletter_subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletter_subscribers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newsletters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `html` mediumtext,
  `html_blob` mediumtext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `MTRSemantic`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `MTRSemantic` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `MTRSemantic`;

--
-- Table structure for table `hashtag_relation`
--

DROP TABLE IF EXISTS `hashtag_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hashtag_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hashtag_id_1` int(11) DEFAULT NULL,
  `hashtag_id_2` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `value` float DEFAULT NULL,
  `mtr_user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hashtag_id_1_semantic_relation_fk_idx` (`hashtag_id_1`),
  KEY `hashtag_id_2_semantic_relation_fk_idx` (`hashtag_id_2`),
  KEY `type_semantic_relation_fk_idx` (`type_id`),
  KEY `search_index_type` (`hashtag_id_1`,`hashtag_id_2`,`type_id`),
  KEY `search_index_value` (`hashtag_id_1`,`hashtag_id_2`,`type_id`,`value`),
  KEY `type_semantic_relation_fk_idx1` (`mtr_user_id`),
  CONSTRAINT `hashtag_id_1_semantic_relation_fk` FOREIGN KEY (`hashtag_id_1`) REFERENCES `MTRBack`.`hashtags` (`hashtag_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `hashtag_id_2_semantic_relation_fk` FOREIGN KEY (`hashtag_id_2`) REFERENCES `MTRBack`.`hashtags` (`hashtag_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `type_semantic_relation_fk` FOREIGN KEY (`mtr_user_id`) REFERENCES `MTRUser`.`mtr_users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `type_relation`
--

DROP TABLE IF EXISTS `type_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_relation` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(256) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `MTRTrading`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `MTRTrading` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `MTRTrading`;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_user_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `collected` double DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_account` (`mtr_user_id`,`currency`),
  KEY `accounts_mtr_user_id_idx` (`mtr_user_id`),
  KEY `accounts_currency_idx` (`currency`),
  CONSTRAINT `accounts_currency` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `accounts_mtr_user_id` FOREIGN KEY (`mtr_user_id`) REFERENCES `MTRUser`.`mtr_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bids`
--

DROP TABLE IF EXISTS `bids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_user_id` int(11) NOT NULL,
  `mtr_license_type` int(11) DEFAULT NULL,
  `photo_id` int(11) NOT NULL,
  `mtr_portfolio_id` int(11) DEFAULT NULL,
  `comment` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log_instagram` varchar(1024) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '-1 : home\n0 : pending\n1 : comment send to Instagram\n2 : comment read on Instagram\n3 : accepted\n4 : refused\n5 : cancel\n6 : cart to buy\n7 : photo requested in HD\n8 : comment request not accepted by instagram\n9 : like 1 but with correct comment_id sent by api\n10 : photo requested to buy\n11 : photo bought\n12 : photo bought in hd\n\n',
  `rate_remaining` int(11) DEFAULT NULL,
  `rate_limit` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `currency` int(11) DEFAULT '0',
  `trade_done` bit(1) DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `notification_email` bit(1) DEFAULT b'0',
  `commented_at` timestamp NULL DEFAULT NULL,
  `comment_id` bigint(20) unsigned DEFAULT NULL,
  `screenshot_url` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answered_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mrr_user_license_photo` (`mtr_user_id`,`photo_id`,`mtr_license_type`),
  KEY `mtr_request_rights_photo_id_idx` (`photo_id`),
  KEY `mtr_request_rights_mtr_license_type_idx` (`mtr_license_type`),
  KEY `search` (`mtr_user_id`,`photo_id`,`id`,`mtr_license_type`,`mtr_portfolio_id`,`status`,`price`),
  CONSTRAINT `bids_s_mtr_license_type` FOREIGN KEY (`mtr_license_type`) REFERENCES `MTRLegal`.`mtr_license_message` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10044 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bids_unused`
--

DROP TABLE IF EXISTS `bids_unused`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bids_unused` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_user_id` int(11) DEFAULT NULL,
  `photo_id` int(11) DEFAULT NULL,
  `limit` double DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `time_limit` timestamp NULL DEFAULT NULL,
  `deal` bit(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bid_Trading_mtr_user_id_idx` (`mtr_user_id`),
  KEY `bid_trading_mtr_photo_id_idx` (`photo_id`),
  KEY `bid_trading_currency_idx` (`currency`),
  CONSTRAINT `bid_trading_currency` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `shortname` varchar(3) DEFAULT NULL,
  `longname` varchar(512) DEFAULT NULL,
  `comment` varchar(512) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_choices_licence_sell`
--

DROP TABLE IF EXISTS `mtr_choices_licence_sell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_choices_licence_sell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_license_name` varchar(1024) NOT NULL,
  `hashtag_id` int(11) NOT NULL,
  `mtr_description` varchar(1024) DEFAULT NULL,
  `url_terms` varchar(1024) DEFAULT NULL,
  `visible` bit(1) DEFAULT b'0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_licence_sell_hashtag_id_idx` (`hashtag_id`),
  CONSTRAINT `fk_licence_sell_hashtag_id` FOREIGN KEY (`hashtag_id`) REFERENCES `MTRBack`.`hashtags` (`hashtag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_photo_category_rigths_list`
--

DROP TABLE IF EXISTS `mtr_photo_category_rigths_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_photo_category_rigths_list` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `url_photo_protected` bit(1) DEFAULT b'0',
  `mtr_user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mtr_photo_category_rigths_list_user_idx` (`mtr_user_id`),
  CONSTRAINT `mtr_photo_category_rigths_list_user` FOREIGN KEY (`mtr_user_id`) REFERENCES `MTRUser`.`mtr_users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_photo_choices_sell`
--

DROP TABLE IF EXISTS `mtr_photo_choices_sell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_photo_choices_sell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_id` int(11) NOT NULL,
  `licence_sell_id` int(11) NOT NULL,
  `active` bit(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_key` (`photo_id`,`licence_sell_id`),
  KEY `fk_photo_licence_sell_id_1_idx` (`licence_sell_id`),
  KEY `fk_photo_licence_sell_id_2_idx` (`photo_id`),
  CONSTRAINT `fk_photo_licence_sell_id_1` FOREIGN KEY (`licence_sell_id`) REFERENCES `mtr_choices_licence_sell` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_photo_licence_sell_id_2` FOREIGN KEY (`photo_id`) REFERENCES `MTRUser`.`mtr_photos` (`photo_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=573 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_users_choices_license_sell`
--

DROP TABLE IF EXISTS `mtr_users_choices_license_sell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_users_choices_license_sell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_user_id` int(11) DEFAULT NULL,
  `licence_sell_id` int(11) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_key` (`mtr_user_id`,`licence_sell_id`),
  KEY `mtr_users_choices_license_sell_mtr_user_id_idx` (`mtr_user_id`),
  KEY `mtr_users_choices_license_sell_mtr_lchoices_license_sell_idx` (`licence_sell_id`),
  CONSTRAINT `mtr_users_choices_license_sell_mtr_lchoices_license_sell` FOREIGN KEY (`licence_sell_id`) REFERENCES `mtr_choices_licence_sell` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `mtr_users_choices_license_sell_mtr_user_id` FOREIGN KEY (`mtr_user_id`) REFERENCES `MTRUser`.`mtr_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=681 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_user_id` int(11) DEFAULT NULL,
  `photo_id` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `time_limit` timestamp NULL DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `licence_sell_id` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `offers_unique` (`photo_id`,`licence_sell_id`),
  KEY `offer_trading_mtr_user_id_idx` (`mtr_user_id`),
  KEY `offer_trading_mtr_photo_id_idx` (`photo_id`),
  KEY `offer_trading_currency_idx` (`currency`),
  KEY `offer_trading_licence_idx` (`licence_sell_id`),
  CONSTRAINT `offer_trading_currency` FOREIGN KEY (`currency`) REFERENCES `currencies` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `offer_trading_licence` FOREIGN KEY (`licence_sell_id`) REFERENCES `mtr_choices_licence_sell` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `offer_trading_mtr_photo_id` FOREIGN KEY (`photo_id`) REFERENCES `MTRBack`.`photos` (`photo_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `offer_trading_mtr_user_id` FOREIGN KEY (`mtr_user_id`) REFERENCES `MTRUser`.`mtr_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4784 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trades_unused`
--

DROP TABLE IF EXISTS `trades_unused`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trades_unused` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `photo_id` int(11) DEFAULT NULL,
  `offer_id` int(11) DEFAULT NULL,
  `bid_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trade_offer_id` (`offer_id`),
  KEY `trade_unique` (`bid_id`),
  CONSTRAINT `trade_offer_id` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Current Database: `MTRUser`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `MTRUser` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `MTRUser`;

--
-- Table structure for table `imt_user_relation`
--

DROP TABLE IF EXISTS `imt_user_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imt_user_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  `relation` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id_idx` (`user_id`),
  KEY `fk_place_id_idx` (`place_id`),
  KEY `user_relation` (`user_id`,`relation`),
  CONSTRAINT `fk_place_id` FOREIGN KEY (`place_id`) REFERENCES `IMTMeta`.`imt_places` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `mtr_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `manual_tagging_problem_deprecated`
--

DROP TABLE IF EXISTS `manual_tagging_problem_deprecated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manual_tagging_problem_deprecated` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT 'Will be an hashtag name !',
  `pb_hashtag_id` int(11) NOT NULL COMMENT 'Will be an hashtag id !',
  `hashtag_id_list` varchar(512) NOT NULL COMMENT 'csv list of hashtag_ids',
  `button_legend_list` varchar(512) NOT NULL COMMENT 'csv list of button legend',
  `portfolio_id_lists` varchar(512) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_hahstg_id` (`pb_hashtag_id`),
  UNIQUE KEY `unique_name` (`name`),
  KEY `fk_pb_tagging_hahstag_id` (`pb_hashtag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_access_rights_categories`
--

DROP TABLE IF EXISTS `mtr_access_rights_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_access_rights_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_user_id` int(11) DEFAULT NULL,
  `mtr_photo_right_category` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `search` (`mtr_user_id`,`mtr_photo_right_category`),
  KEY `mtr_access_rights_categories _mtr_photo_category_rigths_lis_idx` (`mtr_photo_right_category`),
  CONSTRAINT `mtr_access_rights_categories _mtr_photo_category_rigths_list` FOREIGN KEY (`mtr_photo_right_category`) REFERENCES `MTRLegal`.`mtr_photo_category_rigths_list` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mtr_access_rights_categories_mtr_users` FOREIGN KEY (`mtr_user_id`) REFERENCES `mtr_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_app_api_token`
--

DROP TABLE IF EXISTS `mtr_app_api_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_app_api_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_user_id` int(11) NOT NULL,
  `token` varchar(45) COLLATE utf8_bin NOT NULL,
  `owner` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `comment` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `expire_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_key_token` (`token`),
  KEY `key_search_expire_at` (`expire_at`,`token`,`id`),
  KEY `mtr_app_api_token_mtr_user_idx` (`mtr_user_id`),
  CONSTRAINT `mtr_app_api_token_mtr_user` FOREIGN KEY (`mtr_user_id`) REFERENCES `mtr_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_fotonower_photos`
--

DROP TABLE IF EXISTS `mtr_fotonower_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_fotonower_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(128) COLLATE utf8_bin NOT NULL,
  `mtr_user_id` int(11) NOT NULL,
  `text` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `content_type` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `heigth` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `uploaded_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_UNIQUE` (`url`),
  KEY `mtr_user_photo_user_id_idx` (`mtr_user_id`),
  CONSTRAINT `mtr_user_photo_user_id` FOREIGN KEY (`mtr_user_id`) REFERENCES `mtr_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2987883 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_live_port_hashtags`
--

DROP TABLE IF EXISTS `mtr_live_port_hashtags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_live_port_hashtags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_user_id` int(11) DEFAULT NULL,
  `mtr_portfolio_matrix_id` int(11) DEFAULT NULL,
  `mtr_classification_theme_id` int(11) DEFAULT NULL,
  `liveport` int(11) DEFAULT NULL,
  `mtr_portfolio_id` int(11) DEFAULT NULL,
  `hashtag_id` int(11) DEFAULT NULL,
  `license_type` int(8) DEFAULT NULL,
  `status` int(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_ mtr_live_port_hashtags_port_mat_class_hashtag` (`mtr_portfolio_matrix_id`,`mtr_classification_theme_id`,`hashtag_id`),
  KEY `search` (`id`,`mtr_user_id`,`liveport`,`mtr_portfolio_id`,`hashtag_id`,`created_at`),
  KEY `mtr_live_port_hashtags_mtr_user_idx` (`mtr_user_id`),
  KEY `mtr_live_port_hashtags_liveport_idx` (`liveport`),
  KEY `mtr_live_port_hashtags_port_idx` (`mtr_portfolio_id`),
  KEY `mtr_live_port_hashtags_hashtag_id_idx` (`hashtag_id`),
  CONSTRAINT `mtr_live_port_hashtags_hashtag_id` FOREIGN KEY (`hashtag_id`) REFERENCES `MTRBack`.`hashtags` (`hashtag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mtr_live_port_hashtags_liveport` FOREIGN KEY (`liveport`) REFERENCES `mtr_live_portfolio_query` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `mtr_live_port_hashtags_mtr_user` FOREIGN KEY (`mtr_user_id`) REFERENCES `mtr_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `mtr_live_port_hashtags_port` FOREIGN KEY (`mtr_portfolio_id`) REFERENCES `mtr_portfolios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37023 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_live_port_record_actions`
--

DROP TABLE IF EXISTS `mtr_live_port_record_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_live_port_record_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_user_id` int(11) DEFAULT NULL,
  `mtr_portfolio_id` int(11) DEFAULT NULL,
  `number_photo_added` int(11) DEFAULT NULL,
  `live_port_id` int(11) DEFAULT NULL,
  `email_sent` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log` mediumtext CHARACTER SET utf8mb4,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mtr_live_port_record_actions_live_port_idx` (`live_port_id`),
  KEY `mtr_live_port_record_actions_mtr_user_id_idx` (`mtr_user_id`),
  KEY `mtr_live_port_record_actions_mtr_portfoloi_id_idx` (`mtr_portfolio_id`),
  CONSTRAINT `mtr_live_port_record_actions_live_port` FOREIGN KEY (`live_port_id`) REFERENCES `mtr_live_portfolio_query` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `mtr_live_port_record_actions_mtr_portfoloi_id` FOREIGN KEY (`mtr_portfolio_id`) REFERENCES `mtr_portfolios` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `mtr_live_port_record_actions_mtr_user_id` FOREIGN KEY (`mtr_user_id`) REFERENCES `mtr_users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22650 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_live_portfolio_query`
--

DROP TABLE IF EXISTS `mtr_live_portfolio_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_live_portfolio_query` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `search_ids` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `query_id` int(11) DEFAULT NULL COMMENT 'maybe we would prefer a list of query...',
  `hashcode` int(11) DEFAULT NULL,
  `period` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `mtr_user_id` int(11) DEFAULT NULL,
  `mtr_portfolio_id` int(11) DEFAULT NULL COMMENT 'not ideal to have an intricate fk constraint',
  `sub_portfolio_id` int(11) DEFAULT NULL COMMENT 'It is unused currently !',
  `limit` int(11) DEFAULT NULL,
  `stopped` bit(1) DEFAULT NULL,
  `order_portfolio_by_time` bit(1) DEFAULT b'0',
  `hashtag_type` int(11) DEFAULT NULL COMMENT 'Used for eventual split, deprecated',
  `filter` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT 'deprecated\n',
  `classification_theme_id` int(11) DEFAULT NULL,
  `license_type` int(11) DEFAULT NULL,
  `hostname` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `visible` bit(1) DEFAULT b'1',
  `start_at` timestamp NULL DEFAULT NULL,
  `end_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ mtr_live_portfolio_query_mtru_user_id_idx` (`mtr_user_id`),
  KEY `fk_mtr_portfolio_id_idx` (`mtr_portfolio_id`),
  KEY `fk_mtr_live_portfolio_query_queryi_id_idx` (`query_id`),
  KEY `mtr_live_portfolio_query_classification_theme_id_idx` (`classification_theme_id`),
  CONSTRAINT `fk_ mtr_live_portfolio_query_mtru_user_id` FOREIGN KEY (`mtr_user_id`) REFERENCES `mtr_users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `fk_mtr_portfolio_id` FOREIGN KEY (`mtr_portfolio_id`) REFERENCES `mtr_portfolios` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `mtr_live_portfolio_query_classification_theme_id` FOREIGN KEY (`classification_theme_id`) REFERENCES `MTRPhoto`.`manual_tagging_problem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24649 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_mailing_list`
--

DROP TABLE IF EXISTS `mtr_mailing_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_mailing_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `first_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `last_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `confirmed` bit(1) DEFAULT NULL,
  `token` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_photo_right_status_roles_users`
--

DROP TABLE IF EXISTS `mtr_photo_right_status_roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_photo_right_status_roles_users` (
  `id` int(11) NOT NULL,
  `mtr_user_id` int(11) DEFAULT NULL,
  `mtr_role_id` int(11) DEFAULT NULL,
  `mtr_photo_right_status_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `search` (`mtr_user_id`,`mtr_role_id`,`mtr_photo_right_status_id`,`id`),
  KEY `mtr_photo_right_status_roles_users_roles_idx` (`mtr_role_id`),
  KEY `mtr_photo_right_status_roles_users_status_idx` (`mtr_photo_right_status_id`),
  CONSTRAINT `mtr_photo_right_status_roles_users_roles` FOREIGN KEY (`mtr_role_id`) REFERENCES `mtr_roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mtr_photo_right_status_roles_users_status` FOREIGN KEY (`mtr_photo_right_status_id`) REFERENCES `MTRBack`.`mtr_photo_right_status_deprecated_112015` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mtr_photo_right_status_roles_users_user_id` FOREIGN KEY (`mtr_user_id`) REFERENCES `mtr_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_photo_submit`
--

DROP TABLE IF EXISTS `mtr_photo_submit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_photo_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_user_id` int(11) DEFAULT NULL,
  `url` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `video` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `hashtags` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `submitted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `search` (`longitude`,`latitude`,`mtr_user_id`,`id`,`submitted_at`),
  KEY `mtr_user_id_photo_submit_fk_idx` (`mtr_user_id`),
  CONSTRAINT `mtr_user_id_photo_submit_fk` FOREIGN KEY (`mtr_user_id`) REFERENCES `mtr_users` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=863667 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_photos`
--

DROP TABLE IF EXISTS `mtr_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_photos` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` varchar(45) NOT NULL,
  `place_id` int(11) NOT NULL,
  `url` varchar(500) NOT NULL,
  `url_small` varchar(500) NOT NULL,
  `url_medium` varchar(500) NOT NULL,
  `timeStamp` datetime DEFAULT NULL,
  `uploaded_at` int(11) DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `is_video` bit(1) DEFAULT NULL,
  `video_low_bandwidth` varchar(500) DEFAULT NULL,
  `video_low_resolution` varchar(500) DEFAULT NULL,
  `video_standard_resolution` varchar(500) DEFAULT NULL,
  `right_categories` int(11) NOT NULL DEFAULT '14',
  `external_user_id` varchar(32) DEFAULT NULL,
  `sourcename` varchar(32) DEFAULT NULL,
  `tags` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'utf8mb4_unicode_ci',
  `nb_comments` int(11) DEFAULT NULL,
  `nb_likes` int(11) DEFAULT NULL,
  `users_in_photo` varchar(128) DEFAULT NULL,
  `caption` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'utf8mb4_unicode_ci',
  `cite_url` varchar(128) DEFAULT NULL,
  `filter` varchar(45) DEFAULT NULL,
  `username` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `profile_picture` varchar(512) DEFAULT NULL,
  `text` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'utf8mb4_unicode_ci',
  `nb_followers` int(11) DEFAULT NULL,
  `nb_followed` int(11) DEFAULT NULL,
  `nb_media` int(11) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `dcreated_at` datetime DEFAULT NULL,
  `dupdated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`photo_id`),
  UNIQUE KEY `secondary` (`sourcename`,`source_id`),
  KEY `place_id_IDX` (`place_id`),
  KEY `photo_id_idx` (`photo_id`),
  KEY `photo_time_idx` (`timeStamp`),
  KEY `photo_id_time_idx` (`photo_id`,`timeStamp`),
  KEY `omb_photo_category_id_idx` (`right_categories`),
  KEY `photo_search_idx` (`latitude`,`longitude`,`place_id`,`timeStamp`,`right_categories`,`photo_id`,`score`,`nb_likes`,`is_video`)
) ENGINE=InnoDB AUTO_INCREMENT=909017612 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_photos_hashtags_users_deprecated`
--

DROP TABLE IF EXISTS `mtr_photos_hashtags_users_deprecated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_photos_hashtags_users_deprecated` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_id` int(11) NOT NULL,
  `hashtag_id` int(11) NOT NULL,
  `mtr_user_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `search` (`photo_id`,`hashtag_id`,`mtr_user_id`,`id`),
  KEY `mtr_photos_hashtags_users_hashtag_idx` (`hashtag_id`),
  KEY `mtr_photos_hashtags_users_mtr_user_idx` (`mtr_user_id`),
  KEY `search_with_date` (`photo_id`,`hashtag_id`,`mtr_user_id`,`created_at`),
  CONSTRAINT `mtr_photos_hashtags_users_hashtag` FOREIGN KEY (`hashtag_id`) REFERENCES `MTRBack`.`hashtags` (`hashtag_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `mtr_photos_hashtags_users_mtr_user` FOREIGN KEY (`mtr_user_id`) REFERENCES `mtr_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `mtr_photos_hashtags_users_photo` FOREIGN KEY (`photo_id`) REFERENCES `MTRBack`.`photos` (`photo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18863 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_port_right_ok`
--

DROP TABLE IF EXISTS `mtr_port_right_ok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_port_right_ok` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_portfolio_matrix_id` int(11) DEFAULT NULL,
  `license_type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `mtr_portfolio_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mtr_port_right_ok_unique` (`mtr_portfolio_matrix_id`,`license_type`),
  KEY `mtr_portfolio_matrix_id` (`mtr_portfolio_matrix_id`),
  KEY `mtr_port_right_ok_mtr_port_idx` (`mtr_portfolio_id`),
  KEY `mtr_port_right_ok_license_idx` (`license_type`),
  KEY `mtr_port_right_ok_search` (`mtr_portfolio_matrix_id`,`license_type`,`status`,`mtr_portfolio_id`,`created_at`,`updated_at`,`id`),
  CONSTRAINT `mtr_port_right_ok_license` FOREIGN KEY (`license_type`) REFERENCES `MTRLegal`.`mtr_license_message` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mtr_port_right_ok_mtr_matrix` FOREIGN KEY (`mtr_portfolio_matrix_id`) REFERENCES `mtr_portfolios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mtr_port_right_ok_mtr_port` FOREIGN KEY (`mtr_portfolio_id`) REFERENCES `mtr_portfolios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_portfolio_photos`
--

DROP TABLE IF EXISTS `mtr_portfolio_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_portfolio_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_portfolio_id` int(11) DEFAULT NULL,
  `mtr_photo_id` int(11) DEFAULT NULL,
  `hide_status` int(11) DEFAULT '0' COMMENT '0 : show\n1 : hidden manually\n2 : hidden automatically (to be implemented)\n\n',
  `display_text` bit(1) DEFAULT b'1',
  `display_hashtag` bit(1) DEFAULT b'1',
  `display_username` bit(1) DEFAULT b'1',
  `order` int(11) DEFAULT NULL,
  `mtr_user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mtr_port_phot_many_to_one` (`mtr_portfolio_id`,`mtr_photo_id`),
  KEY `mtr_portfolio_in_photo_id_idx` (`mtr_photo_id`),
  KEY `search` (`id`,`mtr_portfolio_id`,`mtr_photo_id`,`order`),
  CONSTRAINT `mtr_photo_portfolio_mtruserphotos` FOREIGN KEY (`mtr_photo_id`) REFERENCES `mtr_photos` (`photo_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=69606438 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_portfolio_publisher`
--

DROP TABLE IF EXISTS `mtr_portfolio_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_portfolio_publisher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_portfolio_id` int(11) NOT NULL,
  `mtr_publisher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_ mtr_portfolio_publisher_port_id_publisher_id_unique` (`mtr_portfolio_id`,`mtr_publisher_id`),
  KEY `fk_mtr_portfolio_publisher_fk_idx` (`mtr_portfolio_id`),
  KEY `fk_mtr_portfolio_publisher_mtr_publisher_fk_idx` (`mtr_publisher_id`),
  CONSTRAINT `fk_mtr_portfolio_publisher_mtr_portfolio_fk` FOREIGN KEY (`mtr_portfolio_id`) REFERENCES `mtr_portfolios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mtr_portfolio_publisher_mtr_publisher_fk` FOREIGN KEY (`mtr_publisher_id`) REFERENCES `mtr_publisher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6980 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_portfolio_searchs`
--

DROP TABLE IF EXISTS `mtr_portfolio_searchs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_portfolio_searchs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_portfolio_id` int(11) NOT NULL,
  `mtr_search_id` int(11) NOT NULL,
  `mtr_user_id` int(11) NOT NULL,
  `type` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT 'soft',
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_port_search` (`mtr_portfolio_id`,`mtr_search_id`),
  KEY `fk_mtr_portfolio_searchs_search_id_idx` (`mtr_search_id`),
  KEY `fk_mtr_portfolio_searchs_mtr_portfolio_id_idx` (`mtr_portfolio_id`),
  KEY `fk_mtr_portfolio_searchs_mtr_user_id_idx` (`mtr_user_id`),
  KEY `search_fk_mtr_portfolio_searchs` (`id`,`mtr_portfolio_id`,`mtr_search_id`,`mtr_user_id`,`created_at`),
  CONSTRAINT `fk_mtr_portfolio_searchs_mtr_portfolio_id` FOREIGN KEY (`mtr_portfolio_id`) REFERENCES `mtr_portfolios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mtr_portfolio_searchs_mtr_user_id` FOREIGN KEY (`mtr_user_id`) REFERENCES `mtr_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_mtr_portfolio_searchs_search_id` FOREIGN KEY (`mtr_search_id`) REFERENCES `search_params` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33335 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_portfolio_tags`
--

DROP TABLE IF EXISTS `mtr_portfolio_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_portfolio_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_portfolio_id` int(11) NOT NULL,
  `mtr_tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `search_unique_mtr_portfolio_hashtag_id` (`mtr_portfolio_id`,`mtr_tag_id`),
  KEY `mtr_portfolio_hashtag_ids_fk_mtr_type_idx` (`mtr_tag_id`),
  CONSTRAINT `mtr_portfolio_hashtag_ids_fk_mtr_portfolio_id` FOREIGN KEY (`mtr_portfolio_id`) REFERENCES `mtr_portfolios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4596 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_portfolios`
--

DROP TABLE IF EXISTS `mtr_portfolios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_portfolios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `mtr_user_id` int(11) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `zoom` int(11) DEFAULT NULL,
  `url_to_share` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `nb_photos_per_line` int(11) DEFAULT NULL COMMENT 'to force this number',
  `private` bit(1) NOT NULL DEFAULT b'1',
  `prod` bit(1) DEFAULT b'0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mtr_user_portfolio_name_uq` (`mtr_user_id`,`name`),
  KEY `mtr_portfolio_user_idx` (`mtr_user_id`),
  CONSTRAINT `mtr_portfolio_user` FOREIGN KEY (`mtr_user_id`) REFERENCES `mtr_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=496052 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_publisher`
--

DROP TABLE IF EXISTS `mtr_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_publisher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_request_rights`
--

DROP TABLE IF EXISTS `mtr_request_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_request_rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_user_id` int(11) NOT NULL,
  `mtr_license_type` int(11) DEFAULT NULL,
  `photo_id` int(11) NOT NULL,
  `mtr_portfolio_id` int(11) DEFAULT NULL,
  `comment` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log_instagram` varchar(1024) CHARACTER SET utf8mb4 DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '-1 : home\n0 : pending\n1 : comment send to Instagram\n2 : comment read on Instagram\n3 : accepted\n4 : refused\n5 : cancel\n6 : cart to buy\n7 : photo requested in HD\n8 : comment request not accepted by instagram\n9 : like 1 but with correct comment_id sent by api\n10 : photo requested to buy\n11 : photo bought\n12 : photo bought in hd\n\n',
  `rate_remaining` int(11) DEFAULT NULL,
  `rate_limit` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `currency` int(11) DEFAULT '0',
  `trade_done` bit(1) DEFAULT NULL,
  `lang` varchar(2) CHARACTER SET utf8mb4 DEFAULT 'en' COMMENT 'langue de l''echange',
  `notification_email` bit(1) DEFAULT b'0',
  `commented_at` timestamp NULL DEFAULT NULL COMMENT ' Date a laquelle on a mis la demande',
  `comment_id` bigint(20) unsigned DEFAULT NULL COMMENT ' Identifiant instagram de la demande',
  `screenshot_url` varchar(512) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'url de la preuve de l''echange',
  `answered_at` timestamp NULL DEFAULT NULL COMMENT 'instant ou nous avons constate la reponse',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'derniere date ou les informations de request_right ont ete modifié',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'premiere date ou ces informations ont ete modifies',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mrr_user_license_photo` (`mtr_user_id`,`photo_id`,`mtr_license_type`),
  KEY `mtr_request_rights_photo_id_idx` (`photo_id`),
  KEY `mtr_request_rights_mtr_license_type_idx` (`mtr_license_type`),
  KEY `search` (`mtr_user_id`,`photo_id`,`id`,`mtr_license_type`,`mtr_portfolio_id`,`status`,`price`),
  CONSTRAINT `mtr_request_rights_mtr_license_type` FOREIGN KEY (`mtr_license_type`) REFERENCES `MTRLegal`.`mtr_license_message` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9556 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_roles`
--

DROP TABLE IF EXISTS `mtr_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'admin',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_scheduled_actions_deprecated`
--

DROP TABLE IF EXISTS `mtr_scheduled_actions_deprecated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_scheduled_actions_deprecated` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'VR 25-6-15 :\nNo idea what I add in minds for this !Maybe live_portfolio_query is duplicate.',
  `period` int(11) NOT NULL,
  `start_epoch` timestamp NOT NULL,
  `end_epoch` timestamp NOT NULL,
  `counter` int(11) NOT NULL DEFAULT '0',
  `action_type` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `mtr_user_id` int(11) NOT NULL,
  `mtr_portfolio_id` int(11) DEFAULT NULL,
  `list_requests` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `context` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mtr_scheduled_actions_1_mtr_user_id_idx` (`mtr_user_id`),
  KEY `fk_mtr_scheduled_actions_1_mtr_portfolio_id_idx` (`mtr_portfolio_id`),
  CONSTRAINT `fk_mtr_scheduled_actions_1_mtr_portfolio_id` FOREIGN KEY (`mtr_portfolio_id`) REFERENCES `mtr_portfolios` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_mtr_scheduled_actions_1_mtr_user_id` FOREIGN KEY (`mtr_user_id`) REFERENCES `mtr_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_server_api`
--

DROP TABLE IF EXISTS `mtr_server_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_server_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_user_id` int(11) DEFAULT NULL,
  `server_type` varchar(512) CHARACTER SET utf8mb4 DEFAULT 'velours_desc_svm' COMMENT 'velours_desc_svm\n\n\nphoto_desc_computing\nsvm_tagging for classification\nface_recognition\nvisual search querying\n',
  `param_server` int(11) DEFAULT NULL COMMENT 'classification_theme\n',
  `param_server_host` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '15 would have been ipv4, but for ipv6 needs more maybe\n',
  `param_server_port` int(11) DEFAULT NULL,
  `ipv6` bit(1) DEFAULT b'0',
  `active` bit(1) DEFAULT b'0',
  `process_id` int(11) DEFAULT NULL,
  `last_stop_or_start_at` timestamp NULL DEFAULT NULL,
  `server_launch_log` text CHARACTER SET utf8mb4,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mtr_server_api_mtr_user_idx` (`mtr_user_id`),
  CONSTRAINT `mtr_server_api_mtr_user` FOREIGN KEY (`mtr_user_id`) REFERENCES `mtr_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4489 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_social_photo_to_hd_photos`
--

DROP TABLE IF EXISTS `mtr_social_photo_to_hd_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_social_photo_to_hd_photos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mtr_user_id` int(11) DEFAULT NULL,
  `photo_id` int(11) DEFAULT NULL,
  `hd_photo_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mtr_social_photo_to_hd_photos_mtr_user_id_idx` (`mtr_user_id`),
  KEY `mtr_social_photo_to_hd_photos_photo_id_idx` (`photo_id`),
  KEY `mtr_social_photo_to_hd_photos_fotonower_photo_idx` (`hd_photo_id`),
  KEY `search` (`id`,`mtr_user_id`,`photo_id`,`hd_photo_id`),
  CONSTRAINT `mtr_social_photo_to_hd_photos_fotonower_photo` FOREIGN KEY (`hd_photo_id`) REFERENCES `mtr_photos` (`photo_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `mtr_social_photo_to_hd_photos_mtr_user_id` FOREIGN KEY (`mtr_user_id`) REFERENCES `mtr_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mtr_social_photo_to_hd_photos_photo_id` FOREIGN KEY (`photo_id`) REFERENCES `mtr_photos` (`photo_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_tags`
--

DROP TABLE IF EXISTS `mtr_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_tag` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_tag_mtr_portfolio` (`mtr_tag`)
) ENGINE=InnoDB AUTO_INCREMENT=3133 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_token_actions`
--

DROP TABLE IF EXISTS `mtr_token_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_token_actions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mtr_user_id` int(11) DEFAULT NULL,
  `email_sent_to` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_action` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'associate_to_account\nportfolio_access\nrights_category_access\n',
  `comment` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect_url` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `param_long` int(11) DEFAULT NULL,
  `used` bit(1) DEFAULT NULL,
  `valid_until` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mtr_token_actions_mtr_user_id_idx` (`mtr_user_id`),
  KEY `search` (`valid_until`,`used`,`type_action`,`mtr_user_id`,`id`),
  CONSTRAINT `mtr_token_actions_mtr_user_id` FOREIGN KEY (`mtr_user_id`) REFERENCES `mtr_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_user_action_types`
--

DROP TABLE IF EXISTS `mtr_user_action_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_user_action_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_user_actions`
--

DROP TABLE IF EXISTS `mtr_user_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_user_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL,
  `context` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `comment_resolution` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `endpoint` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `ip_salted` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `solved` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `fk_mtr_user_action_mtr_user_idx` (`mtr_user_id`),
  KEY `fk_mtr_user_actino_type_idx` (`type`),
  KEY `fk_search_mtr_user_action` (`mtr_user_id`,`timestamp`,`type`,`solved`,`id`),
  CONSTRAINT `fk_mtr_user_Action_mtr_user` FOREIGN KEY (`mtr_user_id`) REFERENCES `mtr_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_mtr_user_actino_type` FOREIGN KEY (`type`) REFERENCES `mtr_user_action_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=66028 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_user_pb_photo_label`
--

DROP TABLE IF EXISTS `mtr_user_pb_photo_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_user_pb_photo_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_user_id` int(11) NOT NULL,
  `pb_hashtag_id` int(11) NOT NULL,
  `photo_id` int(11) NOT NULL,
  `hashtag_id` int(11) NOT NULL COMMENT '9 :   send for tagging \n, 10 : to be tagged (sans doute pas utilise dans cette table)\n0,1,2 : tag set from problem or just :\n11 : label by human \nor it will be an hashtag',
  `updated_at` timestamp NOT NULL,
  `created_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mtr_user_pb_photo_label_pb_tagging_unique_tag` (`mtr_user_id`,`pb_hashtag_id`,`photo_id`),
  KEY `mtr_user_pb_photo_label_user_idx` (`mtr_user_id`),
  KEY `mtr_user_pb_photo_label_pb_tagging_idx` (`pb_hashtag_id`),
  KEY `mtr_user_pb_photo_label_pb_photo_idx` (`photo_id`),
  KEY `search` (`id`,`mtr_user_id`,`pb_hashtag_id`,`photo_id`,`hashtag_id`,`created_at`,`updated_at`),
  KEY `mtr_user_pb_photo_label_hashtag_id_idx` (`hashtag_id`),
  CONSTRAINT `mtr_user_pb_photo_label_hashtag_id` FOREIGN KEY (`hashtag_id`) REFERENCES `MTRBack`.`hashtags` (`hashtag_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `mtr_user_pb_photo_label_pb_photo` FOREIGN KEY (`photo_id`) REFERENCES `MTRBack`.`photos` (`photo_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `mtr_user_pb_photo_label_user` FOREIGN KEY (`mtr_user_id`) REFERENCES `mtr_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=255374 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_user_publisher`
--

DROP TABLE IF EXISTS `mtr_user_publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_user_publisher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_user_id` int(11) NOT NULL,
  `mtr_publisher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mtr_user_publisher_fk_idx` (`mtr_user_id`),
  KEY `fk_mtr_user_publisher_mtr_publisher_fk_idx` (`mtr_publisher_id`),
  CONSTRAINT `fk_mtr_user_publisher_mtr_publisher_fk` FOREIGN KEY (`mtr_publisher_id`) REFERENCES `mtr_publisher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mtr_user_publisher_mtr_user_fk` FOREIGN KEY (`mtr_user_id`) REFERENCES `mtr_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=679 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_user_roles`
--

DROP TABLE IF EXISTS `mtr_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_user_id` int(11) DEFAULT NULL,
  `mtr_role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_record` (`mtr_user_id`,`mtr_role_id`),
  KEY `mtr_user_roles_mtr_roles_id_idx` (`mtr_role_id`),
  CONSTRAINT `mtr_user_roles_mtr_roles_id` FOREIGN KEY (`mtr_role_id`) REFERENCES `mtr_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_user_tagged_photos`
--

DROP TABLE IF EXISTS `mtr_user_tagged_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_user_tagged_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_id` int(11) NOT NULL,
  `mtr_user_id` int(11) NOT NULL,
  `ip_salted` varchar(45) COLLATE utf8_bin NOT NULL,
  `photo_tag_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_photo_id_idx` (`photo_id`),
  KEY `fk_mtr_user_id_idx` (`mtr_user_id`),
  KEY `fk_photo_tag_id_ut_idx` (`photo_tag_id`),
  CONSTRAINT `fk_mtr_user_id_ut` FOREIGN KEY (`mtr_user_id`) REFERENCES `mtr_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_photo_tag_id_ut` FOREIGN KEY (`photo_tag_id`) REFERENCES `MTRBack`.`mtr_photo_categories_deprecated_112015` (`mtr_photo_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40576931 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_user_tags`
--

DROP TABLE IF EXISTS `mtr_user_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_user_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_user_id` int(11) NOT NULL,
  `mtr_tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mtr_user_tags_fk_idx` (`mtr_user_id`),
  KEY `fk_mtr_user_tags_mtr_tags_fk_idx` (`mtr_tag_id`),
  CONSTRAINT `fk_mtr_user_tags_mtr_tags_fk` FOREIGN KEY (`mtr_tag_id`) REFERENCES `mtr_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mtr_user_tags_mtr_user_fk` FOREIGN KEY (`mtr_user_id`) REFERENCES `mtr_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_users`
--

DROP TABLE IF EXISTS `mtr_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `first_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `last_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `width_iframe` int(11) DEFAULT NULL,
  `receive_email_search` bit(1) DEFAULT b'1',
  `retrieve_back` bit(1) DEFAULT b'0',
  `rerun_query` bit(1) DEFAULT b'1',
  `priority` int(11) DEFAULT '0' COMMENT 'used to force run despite loadavarege : when 0, unused, 3 usual 10 : should be enough',
  `main_pb_tagging` int(11) DEFAULT '59',
  `default_license_type` int(11) DEFAULT '0',
  `receive_email_liveport` bit(1) DEFAULT b'1',
  `publisher_id` int(11) DEFAULT NULL,
  `technical_referent_id` int(11) NOT NULL DEFAULT '31',
  `photo_right_category` int(11) DEFAULT NULL,
  `upload_photo_status_public_or_right_category` bit(1) DEFAULT NULL,
  `sell_photos` bit(1) DEFAULT NULL,
  `sell_photo_with_hashtags` bit(1) DEFAULT NULL,
  `sell_photos_uploaded` bit(1) DEFAULT NULL,
  `hashtag_sell_photo_with_hashtags` varchar(128) COLLATE utf8_bin DEFAULT '#ilovebazarphoto',
  `self_recommandation_learning` bit(1) DEFAULT b'1',
  `compute_classification` bit(1) DEFAULT b'0',
  `visual_search` bit(1) DEFAULT b'0',
  `default_photo_desc_type` int(11) DEFAULT '1633' COMMENT 'For visual query',
  `upload_photo_private` bit(1) DEFAULT b'0',
  `template_live_portfolio` int(11) DEFAULT NULL,
  `quota_comment_per_hour` int(11) DEFAULT '1',
  `classification_actions` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `validation_code` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `default_price_sell` double DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `seller_buyer` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `email_uq` (`email`),
  KEY `technical_referent_idx` (`technical_referent_id`),
  KEY `mtr_users_main_pb_tagging_id_idx` (`main_pb_tagging`),
  KEY `mtr_users _mtr_photo_category_rigths_list_idx` (`photo_right_category`),
  KEY `mtr_users_template_live_port_idx` (`template_live_portfolio`),
  CONSTRAINT `mtr_users _mtr_photo_category_rigths_list` FOREIGN KEY (`photo_right_category`) REFERENCES `MTRLegal`.`mtr_photo_category_rigths_list` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mtr_users_main_tagging_pb` FOREIGN KEY (`main_pb_tagging`) REFERENCES `MTRPhoto`.`manual_tagging_problem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `mtr_users_template_live_port` FOREIGN KEY (`template_live_portfolio`) REFERENCES `mtr_live_portfolio_query` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `technical_referent` FOREIGN KEY (`technical_referent_id`) REFERENCES `mtr_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=643 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_valid_contacts`
--

DROP TABLE IF EXISTS `mtr_valid_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_valid_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_user_id` int(11) DEFAULT NULL,
  `contact_type` bit(1) DEFAULT NULL COMMENT '0 : email\n1: tel',
  `contact` varchar(128) DEFAULT NULL COMMENT 'email ou tel',
  `validation_code` varchar(128) DEFAULT NULL,
  `valid` bit(1) DEFAULT b'0',
  `active` bit(1) DEFAULT b'1',
  `validated_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_valid_contact` (`mtr_user_id`,`contact_type`,`contact`),
  KEY `mtr_valid_contacts_mtr_user_id_idx` (`mtr_user_id`),
  KEY `all` (`id`,`mtr_user_id`,`contact_type`,`contact`,`validation_code`,`valid`,`validated_at`,`updated_at`,`created_at`,`active`),
  CONSTRAINT `mtr_valid_contacts_mtr_user_id` FOREIGN KEY (`mtr_user_id`) REFERENCES `mtr_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mtr_visual_search_io`
--

DROP TABLE IF EXISTS `mtr_visual_search_io`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mtr_visual_search_io` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_user_id` int(11) NOT NULL,
  `photo_id` bigint(20) DEFAULT NULL,
  `hash` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  `mtr_portfolio_id` int(11) DEFAULT NULL,
  `type_query` varchar(64) COLLATE utf8_bin DEFAULT 'query',
  `photo_desc_type` int(11) DEFAULT '2',
  `folder` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `answer` mediumtext COLLATE utf8_bin,
  `port` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mtr_visual_search_io_mtr_user_id_idx` (`mtr_user_id`),
  CONSTRAINT `mtr_visual_search_io_mtr_user_id` FOREIGN KEY (`mtr_user_id`) REFERENCES `mtr_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=114015 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `token` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `txn_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `ipn` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=442 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `search_params`
--

DROP TABLE IF EXISTS `search_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_params` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_user_id` int(11) DEFAULT NULL,
  `min_time` timestamp NULL DEFAULT NULL,
  `max_time` timestamp NULL DEFAULT NULL,
  `hashtags` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `hashtag_formal_query` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `userid` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'deprecated',
  `min_latitude` double DEFAULT NULL,
  `max_latitude` double DEFAULT NULL,
  `min_longitude` double DEFAULT NULL,
  `max_longitude` double DEFAULT NULL,
  `min_nb_likes` int(11) DEFAULT NULL,
  `order_by` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `hashtag_type` int(11) DEFAULT NULL,
  `use_index` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `db` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `info` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  `license` int(11) NOT NULL DEFAULT '0',
  `offset` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `query_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118148 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `social_users`
--

DROP TABLE IF EXISTS `social_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mtr_user_id` int(11) DEFAULT NULL,
  `social_user_id` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `provider` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `first_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `last_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `avatar_url` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `auth_method` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `oauth_id` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `oauth_secret` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `password_info` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_provider` (`social_user_id`,`provider`),
  KEY `social_user_id` (`provider`,`social_user_id`),
  KEY `mtr_user_id_idx` (`mtr_user_id`),
  CONSTRAINT `mtr_user_id` FOREIGN KEY (`mtr_user_id`) REFERENCES `mtr_users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4801 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-27 19:11:47

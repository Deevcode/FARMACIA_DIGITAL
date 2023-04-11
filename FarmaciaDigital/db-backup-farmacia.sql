-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: devcode03.mysql.pythonanywhere-services.com    Database: DevCode03$farmacia
-- ------------------------------------------------------
-- Server version	5.7.41-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_interface_theme`
--

DROP TABLE IF EXISTS `admin_interface_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_interface_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_visible` tinyint(1) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `logo_visible` tinyint(1) NOT NULL,
  `css_header_background_color` varchar(10) NOT NULL,
  `title_color` varchar(10) NOT NULL,
  `css_header_text_color` varchar(10) NOT NULL,
  `css_header_link_color` varchar(10) NOT NULL,
  `css_header_link_hover_color` varchar(10) NOT NULL,
  `css_module_background_color` varchar(10) NOT NULL,
  `css_module_text_color` varchar(10) NOT NULL,
  `css_module_link_color` varchar(10) NOT NULL,
  `css_module_link_hover_color` varchar(10) NOT NULL,
  `css_module_rounded_corners` tinyint(1) NOT NULL,
  `css_generic_link_color` varchar(10) NOT NULL,
  `css_generic_link_hover_color` varchar(10) NOT NULL,
  `css_save_button_background_color` varchar(10) NOT NULL,
  `css_save_button_background_hover_color` varchar(10) NOT NULL,
  `css_save_button_text_color` varchar(10) NOT NULL,
  `css_delete_button_background_color` varchar(10) NOT NULL,
  `css_delete_button_background_hover_color` varchar(10) NOT NULL,
  `css_delete_button_text_color` varchar(10) NOT NULL,
  `list_filter_dropdown` tinyint(1) NOT NULL,
  `related_modal_active` tinyint(1) NOT NULL,
  `related_modal_background_color` varchar(10) NOT NULL,
  `related_modal_rounded_corners` tinyint(1) NOT NULL,
  `logo_color` varchar(10) NOT NULL,
  `recent_actions_visible` tinyint(1) NOT NULL,
  `favicon` varchar(100) NOT NULL,
  `related_modal_background_opacity` varchar(5) NOT NULL,
  `env_name` varchar(50) NOT NULL,
  `env_visible_in_header` tinyint(1) NOT NULL,
  `env_color` varchar(10) NOT NULL,
  `env_visible_in_favicon` tinyint(1) NOT NULL,
  `related_modal_close_button_visible` tinyint(1) NOT NULL,
  `language_chooser_active` tinyint(1) NOT NULL,
  `language_chooser_display` varchar(10) NOT NULL,
  `list_filter_sticky` tinyint(1) NOT NULL,
  `form_pagination_sticky` tinyint(1) NOT NULL,
  `form_submit_sticky` tinyint(1) NOT NULL,
  `css_module_background_selected_color` varchar(10) NOT NULL,
  `css_module_link_selected_color` varchar(10) NOT NULL,
  `logo_max_height` smallint(5) unsigned NOT NULL,
  `logo_max_width` smallint(5) unsigned NOT NULL,
  `foldable_apps` tinyint(1) NOT NULL,
  `language_chooser_control` varchar(20) NOT NULL,
  `list_filter_highlight` tinyint(1) NOT NULL,
  `list_filter_removal_links` tinyint(1) NOT NULL,
  `show_fieldsets_as_tabs` tinyint(1) NOT NULL,
  `show_inlines_as_tabs` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_interface_theme_name_30bda70f_uniq` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_interface_theme`
--

LOCK TABLES `admin_interface_theme` WRITE;
/*!40000 ALTER TABLE `admin_interface_theme` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_interface_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_cesfam`
--

DROP TABLE IF EXISTS `app_cesfam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_cesfam` (
  `id_cesfam` int(11) NOT NULL AUTO_INCREMENT,
  `email_CESFAM` varchar(200) NOT NULL,
  `telefono_CESFAM` varchar(200) NOT NULL,
  `direccion_CESFAM` varchar(200) NOT NULL,
  `identificacion_cesfam_id` bigint(20) DEFAULT NULL,
  `nombre_comuna_id` int(11) NOT NULL,
  PRIMARY KEY (`id_cesfam`),
  KEY `app_cesfam_nombre_comuna_id_5f513795_fk_app_comuna_id_comuna` (`nombre_comuna_id`),
  KEY `app_cesfam_identificacion_cesfam_id_75f1cdca_fk_app_usuario_id` (`identificacion_cesfam_id`),
  CONSTRAINT `app_cesfam_identificacion_cesfam_id_75f1cdca_fk_app_usuario_id` FOREIGN KEY (`identificacion_cesfam_id`) REFERENCES `app_usuario` (`id`),
  CONSTRAINT `app_cesfam_nombre_comuna_id_5f513795_fk_app_comuna_id_comuna` FOREIGN KEY (`nombre_comuna_id`) REFERENCES `app_comuna` (`id_comuna`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_cesfam`
--

LOCK TABLES `app_cesfam` WRITE;
/*!40000 ALTER TABLE `app_cesfam` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_cesfam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_comuna`
--

DROP TABLE IF EXISTS `app_comuna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_comuna` (
  `id_comuna` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_comuna` varchar(100) NOT NULL,
  `id_provincia_id` int(11) NOT NULL,
  PRIMARY KEY (`id_comuna`),
  KEY `app_comuna_id_provincia_id_160794d3_fk_app_provi` (`id_provincia_id`),
  CONSTRAINT `app_comuna_id_provincia_id_160794d3_fk_app_provi` FOREIGN KEY (`id_provincia_id`) REFERENCES `app_provincia` (`id_provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_comuna`
--

LOCK TABLES `app_comuna` WRITE;
/*!40000 ALTER TABLE `app_comuna` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_comuna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_contacto`
--

DROP TABLE IF EXISTS `app_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_contacto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `tipo_consulta` int(11) DEFAULT NULL,
  `timestamp` varchar(100) NOT NULL,
  `mensaje` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_contacto`
--

LOCK TABLES `app_contacto` WRITE;
/*!40000 ALTER TABLE `app_contacto` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_enfermera`
--

DROP TABLE IF EXISTS `app_enfermera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_enfermera` (
  `id_enfermera` int(11) NOT NULL AUTO_INCREMENT,
  `identificacion_enfermera_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_enfermera`),
  KEY `app_enfermera_identificacion_enfer_bcc05ba8_fk_app_usuar` (`identificacion_enfermera_id`),
  CONSTRAINT `app_enfermera_identificacion_enfer_bcc05ba8_fk_app_usuar` FOREIGN KEY (`identificacion_enfermera_id`) REFERENCES `app_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_enfermera`
--

LOCK TABLES `app_enfermera` WRITE;
/*!40000 ALTER TABLE `app_enfermera` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_enfermera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_familiarpacienteusuario`
--

DROP TABLE IF EXISTS `app_familiarpacienteusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_familiarpacienteusuario` (
  `id_familiar_paciente` int(11) NOT NULL AUTO_INCREMENT,
  `identificacion_familiar_paciente_id` int(11) DEFAULT NULL,
  `nombres_usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id_familiar_paciente`),
  KEY `app_familiarpaciente_identificacion_famil_12681ded_fk_app_pacie` (`identificacion_familiar_paciente_id`),
  KEY `app_familiarpaciente_nombres_usuario_id_300fc968_fk_app_usuar` (`nombres_usuario_id`),
  CONSTRAINT `app_familiarpaciente_identificacion_famil_12681ded_fk_app_pacie` FOREIGN KEY (`identificacion_familiar_paciente_id`) REFERENCES `app_pacientefamiliar` (`id_usuario_familiar`),
  CONSTRAINT `app_familiarpaciente_nombres_usuario_id_300fc968_fk_app_usuar` FOREIGN KEY (`nombres_usuario_id`) REFERENCES `app_usuarioficha` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_familiarpacienteusuario`
--

LOCK TABLES `app_familiarpacienteusuario` WRITE;
/*!40000 ALTER TABLE `app_familiarpacienteusuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_familiarpacienteusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farmacia`
--

DROP TABLE IF EXISTS `app_farmacia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_farmacia` (
  `id_farmacia` int(11) NOT NULL AUTO_INCREMENT,
  `marca_farmacia` varchar(200) NOT NULL,
  PRIMARY KEY (`id_farmacia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farmacia`
--

LOCK TABLES `app_farmacia` WRITE;
/*!40000 ALTER TABLE `app_farmacia` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_farmacia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farmaciacesfam`
--

DROP TABLE IF EXISTS `app_farmaciacesfam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_farmaciacesfam` (
  `id_farmacia_CESFAM` int(11) NOT NULL AUTO_INCREMENT,
  `identificacion_cesfam_id` int(11) NOT NULL,
  PRIMARY KEY (`id_farmacia_CESFAM`),
  KEY `app_farmaciacesfam_identificacion_cesfa_838a7056_fk_app_cesfa` (`identificacion_cesfam_id`),
  CONSTRAINT `app_farmaciacesfam_identificacion_cesfa_838a7056_fk_app_cesfa` FOREIGN KEY (`identificacion_cesfam_id`) REFERENCES `app_cesfam` (`id_cesfam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farmaciacesfam`
--

LOCK TABLES `app_farmaciacesfam` WRITE;
/*!40000 ALTER TABLE `app_farmaciacesfam` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_farmaciacesfam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_farmaciasucursal`
--

DROP TABLE IF EXISTS `app_farmaciasucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_farmaciasucursal` (
  `id_sucursal` int(11) NOT NULL AUTO_INCREMENT,
  `direccion_sucursal` varchar(200) NOT NULL,
  `telefono_sucursal` int(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `id_quimico_farmaceutio_id` int(11) NOT NULL,
  `nombre_comuna_id` int(11) NOT NULL,
  `nombre_farmacia_id` int(11) NOT NULL,
  PRIMARY KEY (`id_sucursal`),
  KEY `app_farmaciasucursal_id_quimico_farmaceut_ea6b3740_fk_app_quimi` (`id_quimico_farmaceutio_id`),
  KEY `app_farmaciasucursal_nombre_comuna_id_59b54452_fk_app_comun` (`nombre_comuna_id`),
  KEY `app_farmaciasucursal_nombre_farmacia_id_3760d06c_fk_app_farma` (`nombre_farmacia_id`),
  CONSTRAINT `app_farmaciasucursal_id_quimico_farmaceut_ea6b3740_fk_app_quimi` FOREIGN KEY (`id_quimico_farmaceutio_id`) REFERENCES `app_quimicofarmaceuticoencargado` (`id_quimico_farmaceutio`),
  CONSTRAINT `app_farmaciasucursal_nombre_comuna_id_59b54452_fk_app_comun` FOREIGN KEY (`nombre_comuna_id`) REFERENCES `app_comuna` (`id_comuna`),
  CONSTRAINT `app_farmaciasucursal_nombre_farmacia_id_3760d06c_fk_app_farma` FOREIGN KEY (`nombre_farmacia_id`) REFERENCES `app_farmacia` (`id_farmacia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_farmaciasucursal`
--

LOCK TABLES `app_farmaciasucursal` WRITE;
/*!40000 ALTER TABLE `app_farmaciasucursal` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_farmaciasucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_laboratorio`
--

DROP TABLE IF EXISTS `app_laboratorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_laboratorio` (
  `id_laboratorio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_laboratorio` varchar(100) NOT NULL,
  PRIMARY KEY (`id_laboratorio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_laboratorio`
--

LOCK TABLES `app_laboratorio` WRITE;
/*!40000 ALTER TABLE `app_laboratorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_laboratorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_medicamentofichatecnica`
--

DROP TABLE IF EXISTS `app_medicamentofichatecnica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_medicamentofichatecnica` (
  `id_ficha_medicamento` int(11) NOT NULL AUTO_INCREMENT,
  `url_ficha` varchar(700) NOT NULL,
  `laboratorio_ficha_id` int(11) NOT NULL,
  `nombre_comercial_id` int(11) NOT NULL,
  PRIMARY KEY (`id_ficha_medicamento`),
  KEY `app_medicamentoficha_laboratorio_ficha_id_fbffbdb4_fk_app_labor` (`laboratorio_ficha_id`),
  KEY `app_medicamentoficha_nombre_comercial_id_23f2a22b_fk_app_medic` (`nombre_comercial_id`),
  CONSTRAINT `app_medicamentoficha_laboratorio_ficha_id_fbffbdb4_fk_app_labor` FOREIGN KEY (`laboratorio_ficha_id`) REFERENCES `app_laboratorio` (`id_laboratorio`),
  CONSTRAINT `app_medicamentoficha_nombre_comercial_id_23f2a22b_fk_app_medic` FOREIGN KEY (`nombre_comercial_id`) REFERENCES `app_medicamentos` (`id_medicamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_medicamentofichatecnica`
--

LOCK TABLES `app_medicamentofichatecnica` WRITE;
/*!40000 ALTER TABLE `app_medicamentofichatecnica` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_medicamentofichatecnica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_medicamentos`
--

DROP TABLE IF EXISTS `app_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_medicamentos` (
  `id_medicamento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_comercial` varchar(100) NOT NULL,
  `gramaje` varchar(50) NOT NULL,
  `cantidad_stock` int(11) NOT NULL,
  `presentacion_medicamento` varchar(100) NOT NULL,
  `id_laboratorio_id` int(11) NOT NULL,
  `id_principio_activo_id` int(11) NOT NULL,
  `id_via_administracion_id` int(11) NOT NULL,
  PRIMARY KEY (`id_medicamento`),
  KEY `app_medicamentos_id_principio_activo__14113581_fk_app_princ` (`id_principio_activo_id`),
  KEY `app_medicamentos_id_via_administracio_4ca8523e_fk_app_viaad` (`id_via_administracion_id`),
  KEY `app_medicamentos_id_laboratorio_id_4a33a7ca_fk_app_labor` (`id_laboratorio_id`),
  CONSTRAINT `app_medicamentos_id_laboratorio_id_4a33a7ca_fk_app_labor` FOREIGN KEY (`id_laboratorio_id`) REFERENCES `app_laboratorio` (`id_laboratorio`),
  CONSTRAINT `app_medicamentos_id_principio_activo__14113581_fk_app_princ` FOREIGN KEY (`id_principio_activo_id`) REFERENCES `app_principioactivo` (`id_principio_activo`),
  CONSTRAINT `app_medicamentos_id_via_administracio_4ca8523e_fk_app_viaad` FOREIGN KEY (`id_via_administracion_id`) REFERENCES `app_viaadminstracion` (`id_via_administracion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_medicamentos`
--

LOCK TABLES `app_medicamentos` WRITE;
/*!40000 ALTER TABLE `app_medicamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_medicamentosdescuento`
--

DROP TABLE IF EXISTS `app_medicamentosdescuento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_medicamentosdescuento` (
  `id_descuento` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicio_descuento` date NOT NULL,
  `fecha_termino_descuento` date NOT NULL,
  `descuento_porcentaje` int(11) NOT NULL,
  `id_farmacia_id` int(11) NOT NULL,
  `medicamento_desc_id` int(11) NOT NULL,
  PRIMARY KEY (`id_descuento`),
  KEY `app_medicamentosdesc_id_farmacia_id_ba344921_fk_app_farma` (`id_farmacia_id`),
  KEY `app_medicamentosdesc_medicamento_desc_id_44488fa5_fk_app_medic` (`medicamento_desc_id`),
  CONSTRAINT `app_medicamentosdesc_id_farmacia_id_ba344921_fk_app_farma` FOREIGN KEY (`id_farmacia_id`) REFERENCES `app_farmacia` (`id_farmacia`),
  CONSTRAINT `app_medicamentosdesc_medicamento_desc_id_44488fa5_fk_app_medic` FOREIGN KEY (`medicamento_desc_id`) REFERENCES `app_medicamentos` (`id_medicamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_medicamentosdescuento`
--

LOCK TABLES `app_medicamentosdescuento` WRITE;
/*!40000 ALTER TABLE `app_medicamentosdescuento` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_medicamentosdescuento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_pacientefamiliar`
--

DROP TABLE IF EXISTS `app_pacientefamiliar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_pacientefamiliar` (
  `id_usuario_familiar` int(11) NOT NULL AUTO_INCREMENT,
  `parentesco` varchar(100) NOT NULL,
  `identificacion_familiar_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuario_familiar`),
  KEY `app_pacientefamiliar_identificacion_famil_e2132d77_fk_app_usuar` (`identificacion_familiar_id`),
  CONSTRAINT `app_pacientefamiliar_identificacion_famil_e2132d77_fk_app_usuar` FOREIGN KEY (`identificacion_familiar_id`) REFERENCES `app_usuarioficha` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_pacientefamiliar`
--

LOCK TABLES `app_pacientefamiliar` WRITE;
/*!40000 ALTER TABLE `app_pacientefamiliar` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_pacientefamiliar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_pacientefichaclinica`
--

DROP TABLE IF EXISTS `app_pacientefichaclinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_pacientefichaclinica` (
  `id_paciente_ficha` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_diabetes` int(11) DEFAULT NULL,
  `tipo_hipertension` int(11) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `identificacion_paciente_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id_paciente_ficha`),
  KEY `app_pacientefichacli_identificacion_pacie_f95dfd7b_fk_app_usuar` (`identificacion_paciente_id`),
  CONSTRAINT `app_pacientefichacli_identificacion_pacie_f95dfd7b_fk_app_usuar` FOREIGN KEY (`identificacion_paciente_id`) REFERENCES `app_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_pacientefichaclinica`
--

LOCK TABLES `app_pacientefichaclinica` WRITE;
/*!40000 ALTER TABLE `app_pacientefichaclinica` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_pacientefichaclinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_pacientereceta`
--

DROP TABLE IF EXISTS `app_pacientereceta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_pacientereceta` (
  `id_receta_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_receta` date NOT NULL,
  `tiempo_tratamiento_dias` varchar(100) NOT NULL,
  `frecuencia_dosis_diaria` varchar(100) NOT NULL,
  `horario_1` time(6) DEFAULT NULL,
  `fracionamiento_1` int(11) DEFAULT NULL,
  `horario_2` time(6) DEFAULT NULL,
  `fracionamiento_2` int(11) DEFAULT NULL,
  `horario_3` time(6) DEFAULT NULL,
  `fracionamiento_3` int(11) DEFAULT NULL,
  `horario_4` time(6) DEFAULT NULL,
  `fracionamiento_4` int(11) DEFAULT NULL,
  `horario_5` time(6) DEFAULT NULL,
  `fracionamiento_5` int(11) DEFAULT NULL,
  `horario_6` time(6) DEFAULT NULL,
  `fracionamiento_6` int(11) DEFAULT NULL,
  `descripcion` longtext NOT NULL,
  `nombre_comercial_id` int(11) DEFAULT NULL,
  `nombres_paciente_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_receta_usuario`),
  KEY `app_pacientereceta_nombre_comercial_id_7806ab36_fk_app_medic` (`nombre_comercial_id`),
  KEY `app_pacientereceta_nombres_paciente_id_70d2bbbc_fk_app_usuar` (`nombres_paciente_id`),
  CONSTRAINT `app_pacientereceta_nombre_comercial_id_7806ab36_fk_app_medic` FOREIGN KEY (`nombre_comercial_id`) REFERENCES `app_medicamentos` (`id_medicamento`),
  CONSTRAINT `app_pacientereceta_nombres_paciente_id_70d2bbbc_fk_app_usuar` FOREIGN KEY (`nombres_paciente_id`) REFERENCES `app_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_pacientereceta`
--

LOCK TABLES `app_pacientereceta` WRITE;
/*!40000 ALTER TABLE `app_pacientereceta` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_pacientereceta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_principioactivo`
--

DROP TABLE IF EXISTS `app_principioactivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_principioactivo` (
  `id_principio_activo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_princio_activo` varchar(100) NOT NULL,
  PRIMARY KEY (`id_principio_activo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_principioactivo`
--

LOCK TABLES `app_principioactivo` WRITE;
/*!40000 ALTER TABLE `app_principioactivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_principioactivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_profesionalpaciente`
--

DROP TABLE IF EXISTS `app_profesionalpaciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_profesionalpaciente` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ficha_clinica_paciente_id` int(11) DEFAULT NULL,
  `identificacicion_usuario_id` bigint(20) DEFAULT NULL,
  `identificacion_profesional_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `app_profesionalpacie_ficha_clinica_pacien_ed52ab48_fk_app_pacie` (`ficha_clinica_paciente_id`),
  KEY `app_profesionalpacie_identificacicion_usu_9823bdda_fk_app_usuar` (`identificacicion_usuario_id`),
  KEY `app_profesionalpacie_identificacion_profe_65009ba3_fk_app_usuar` (`identificacion_profesional_id`),
  CONSTRAINT `app_profesionalpacie_ficha_clinica_pacien_ed52ab48_fk_app_pacie` FOREIGN KEY (`ficha_clinica_paciente_id`) REFERENCES `app_pacientefichaclinica` (`id_paciente_ficha`),
  CONSTRAINT `app_profesionalpacie_identificacicion_usu_9823bdda_fk_app_usuar` FOREIGN KEY (`identificacicion_usuario_id`) REFERENCES `app_usuario` (`id`),
  CONSTRAINT `app_profesionalpacie_identificacion_profe_65009ba3_fk_app_usuar` FOREIGN KEY (`identificacion_profesional_id`) REFERENCES `app_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_profesionalpaciente`
--

LOCK TABLES `app_profesionalpaciente` WRITE;
/*!40000 ALTER TABLE `app_profesionalpaciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_profesionalpaciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_provincia`
--

DROP TABLE IF EXISTS `app_provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_provincia` (
  `id_provincia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_provincia` varchar(100) NOT NULL,
  `id_region_id` int(11) NOT NULL,
  PRIMARY KEY (`id_provincia`),
  KEY `app_provincia_id_region_id_82ac5e48_fk_app_region_id_region` (`id_region_id`),
  CONSTRAINT `app_provincia_id_region_id_82ac5e48_fk_app_region_id_region` FOREIGN KEY (`id_region_id`) REFERENCES `app_region` (`id_region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_provincia`
--

LOCK TABLES `app_provincia` WRITE;
/*!40000 ALTER TABLE `app_provincia` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_quimicofarmaceuticoencargado`
--

DROP TABLE IF EXISTS `app_quimicofarmaceuticoencargado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_quimicofarmaceuticoencargado` (
  `id_quimico_farmaceutio` int(11) NOT NULL AUTO_INCREMENT,
  `registro_sanitario_QF` varchar(200) NOT NULL,
  `identificacion_QF_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_quimico_farmaceutio`),
  KEY `app_quimicofarmaceut_identificacion_QF_id_88ccaaab_fk_app_usuar` (`identificacion_QF_id`),
  CONSTRAINT `app_quimicofarmaceut_identificacion_QF_id_88ccaaab_fk_app_usuar` FOREIGN KEY (`identificacion_QF_id`) REFERENCES `app_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_quimicofarmaceuticoencargado`
--

LOCK TABLES `app_quimicofarmaceuticoencargado` WRITE;
/*!40000 ALTER TABLE `app_quimicofarmaceuticoencargado` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_quimicofarmaceuticoencargado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_region`
--

DROP TABLE IF EXISTS `app_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_region` (
  `id_region` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_region` varchar(45) NOT NULL,
  PRIMARY KEY (`id_region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_region`
--

LOCK TABLES `app_region` WRITE;
/*!40000 ALTER TABLE `app_region` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_tipo_usuario`
--

DROP TABLE IF EXISTS `app_tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_tipo_usuario` (
  `id_TipoUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo_usuario` varchar(100) NOT NULL,
  PRIMARY KEY (`id_TipoUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_tipo_usuario`
--

LOCK TABLES `app_tipo_usuario` WRITE;
/*!40000 ALTER TABLE `app_tipo_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_usuario`
--

DROP TABLE IF EXISTS `app_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `rut_usuario` varchar(12) NOT NULL,
  `tipo_usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `app_usuario_tipo_usuario_id_e679f3b8_fk_app_tipo_` (`tipo_usuario_id`),
  CONSTRAINT `app_usuario_tipo_usuario_id_e679f3b8_fk_app_tipo_` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `app_tipo_usuario` (`id_TipoUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_usuario`
--

LOCK TABLES `app_usuario` WRITE;
/*!40000 ALTER TABLE `app_usuario` DISABLE KEYS */;
INSERT INTO `app_usuario` VALUES (1,'pbkdf2_sha256$320000$NaG2410XtHzITy3WRKL67D$mMvrpSLGbjmYJBxfikyqBkwnRtZhVjEUVtV66taAYYM=',NULL,1,'adminmedi','','','josee.cornejo@gmail.com',1,1,'2023-04-11 03:45:37.727232','',NULL);
/*!40000 ALTER TABLE `app_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_usuario_groups`
--

DROP TABLE IF EXISTS `app_usuario_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_usuario_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_usuario_groups_usuario_id_group_id_0f4abc88_uniq` (`usuario_id`,`group_id`),
  KEY `app_usuario_groups_group_id_b38b0d6e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `app_usuario_groups_group_id_b38b0d6e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `app_usuario_groups_usuario_id_691971dd_fk_app_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `app_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_usuario_groups`
--

LOCK TABLES `app_usuario_groups` WRITE;
/*!40000 ALTER TABLE `app_usuario_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_usuario_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_usuario_user_permissions`
--

DROP TABLE IF EXISTS `app_usuario_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_usuario_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_usuario_user_permiss_usuario_id_permission_id_6fd11793_uniq` (`usuario_id`,`permission_id`),
  KEY `app_usuario_user_per_permission_id_fbaf8fa8_fk_auth_perm` (`permission_id`),
  CONSTRAINT `app_usuario_user_per_permission_id_fbaf8fa8_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `app_usuario_user_per_usuario_id_d2c76ed5_fk_app_usuar` FOREIGN KEY (`usuario_id`) REFERENCES `app_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_usuario_user_permissions`
--

LOCK TABLES `app_usuario_user_permissions` WRITE;
/*!40000 ALTER TABLE `app_usuario_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_usuario_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_usuarioficha`
--

DROP TABLE IF EXISTS `app_usuarioficha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_usuarioficha` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `dirreccion_usuario` varchar(150) NOT NULL,
  `email_usuario` varchar(254) NOT NULL,
  `telefono_usuario` int(11) NOT NULL,
  `celular_usuario` int(11) NOT NULL,
  `whatsapp_usuario` int(11) NOT NULL,
  `telegram_usuario` int(11) NOT NULL,
  `id_comuna_id` int(11) DEFAULT NULL,
  `identificacion_usuario_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `app_usuarioficha_id_comuna_id_5dd57a85_fk_app_comuna_id_comuna` (`id_comuna_id`),
  KEY `app_usuarioficha_identificacion_usuar_0ea73c8a_fk_app_usuar` (`identificacion_usuario_id`),
  CONSTRAINT `app_usuarioficha_id_comuna_id_5dd57a85_fk_app_comuna_id_comuna` FOREIGN KEY (`id_comuna_id`) REFERENCES `app_comuna` (`id_comuna`),
  CONSTRAINT `app_usuarioficha_identificacion_usuar_0ea73c8a_fk_app_usuar` FOREIGN KEY (`identificacion_usuario_id`) REFERENCES `app_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_usuarioficha`
--

LOCK TABLES `app_usuarioficha` WRITE;
/*!40000 ALTER TABLE `app_usuarioficha` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_usuarioficha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_viaadminstracion`
--

DROP TABLE IF EXISTS `app_viaadminstracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_viaadminstracion` (
  `id_via_administracion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_via_administracion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_via_administracion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_viaadminstracion`
--

LOCK TABLES `app_viaadminstracion` WRITE;
/*!40000 ALTER TABLE `app_viaadminstracion` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_viaadminstracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add Theme',1,'add_theme'),(2,'Can change Theme',1,'change_theme'),(3,'Can delete Theme',1,'delete_theme'),(4,'Can view Theme',1,'view_theme'),(5,'Can add log entry',2,'add_logentry'),(6,'Can change log entry',2,'change_logentry'),(7,'Can delete log entry',2,'delete_logentry'),(8,'Can view log entry',2,'view_logentry'),(9,'Can add permission',3,'add_permission'),(10,'Can change permission',3,'change_permission'),(11,'Can delete permission',3,'delete_permission'),(12,'Can view permission',3,'view_permission'),(13,'Can add group',4,'add_group'),(14,'Can change group',4,'change_group'),(15,'Can delete group',4,'delete_group'),(16,'Can view group',4,'view_group'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add user',7,'add_usuario'),(26,'Can change user',7,'change_usuario'),(27,'Can delete user',7,'delete_usuario'),(28,'Can view user',7,'view_usuario'),(29,'Can add cesfam',8,'add_cesfam'),(30,'Can change cesfam',8,'change_cesfam'),(31,'Can delete cesfam',8,'delete_cesfam'),(32,'Can view cesfam',8,'view_cesfam'),(33,'Can add comuna',9,'add_comuna'),(34,'Can change comuna',9,'change_comuna'),(35,'Can delete comuna',9,'delete_comuna'),(36,'Can view comuna',9,'view_comuna'),(37,'Can add contacto',10,'add_contacto'),(38,'Can change contacto',10,'change_contacto'),(39,'Can delete contacto',10,'delete_contacto'),(40,'Can view contacto',10,'view_contacto'),(41,'Can add farmacia',11,'add_farmacia'),(42,'Can change farmacia',11,'change_farmacia'),(43,'Can delete farmacia',11,'delete_farmacia'),(44,'Can view farmacia',11,'view_farmacia'),(45,'Can add laboratorio',12,'add_laboratorio'),(46,'Can change laboratorio',12,'change_laboratorio'),(47,'Can delete laboratorio',12,'delete_laboratorio'),(48,'Can view laboratorio',12,'view_laboratorio'),(49,'Can add medicamentos',13,'add_medicamentos'),(50,'Can change medicamentos',13,'change_medicamentos'),(51,'Can delete medicamentos',13,'delete_medicamentos'),(52,'Can view medicamentos',13,'view_medicamentos'),(53,'Can add paciente ficha clinica',14,'add_pacientefichaclinica'),(54,'Can change paciente ficha clinica',14,'change_pacientefichaclinica'),(55,'Can delete paciente ficha clinica',14,'delete_pacientefichaclinica'),(56,'Can view paciente ficha clinica',14,'view_pacientefichaclinica'),(57,'Can add principio activo',15,'add_principioactivo'),(58,'Can change principio activo',15,'change_principioactivo'),(59,'Can delete principio activo',15,'delete_principioactivo'),(60,'Can view principio activo',15,'view_principioactivo'),(61,'Can add region',16,'add_region'),(62,'Can change region',16,'change_region'),(63,'Can delete region',16,'delete_region'),(64,'Can view region',16,'view_region'),(65,'Can add tipo_usuario',17,'add_tipo_usuario'),(66,'Can change tipo_usuario',17,'change_tipo_usuario'),(67,'Can delete tipo_usuario',17,'delete_tipo_usuario'),(68,'Can view tipo_usuario',17,'view_tipo_usuario'),(69,'Can add via adminstracion',18,'add_viaadminstracion'),(70,'Can change via adminstracion',18,'change_viaadminstracion'),(71,'Can delete via adminstracion',18,'delete_viaadminstracion'),(72,'Can view via adminstracion',18,'view_viaadminstracion'),(73,'Can add usuario ficha',19,'add_usuarioficha'),(74,'Can change usuario ficha',19,'change_usuarioficha'),(75,'Can delete usuario ficha',19,'delete_usuarioficha'),(76,'Can view usuario ficha',19,'view_usuarioficha'),(77,'Can add quimico farmaceutico encargado',20,'add_quimicofarmaceuticoencargado'),(78,'Can change quimico farmaceutico encargado',20,'change_quimicofarmaceuticoencargado'),(79,'Can delete quimico farmaceutico encargado',20,'delete_quimicofarmaceuticoencargado'),(80,'Can view quimico farmaceutico encargado',20,'view_quimicofarmaceuticoencargado'),(81,'Can add provincia',21,'add_provincia'),(82,'Can change provincia',21,'change_provincia'),(83,'Can delete provincia',21,'delete_provincia'),(84,'Can view provincia',21,'view_provincia'),(85,'Can add profesional paciente',22,'add_profesionalpaciente'),(86,'Can change profesional paciente',22,'change_profesionalpaciente'),(87,'Can delete profesional paciente',22,'delete_profesionalpaciente'),(88,'Can view profesional paciente',22,'view_profesionalpaciente'),(89,'Can add paciente receta',23,'add_pacientereceta'),(90,'Can change paciente receta',23,'change_pacientereceta'),(91,'Can delete paciente receta',23,'delete_pacientereceta'),(92,'Can view paciente receta',23,'view_pacientereceta'),(93,'Can add paciente familiar',24,'add_pacientefamiliar'),(94,'Can change paciente familiar',24,'change_pacientefamiliar'),(95,'Can delete paciente familiar',24,'delete_pacientefamiliar'),(96,'Can view paciente familiar',24,'view_pacientefamiliar'),(97,'Can add medicamentos descuento',25,'add_medicamentosdescuento'),(98,'Can change medicamentos descuento',25,'change_medicamentosdescuento'),(99,'Can delete medicamentos descuento',25,'delete_medicamentosdescuento'),(100,'Can view medicamentos descuento',25,'view_medicamentosdescuento'),(101,'Can add medicamento ficha tecnica',26,'add_medicamentofichatecnica'),(102,'Can change medicamento ficha tecnica',26,'change_medicamentofichatecnica'),(103,'Can delete medicamento ficha tecnica',26,'delete_medicamentofichatecnica'),(104,'Can view medicamento ficha tecnica',26,'view_medicamentofichatecnica'),(105,'Can add farmacia sucursal',27,'add_farmaciasucursal'),(106,'Can change farmacia sucursal',27,'change_farmaciasucursal'),(107,'Can delete farmacia sucursal',27,'delete_farmaciasucursal'),(108,'Can view farmacia sucursal',27,'view_farmaciasucursal'),(109,'Can add farmacia cesfam',28,'add_farmaciacesfam'),(110,'Can change farmacia cesfam',28,'change_farmaciacesfam'),(111,'Can delete farmacia cesfam',28,'delete_farmaciacesfam'),(112,'Can view farmacia cesfam',28,'view_farmaciacesfam'),(113,'Can add familiar paciente usuario',29,'add_familiarpacienteusuario'),(114,'Can change familiar paciente usuario',29,'change_familiarpacienteusuario'),(115,'Can delete familiar paciente usuario',29,'delete_familiarpacienteusuario'),(116,'Can view familiar paciente usuario',29,'view_familiarpacienteusuario'),(117,'Can add enfermera',30,'add_enfermera'),(118,'Can change enfermera',30,'change_enfermera'),(119,'Can delete enfermera',30,'delete_enfermera'),(120,'Can view enfermera',30,'view_enfermera');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_app_usuario_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_app_usuario_id` FOREIGN KEY (`user_id`) REFERENCES `app_usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (2,'admin','logentry'),(1,'admin_interface','theme'),(8,'app','cesfam'),(9,'app','comuna'),(10,'app','contacto'),(30,'app','enfermera'),(29,'app','familiarpacienteusuario'),(11,'app','farmacia'),(28,'app','farmaciacesfam'),(27,'app','farmaciasucursal'),(12,'app','laboratorio'),(26,'app','medicamentofichatecnica'),(13,'app','medicamentos'),(25,'app','medicamentosdescuento'),(24,'app','pacientefamiliar'),(14,'app','pacientefichaclinica'),(23,'app','pacientereceta'),(15,'app','principioactivo'),(22,'app','profesionalpaciente'),(21,'app','provincia'),(20,'app','quimicofarmaceuticoencargado'),(16,'app','region'),(17,'app','tipo_usuario'),(7,'app','usuario'),(19,'app','usuarioficha'),(18,'app','viaadminstracion'),(4,'auth','group'),(3,'auth','permission'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-04-11 03:45:00.831137'),(2,'contenttypes','0002_remove_content_type_name','2023-04-11 03:45:00.931620'),(3,'auth','0001_initial','2023-04-11 03:45:01.244747'),(4,'auth','0002_alter_permission_name_max_length','2023-04-11 03:45:01.308320'),(5,'auth','0003_alter_user_email_max_length','2023-04-11 03:45:01.320222'),(6,'auth','0004_alter_user_username_opts','2023-04-11 03:45:01.331124'),(7,'auth','0005_alter_user_last_login_null','2023-04-11 03:45:01.342126'),(8,'auth','0006_require_contenttypes_0002','2023-04-11 03:45:01.352078'),(9,'auth','0007_alter_validators_add_error_messages','2023-04-11 03:45:01.361864'),(10,'auth','0008_alter_user_username_max_length','2023-04-11 03:45:01.372992'),(11,'auth','0009_alter_user_last_name_max_length','2023-04-11 03:45:01.383646'),(12,'auth','0010_alter_group_name_max_length','2023-04-11 03:45:01.464332'),(13,'auth','0011_update_proxy_permissions','2023-04-11 03:45:01.475106'),(14,'auth','0012_alter_user_first_name_max_length','2023-04-11 03:45:01.486377'),(15,'app','0001_initial','2023-04-11 03:45:05.607741'),(16,'admin','0001_initial','2023-04-11 03:45:05.769723'),(17,'admin','0002_logentry_remove_auto_add','2023-04-11 03:45:05.800663'),(18,'admin','0003_logentry_add_action_flag_choices','2023-04-11 03:45:05.823706'),(19,'admin_interface','0001_initial','2023-04-11 03:45:05.859888'),(20,'admin_interface','0002_add_related_modal','2023-04-11 03:45:06.114443'),(21,'admin_interface','0003_add_logo_color','2023-04-11 03:45:06.173601'),(22,'admin_interface','0004_rename_title_color','2023-04-11 03:45:06.195892'),(23,'admin_interface','0005_add_recent_actions_visible','2023-04-11 03:45:06.252317'),(24,'admin_interface','0006_bytes_to_str','2023-04-11 03:45:06.342951'),(25,'admin_interface','0007_add_favicon','2023-04-11 03:45:06.397734'),(26,'admin_interface','0008_change_related_modal_background_opacity_type','2023-04-11 03:45:06.480611'),(27,'admin_interface','0009_add_enviroment','2023-04-11 03:45:06.573342'),(28,'admin_interface','0010_add_localization','2023-04-11 03:45:06.597803'),(29,'admin_interface','0011_add_environment_options','2023-04-11 03:45:06.736221'),(30,'admin_interface','0012_update_verbose_names','2023-04-11 03:45:06.751193'),(31,'admin_interface','0013_add_related_modal_close_button','2023-04-11 03:45:06.811870'),(32,'admin_interface','0014_name_unique','2023-04-11 03:45:06.845215'),(33,'admin_interface','0015_add_language_chooser_active','2023-04-11 03:45:06.905543'),(34,'admin_interface','0016_add_language_chooser_display','2023-04-11 03:45:06.962673'),(35,'admin_interface','0017_change_list_filter_dropdown','2023-04-11 03:45:06.973565'),(36,'admin_interface','0018_theme_list_filter_sticky','2023-04-11 03:45:07.033793'),(37,'admin_interface','0019_add_form_sticky','2023-04-11 03:45:07.142310'),(38,'admin_interface','0020_module_selected_colors','2023-04-11 03:45:07.302417'),(39,'admin_interface','0021_file_extension_validator','2023-04-11 03:45:07.318534'),(40,'admin_interface','0022_add_logo_max_width_and_height','2023-04-11 03:45:07.430718'),(41,'admin_interface','0023_theme_foldable_apps','2023-04-11 03:45:07.488694'),(42,'admin_interface','0024_remove_theme_css','2023-04-11 03:45:07.536028'),(43,'admin_interface','0025_theme_language_chooser_control','2023-04-11 03:45:07.590244'),(44,'admin_interface','0026_theme_list_filter_highlight','2023-04-11 03:45:07.661657'),(45,'admin_interface','0027_theme_list_filter_removal_links','2023-04-11 03:45:07.730591'),(46,'admin_interface','0028_theme_show_fieldsets_as_tabs_and_more','2023-04-11 03:45:07.842498'),(47,'sessions','0001_initial','2023-04-11 03:45:07.891789');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-11 13:13:50

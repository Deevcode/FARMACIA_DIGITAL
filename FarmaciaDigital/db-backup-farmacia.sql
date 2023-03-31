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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_interface_theme`
--

LOCK TABLES `admin_interface_theme` WRITE;
/*!40000 ALTER TABLE `admin_interface_theme` DISABLE KEYS */;
INSERT INTO `admin_interface_theme` VALUES (3,'FD',1,'Farmacia Digital Administración',1,'admin-interface/logo/logo_ussjoSu.png',1,'#0B0B4B','#80EEF5','#4457B7','#FFFFFF','#B2E9F0','#168FB7','#FFFFFF','#FFFFFF','#C9F0DD',1,'#0D1A3C','#D8DAE6','#0C4B33','#0C3C26','#FFFFFF','#BA2121','#A41515','#FFFFFF',1,1,'#000000',1,'#FFFFFF',1,'admin-interface/favicon/Blue_Gradient_Modern_Simple_Pharmacy_Logo_sC5FI6W.png','0.3','Administrador Farmacia Digital',1,'#E74C3C',1,1,1,'code',1,0,0,'#FFFFCC','#FFFFFF',100,400,1,'default-select',1,0,0,0);
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
  `nombre_CESFAM` varchar(200) NOT NULL,
  `direccion_CESFAM` varchar(200) NOT NULL,
  `email_CESFAM` varchar(200) NOT NULL,
  `telefono_CESFAM` varchar(200) NOT NULL,
  `id_comuna_id` int(11) NOT NULL,
  PRIMARY KEY (`id_cesfam`),
  KEY `app_cesfam_id_comuna_id_84733b2c_fk_app_comuna_id_comuna` (`id_comuna_id`),
  CONSTRAINT `app_cesfam_id_comuna_id_84733b2c_fk_app_comuna_id_comuna` FOREIGN KEY (`id_comuna_id`) REFERENCES `app_comuna` (`id_comuna`)
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
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_comuna`
--

LOCK TABLES `app_comuna` WRITE;
/*!40000 ALTER TABLE `app_comuna` DISABLE KEYS */;
INSERT INTO `app_comuna` VALUES (1,'Arica',1),(2,'Camarones',1),(3,'General Lagos',2),(4,'Putre',2),(5,'Alto Hospicio',3),(6,'Iquique',3),(7,'Camiña',4),(8,'Colchane',4),(9,'Huara',4),(10,'Pica',4),(11,'Pozo Almonte',4),(12,'Tocopilla',5),(13,'María Elena',5),(14,'Calama',6),(15,'Ollague',6),(16,'San Pedro de Atacama',6),(17,'Antofagasta',7),(18,'Mejillones',7),(19,'Sierra Gorda',7),(20,'Taltal',7),(21,'Chañaral',8),(22,'Diego de Almagro',8),(23,'Copiapó',9),(24,'Caldera',9),(25,'Tierra Amarilla',9),(26,'Vallenar',10),(27,'Alto del Carmen',10),(28,'Freirina',10),(29,'Huasco',10),(30,'La Serena',11),(31,'Coquimbo',11),(32,'Andacollo',11),(33,'La Higuera',11),(34,'Paihuano',11),(35,'Vicuña',11),(36,'Ovalle',12),(37,'Combarbalá',12),(38,'Monte Patria',12),(39,'Punitaqui',12),(40,'Río Hurtado',12),(41,'Illapel',13),(42,'Canela',13),(43,'Los Vilos',13),(44,'Salamanca',13),(45,'La Ligua',14),(46,'Cabildo',14),(47,'Zapallar',14),(48,'Papudo',14),(49,'Petorca',14),(50,'Los Andes',15),(51,'San Esteban',15),(52,'Calle Larga',15),(53,'Rinconada',15),(54,'San Felipe',16),(55,'Llaillay',16),(56,'Putaendo',16),(57,'Santa María',16),(58,'Catemu',16),(59,'Panquehue',16),(60,'Quillota',17),(61,'La Cruz',17),(62,'La Calera',17),(63,'Nogales',17),(64,'Hijuelas',17),(66,'Viña del Mar',18),(67,'Concón',18),(68,'Quintero',18),(69,'Puchuncaví',18),(70,'Casablanca',18),(71,'Juan Fernández',18),(72,'San Antonio',19),(73,'Cartagena',19),(74,'El Tabo',19),(75,'El Quisco',19),(76,'Algarrobo',19),(77,'Santo Domingo',19),(78,'Isla de Pascua',20),(79,'Quilpué',21),(80,'Limache',21),(81,'Olmué',21),(82,'Villa Alemana',21),(83,'Colina',22),(84,'Lampa',22),(85,'Tiltil',22),(86,'Santiago',23),(87,'Vitacura',23),(88,'San Ramón',23),(89,'San Miguel',23),(90,'San Joaquín',23),(91,'Renca',23),(92,'Recoleta',23),(93,'Quinta Normal',23),(94,'Quilicura',23),(95,'Pudahuel',23),(96,'Providencia',23),(97,'Peñalolén',23),(98,'Pedro Aguirre Cerda',23),(99,'Ñuñoa',23),(100,'Maipú',23),(101,'Macul',23),(102,'Lo Prado',23),(103,'Lo Espejo',23),(104,'Lo Barnechea',23),(105,'Las Condes',23),(106,'La Reina',23),(107,'La Pintana',23),(108,'La Granja',23),(109,'La Florida',23),(110,'La Cisterna',23),(111,'Independencia',23),(112,'Huechuraba',23),(113,'Estación Central',23),(114,'El Bosque',23),(115,'Conchalí',23),(116,'Cerro Navia',23),(117,'Cerrillos',23),(118,'Puente Alto',24),(119,'San José de Maipo',24),(120,'Pirque',24),(121,'San Bernardo',25),(122,'Buin',25),(123,'Paine',25),(124,'Calera de Tango',25),(125,'Melipilla',26),(126,'Alhué',26),(127,'Curacaví',26),(128,'María Pinto',26),(129,'San Pedro',26),(130,'Isla de Maipo',27),(131,'El Monte',27),(132,'Padre Hurtado',27),(133,'Peñaflor',27),(134,'Talagante',27),(135,'Codegua',28),(136,'Coínco',28),(137,'Coltauco',28),(138,'Doñihue',28),(139,'Graneros',28),(140,'Las Cabras',28),(141,'Machalí',28),(142,'Malloa',28),(143,'Mostazal',28),(144,'Olivar',28),(145,'Peumo',28),(146,'Pichidegua',28),(147,'Quinta de Tilcoco',28),(148,'Rancagua',28),(149,'Rengo',28),(150,'Requínoa',28),(151,'San Vicente de Tagua Tagua',28),(152,'Chépica',29),(153,'Chimbarongo',29),(154,'Lolol',29),(155,'Nancagua',29),(156,'Palmilla',29),(157,'Peralillo',29),(158,'Placilla',29),(159,'Pumanque',29),(160,'San Fernando',29),(161,'Santa Cruz',29),(162,'La Estrella',30),(163,'Litueche',30),(164,'Marchigüe',30),(165,'Navidad',30),(166,'Paredones',30),(167,'Pichilemu',30),(168,'Curicó',31),(169,'Hualañé',31),(170,'Licantén',31),(171,'Molina',31),(172,'Rauco',31),(173,'Romeral',31),(174,'Sagrada Familia',31),(175,'Teno',31),(176,'Vichuquén',31),(177,'Talca',32),(178,'San Clemente',32),(179,'Pelarco',32),(180,'Pencahue',32),(181,'Maule',32),(182,'San Rafael',32),(183,'Curepto',33),(184,'Constitución',32),(185,'Empedrado',32),(186,'Río Claro',32),(187,'Linares',33),(188,'San Javier',33),(189,'Parral',33),(190,'Villa Alegre',33),(191,'Longaví',33),(192,'Colbún',33),(193,'Retiro',33),(194,'Yerbas Buenas',33),(195,'Cauquenes',34),(196,'Chanco',34),(197,'Pelluhue',34),(198,'Bulnes',35),(199,'Chillán',35),(200,'Chillán Viejo',35),(201,'El Carmen',35),(202,'Pemuco',35),(203,'Pinto',35),(204,'Quillón',35),(205,'San Ignacio',35),(206,'Yungay',35),(207,'Cobquecura',36),(208,'Coelemu',36),(209,'Ninhue',36),(210,'Portezuelo',36),(211,'Quirihue',36),(212,'Ránquil',36),(213,'Treguaco',36),(214,'San Carlos',37),(215,'Coihueco',37),(216,'San Nicolás',37),(217,'Ñiquén',37),(218,'San Fabián',37),(219,'Alto Biobío',38),(220,'Antuco',38),(221,'Cabrero',38),(222,'Laja',38),(223,'Los Ángeles',38),(224,'Mulchén',38),(225,'Nacimiento',38),(226,'Negrete',38),(227,'Quilaco',38),(228,'Quilleco',38),(229,'San Rosendo',38),(230,'Santa Bárbara',38),(231,'Tucapel',38),(232,'Yumbel',38),(233,'Concepción',39),(234,'Coronel',39),(235,'Chiguayante',39),(236,'Florida',39),(237,'Hualpén',39),(238,'Hualqui',39),(239,'Lota',39),(240,'Penco',39),(241,'San Pedro de La Paz',39),(242,'Santa Juana',39),(243,'Talcahuano',39),(244,'Tomé',39),(245,'Arauco',40),(246,'Cañete',40),(247,'Contulmo',40),(248,'Curanilahue',40),(249,'Lebu',40),(250,'Los Álamos',40),(251,'Tirúa',40),(252,'Angol',41),(253,'Collipulli',41),(254,'Curacautín',41),(255,'Ercilla',41),(256,'Lonquimay',41),(257,'Los Sauces',41),(258,'Lumaco',41),(259,'Purén',41),(260,'Renaico',41),(261,'Traiguén',41),(262,'Victoria',41),(263,'Temuco',42),(264,'Carahue',42),(265,'Cholchol',42),(266,'Cunco',42),(267,'Curarrehue',42),(268,'Freire',42),(269,'Galvarino',42),(270,'Gorbea',42),(271,'Lautaro',42),(272,'Loncoche',42),(273,'Melipeuco',42),(274,'Nueva Imperial',42),(275,'Padre Las Casas',42),(276,'Perquenco',42),(277,'Pitrufquén',42),(278,'Pucón',42),(279,'Saavedra',42),(280,'Teodoro Schmidt',42),(281,'Toltén',42),(282,'Vilcún',42),(283,'Villarrica',42),(284,'Valdivia',43),(285,'Corral',43),(286,'Lanco',43),(287,'Los Lagos',43),(288,'Máfil',43),(289,'Mariquina',43),(290,'Paillaco',43),(291,'Panguipulli',43),(292,'La Unión',44),(293,'Futrono',44),(294,'Lago Ranco',44),(295,'Río Bueno',44),(296,'Osorno',45),(297,'Puerto Octay',45),(298,'Purranque',45),(299,'Puyehue',45),(300,'Río Negro',45),(301,'San Juan de la Costa',45),(302,'San Pablo',45),(303,'Calbuco',46),(304,'Cochamó',46),(305,'Fresia',46),(306,'Frutillar',46),(307,'Llanquihue',46),(308,'Los Muermos',46),(309,'Maullín',46),(310,'Puerto Montt',46),(311,'Puerto Varas',46),(312,'Ancud',47),(313,'Castro',47),(314,'Chonchi',47),(315,'Curaco de Vélez',47),(316,'Dalcahue',47),(317,'Puqueldón',47),(318,'Queilén',47),(319,'Quellón',47),(320,'Quemchi',47),(321,'Quinchao',47),(322,'Chaitén',48),(323,'Futaleufú',48),(324,'Hualaihué',48),(325,'Palena',48),(326,'Lago Verde',49),(327,'Coihaique',49),(328,'Aysén',50),(329,'Cisnes',50),(330,'Guaitecas',50),(331,'Río Ibáñez',51),(332,'Chile Chico',51),(333,'Cochrane',52),(334,'OHiggins',52),(335,'Tortel',52),(336,'Natales',53),(337,'Torres del Paine',53),(338,'Laguna Blanca',54),(339,'Punta Arenas',54),(340,'Río Verde',54),(341,'San Gregorio',54),(342,'Porvenir',55),(343,'Primavera',55),(344,'Timaukel',55),(345,'Cabo de Hornos',56);
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
  `tipo_consulta` int(11) NOT NULL,
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
-- Table structure for table `app_diabetes`
--

DROP TABLE IF EXISTS `app_diabetes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_diabetes` (
  `id_diabetes` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_diabetes` varchar(100) NOT NULL,
  PRIMARY KEY (`id_diabetes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_diabetes`
--

LOCK TABLES `app_diabetes` WRITE;
/*!40000 ALTER TABLE `app_diabetes` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_diabetes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_enfermera`
--

DROP TABLE IF EXISTS `app_enfermera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_enfermera` (
  `id_enfermera` int(11) NOT NULL AUTO_INCREMENT,
  `nombres_enfermera` varchar(200) NOT NULL,
  `apellidos_enfermera` varchar(200) NOT NULL,
  `direccion_enfermera` varchar(200) NOT NULL,
  `celular_usuario` int(11) NOT NULL,
  `id_TipoUsuario_id` int(11) DEFAULT NULL,
  `id_comuna_id` int(11) NOT NULL,
  PRIMARY KEY (`id_enfermera`),
  KEY `app_enfermera_id_TipoUsuario_id_37bdc3fd_fk_app_tipo_` (`id_TipoUsuario_id`),
  KEY `app_enfermera_id_comuna_id_b11cc78d_fk_app_comuna_id_comuna` (`id_comuna_id`),
  CONSTRAINT `app_enfermera_id_TipoUsuario_id_37bdc3fd_fk_app_tipo_` FOREIGN KEY (`id_TipoUsuario_id`) REFERENCES `app_tipo_usuario` (`id_TipoUsuario`),
  CONSTRAINT `app_enfermera_id_comuna_id_b11cc78d_fk_app_comuna_id_comuna` FOREIGN KEY (`id_comuna_id`) REFERENCES `app_comuna` (`id_comuna`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_enfermera`
--

LOCK TABLES `app_enfermera` WRITE;
/*!40000 ALTER TABLE `app_enfermera` DISABLE KEYS */;
INSERT INTO `app_enfermera` VALUES (2,'Maria Angela','Dibu Barrientos','maria.db@gmail.com',964446724,7,118),(3,'Daniela Arido','Garrido Barriento','barrientos.dani@gmail.com',973929364,7,112),(4,'Elsa de las Mercedes','Carmona Arzua','elsa.cormona@gmail.com',973337264,7,124);
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
  `nombre_tipo_usuario_id` int(11) NOT NULL,
  `nombres_usuario_id` int(11) NOT NULL,
  `parentesco_id` int(11) NOT NULL,
  PRIMARY KEY (`id_familiar_paciente`),
  KEY `app_familiarpaciente_nombre_tipo_usuario__e6aff2eb_fk_app_tipo_` (`nombre_tipo_usuario_id`),
  KEY `app_familiarpaciente_nombres_usuario_id_300fc968_fk_app_usuar` (`nombres_usuario_id`),
  KEY `app_familiarpaciente_parentesco_id_3defb990_fk_app_pacie` (`parentesco_id`),
  CONSTRAINT `app_familiarpaciente_nombre_tipo_usuario__e6aff2eb_fk_app_tipo_` FOREIGN KEY (`nombre_tipo_usuario_id`) REFERENCES `app_tipo_usuario` (`id_TipoUsuario`),
  CONSTRAINT `app_familiarpaciente_nombres_usuario_id_300fc968_fk_app_usuar` FOREIGN KEY (`nombres_usuario_id`) REFERENCES `app_usuarioficha` (`id_usuario`),
  CONSTRAINT `app_familiarpaciente_parentesco_id_3defb990_fk_app_pacie` FOREIGN KEY (`parentesco_id`) REFERENCES `app_pacientefamiliar` (`id_usuario_familiar`)
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
  `nombre_farmacia_CESFAM` varchar(200) NOT NULL,
  `direccion_farmacia_CESFAM` varchar(200) NOT NULL,
  `email_farmacia_CESFAM` varchar(200) NOT NULL,
  `telefono_farmacia_CESFAM` varchar(200) NOT NULL,
  `id_cesfam_id` int(11) NOT NULL,
  `id_comuna_id` int(11) NOT NULL,
  PRIMARY KEY (`id_farmacia_CESFAM`),
  KEY `app_farmaciacesfam_id_cesfam_id_e50b2528_fk_app_cesfam_id_cesfam` (`id_cesfam_id`),
  KEY `app_farmaciacesfam_id_comuna_id_edd00cb8_fk_app_comuna_id_comuna` (`id_comuna_id`),
  CONSTRAINT `app_farmaciacesfam_id_cesfam_id_e50b2528_fk_app_cesfam_id_cesfam` FOREIGN KEY (`id_cesfam_id`) REFERENCES `app_cesfam` (`id_cesfam`),
  CONSTRAINT `app_farmaciacesfam_id_comuna_id_edd00cb8_fk_app_comuna_id_comuna` FOREIGN KEY (`id_comuna_id`) REFERENCES `app_comuna` (`id_comuna`)
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
  `id_comuna_id` int(11) NOT NULL,
  `id_provincia_id` int(11) NOT NULL,
  `id_quimico_farmaceutio_id` int(11) NOT NULL,
  `id_region_id` int(11) NOT NULL,
  `nombre_farmacia_id` int(11) NOT NULL,
  PRIMARY KEY (`id_sucursal`),
  KEY `app_farmaciasucursal_id_comuna_id_78170c0e_fk_app_comun` (`id_comuna_id`),
  KEY `app_farmaciasucursal_id_provincia_id_f2576058_fk_app_provi` (`id_provincia_id`),
  KEY `app_farmaciasucursal_id_quimico_farmaceut_ea6b3740_fk_app_quimi` (`id_quimico_farmaceutio_id`),
  KEY `app_farmaciasucursal_id_region_id_4959a43f_fk_app_regio` (`id_region_id`),
  KEY `app_farmaciasucursal_nombre_farmacia_id_3760d06c_fk_app_farma` (`nombre_farmacia_id`),
  CONSTRAINT `app_farmaciasucursal_id_comuna_id_78170c0e_fk_app_comun` FOREIGN KEY (`id_comuna_id`) REFERENCES `app_comuna` (`id_comuna`),
  CONSTRAINT `app_farmaciasucursal_id_provincia_id_f2576058_fk_app_provi` FOREIGN KEY (`id_provincia_id`) REFERENCES `app_provincia` (`id_provincia`),
  CONSTRAINT `app_farmaciasucursal_id_quimico_farmaceut_ea6b3740_fk_app_quimi` FOREIGN KEY (`id_quimico_farmaceutio_id`) REFERENCES `app_quimicofarmaceuticoencargado` (`id_quimico_farmaceutio`),
  CONSTRAINT `app_farmaciasucursal_id_region_id_4959a43f_fk_app_regio` FOREIGN KEY (`id_region_id`) REFERENCES `app_region` (`id_region`),
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
-- Table structure for table `app_hipertension`
--

DROP TABLE IF EXISTS `app_hipertension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_hipertension` (
  `id_hipertension` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_hipertension` varchar(100) NOT NULL,
  PRIMARY KEY (`id_hipertension`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_hipertension`
--

LOCK TABLES `app_hipertension` WRITE;
/*!40000 ALTER TABLE `app_hipertension` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_hipertension` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_laboratorio`
--

LOCK TABLES `app_laboratorio` WRITE;
/*!40000 ALTER TABLE `app_laboratorio` DISABLE KEYS */;
INSERT INTO `app_laboratorio` VALUES (1,'Andromaco'),(2,'Roche'),(3,'MintLab'),(4,'Abbott'),(5,'Lundbeck');
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
-- Table structure for table `app_medicamentofraccionamiento`
--

DROP TABLE IF EXISTS `app_medicamentofraccionamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_medicamentofraccionamiento` (
  `id_fraccion` int(11) NOT NULL AUTO_INCREMENT,
  `fraccion` varchar(4) NOT NULL,
  `descripcion_fraccion` varchar(200) NOT NULL,
  PRIMARY KEY (`id_fraccion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_medicamentofraccionamiento`
--

LOCK TABLES `app_medicamentofraccionamiento` WRITE;
/*!40000 ALTER TABLE `app_medicamentofraccionamiento` DISABLE KEYS */;
INSERT INTO `app_medicamentofraccionamiento` VALUES (1,'1/4','Un cuarto de pastilla'),(2,'1/2','Media pastilla'),(3,'3/4','Tres cuartos de pastilla'),(4,'1','Una pastilla entera');
/*!40000 ALTER TABLE `app_medicamentofraccionamiento` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_medicamentos`
--

LOCK TABLES `app_medicamentos` WRITE;
/*!40000 ALTER TABLE `app_medicamentos` DISABLE KEYS */;
INSERT INTO `app_medicamentos` VALUES (1,'Levofamil','200/50 mg',13,'30 Comprimidos',1,1,1),(2,'Citalopram','20mg',20,'30 Comprimidos',3,3,1),(3,'Prolopa','200 mg/50 mg',10,'30 Comprimidos',2,2,1),(4,'Prolopa®HBS','100 mg/ 25 mg',31,'30 Cápsulas',2,2,1),(5,'Prolopa®Dispersable','100 mg/ 25 mg',20,'30 Comprimidos Dispersables',2,2,1),(6,'Cipramil®','20mg',30,'28 Comprimidos',5,3,1);
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
  `num_run_familiar` varchar(12) NOT NULL,
  `nombre_familiar` varchar(100) NOT NULL,
  `apellido_familiar` varchar(100) NOT NULL,
  `email_familiar` varchar(254) NOT NULL,
  `telefono_familiar` int(11) NOT NULL,
  `whatsapp_familiar` int(11) NOT NULL,
  `celular_familiar` int(11) NOT NULL,
  `telegram_familiar` int(11) NOT NULL,
  `parentesco` varchar(100) NOT NULL,
  `direccion_familiar` varchar(100) NOT NULL,
  `id_comuna_id` int(11) NOT NULL,
  `nombre_tipo_usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario_familiar`),
  KEY `app_pacientefamiliar_id_comuna_id_98e15ee4_fk_app_comun` (`id_comuna_id`),
  KEY `app_pacientefamiliar_nombre_tipo_usuario__f57e4b0d_fk_app_tipo_` (`nombre_tipo_usuario_id`),
  CONSTRAINT `app_pacientefamiliar_id_comuna_id_98e15ee4_fk_app_comun` FOREIGN KEY (`id_comuna_id`) REFERENCES `app_comuna` (`id_comuna`),
  CONSTRAINT `app_pacientefamiliar_nombre_tipo_usuario__f57e4b0d_fk_app_tipo_` FOREIGN KEY (`nombre_tipo_usuario_id`) REFERENCES `app_tipo_usuario` (`id_TipoUsuario`)
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
  `fecha_nacimiento` date NOT NULL,
  `identificacion_paciente_id` bigint(20) NOT NULL,
  `tipo_diabetes_id` int(11) NOT NULL,
  `tipo_hipertension_id` int(11) NOT NULL,
  PRIMARY KEY (`id_paciente_ficha`),
  KEY `app_pacientefichacli_identificacion_pacie_f95dfd7b_fk_app_usuar` (`identificacion_paciente_id`),
  KEY `app_pacientefichacli_tipo_diabetes_id_5c3c56e9_fk_app_diabe` (`tipo_diabetes_id`),
  KEY `app_pacientefichacli_tipo_hipertension_id_2283afcf_fk_app_hiper` (`tipo_hipertension_id`),
  CONSTRAINT `app_pacientefichacli_identificacion_pacie_f95dfd7b_fk_app_usuar` FOREIGN KEY (`identificacion_paciente_id`) REFERENCES `app_usuario` (`id`),
  CONSTRAINT `app_pacientefichacli_tipo_diabetes_id_5c3c56e9_fk_app_diabe` FOREIGN KEY (`tipo_diabetes_id`) REFERENCES `app_diabetes` (`id_diabetes`),
  CONSTRAINT `app_pacientefichacli_tipo_hipertension_id_2283afcf_fk_app_hiper` FOREIGN KEY (`tipo_hipertension_id`) REFERENCES `app_hipertension` (`id_hipertension`)
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
  `horario_1` time(6) NOT NULL,
  `horario_2` time(6) DEFAULT NULL,
  `horario_3` time(6) DEFAULT NULL,
  `horario_4` time(6) DEFAULT NULL,
  `horario_5` time(6) DEFAULT NULL,
  `horario_6` time(6) DEFAULT NULL,
  `descripcion` longtext NOT NULL,
  `fracionamiento_1_id` int(11) DEFAULT NULL,
  `nombre_comercial_id` int(11) DEFAULT NULL,
  `nombre_enfermera_id` int(11) DEFAULT NULL,
  `nombres_paciente_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_receta_usuario`),
  KEY `app_pacientereceta_fracionamiento_1_id_04c7e471_fk_app_medic` (`fracionamiento_1_id`),
  KEY `app_pacientereceta_nombre_comercial_id_7806ab36_fk_app_medic` (`nombre_comercial_id`),
  KEY `app_pacientereceta_nombre_enfermera_id_28225d3b_fk_app_enfer` (`nombre_enfermera_id`),
  KEY `app_pacientereceta_nombres_paciente_id_70d2bbbc_fk_app_usuar` (`nombres_paciente_id`),
  CONSTRAINT `app_pacientereceta_fracionamiento_1_id_04c7e471_fk_app_medic` FOREIGN KEY (`fracionamiento_1_id`) REFERENCES `app_medicamentofraccionamiento` (`id_fraccion`),
  CONSTRAINT `app_pacientereceta_nombre_comercial_id_7806ab36_fk_app_medic` FOREIGN KEY (`nombre_comercial_id`) REFERENCES `app_medicamentos` (`id_medicamento`),
  CONSTRAINT `app_pacientereceta_nombre_enfermera_id_28225d3b_fk_app_enfer` FOREIGN KEY (`nombre_enfermera_id`) REFERENCES `app_enfermera` (`id_enfermera`),
  CONSTRAINT `app_pacientereceta_nombres_paciente_id_70d2bbbc_fk_app_usuar` FOREIGN KEY (`nombres_paciente_id`) REFERENCES `app_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_pacientereceta`
--

LOCK TABLES `app_pacientereceta` WRITE;
/*!40000 ALTER TABLE `app_pacientereceta` DISABLE KEYS */;
INSERT INTO `app_pacientereceta` VALUES (1,'2023-03-28','15 dias','2 comprimidos','12:05:00.000000',NULL,NULL,NULL,NULL,NULL,'Tomar este medicamento después de la primera comida del día.',2,1,3,2),(2,'2023-03-28','10 Dias','2 comprimidos','06:00:00.000000',NULL,NULL,NULL,NULL,NULL,'Tomar este medicamento con abundante agua para su correcta absorción.',1,3,2,4),(3,'2023-03-28','12 Dias','4 Comprimidos','12:00:00.000000',NULL,NULL,NULL,NULL,NULL,'Tomar este medicamento después del almuerzo, debido a la acidez que provoca este medicamento.',1,6,4,5),(4,'2023-03-28','5 Dias','4 Comprimidos','13:14:00.000000',NULL,NULL,NULL,NULL,NULL,'Consumir este medicamento con abundante agua por la mañana.',1,3,2,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_principioactivo`
--

LOCK TABLES `app_principioactivo` WRITE;
/*!40000 ALTER TABLE `app_principioactivo` DISABLE KEYS */;
INSERT INTO `app_principioactivo` VALUES (1,'Levodopa+Carbidopa'),(2,'Levadopa+Benserazida'),(3,'Citalopram'),(4,'Pramipexol');
/*!40000 ALTER TABLE `app_principioactivo` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_provincia`
--

LOCK TABLES `app_provincia` WRITE;
/*!40000 ALTER TABLE `app_provincia` DISABLE KEYS */;
INSERT INTO `app_provincia` VALUES (1,'Arica',1),(2,'Parinacota',1),(3,'Iquique',2),(4,'El Tamarugal',2),(5,'Tocopilla',3),(6,'El Loa',3),(7,'Antofagasta',3),(8,'Chañaral',4),(9,'Copiapó',4),(10,'Huasco',4),(11,'Elqui',5),(12,'Limarí',5),(13,'Choapa',5),(14,'Petorca',6),(15,'Los Andes',6),(16,'San Felipe de Aconcagua',6),(17,'Quillota',6),(18,'Valparaiso',6),(19,'San Antonio',6),(20,'Isla de Pascua',6),(21,'Marga Marga',6),(22,'Chacabuco',7),(23,'Santiago',7),(24,'Cordillera',7),(25,'Maipo',7),(26,'Melipilla',7),(27,'Talagante',7),(28,'Cachapoal',8),(29,'Colchagua',8),(30,'Cardenal Caro',8),(31,'Curicó',9),(32,'Talca',9),(33,'Linares',9),(34,'Cauquenes',9),(35,'Diguillín',10),(36,'Itata',10),(37,'Punilla',10),(38,'Bio Bío',11),(39,'Concepción',11),(40,'Arauco',11),(41,'Malleco',12),(42,'Cautín',12),(43,'Valdivia',13),(44,'Ranco',13),(45,'Osorno',14),(46,'Llanquihue',14),(47,'Chiloé',14),(48,'Palena',14),(49,'Coyhaique',15),(50,'Aysén',15),(51,'General Carrera',15),(52,'Capitán Prat',15),(53,'Última Esperanza',16),(54,'Magallanes',16),(55,'Tierra del Fuego',16),(56,'Antártica Chilena',16);
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
  `tipo_usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id_quimico_farmaceutio`),
  KEY `app_quimicofarmaceut_tipo_usuario_id_ff7a04f2_fk_app_tipo_` (`tipo_usuario_id`),
  CONSTRAINT `app_quimicofarmaceut_tipo_usuario_id_ff7a04f2_fk_app_tipo_` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `app_tipo_usuario` (`id_TipoUsuario`)
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_region`
--

LOCK TABLES `app_region` WRITE;
/*!40000 ALTER TABLE `app_region` DISABLE KEYS */;
INSERT INTO `app_region` VALUES (1,'METROPOLITANA'),(2,'ARICA Y PARINACOTA'),(3,'TARAPACÁ'),(4,'ANTOFAGASTA'),(5,'ATACAMA'),(6,'COQUIMBO'),(7,'VALPARAÍSO'),(8,'LIBERTADOR GRAL. BERNARDO OHIGGINS'),(9,'EL MAULE'),(10,'ÑUBLE'),(11,'BIOBÍO'),(12,'LA ARAUCANÍA'),(13,'LOS RÍOS'),(14,'LOS LAGOS'),(15,'AYSÉN DEL GRAL. CARLOS IBAÑEZ DEL CAMPO'),(16,'MAGALLANES Y LA ANTÁRTICA CHILENA');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_tipo_usuario`
--

LOCK TABLES `app_tipo_usuario` WRITE;
/*!40000 ALTER TABLE `app_tipo_usuario` DISABLE KEYS */;
INSERT INTO `app_tipo_usuario` VALUES (2,'Laboratorio'),(3,'Paciente'),(4,'Familiar'),(5,'QuimicoFarmaceutico'),(6,'CESFAM'),(7,'Enfermera');
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
  `id_TipoUsuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `app_usuario_id_TipoUsuario_id_d5d9368d_fk_app_tipo_` (`id_TipoUsuario_id`),
  CONSTRAINT `app_usuario_id_TipoUsuario_id_d5d9368d_fk_app_tipo_` FOREIGN KEY (`id_TipoUsuario_id`) REFERENCES `app_tipo_usuario` (`id_TipoUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_usuario`
--

LOCK TABLES `app_usuario` WRITE;
/*!40000 ALTER TABLE `app_usuario` DISABLE KEYS */;
INSERT INTO `app_usuario` VALUES (1,'pbkdf2_sha256$390000$mrsBzdaABE3ynJAUv8rHst$HThPNh3GL1PvojeDh19PrZhWHoiK6tznSsaO7Q6AeRM=','2023-03-31 03:21:05.436344',1,'adminmedi','','','josee.cornejo@gmail.com',1,1,'2023-03-31 03:17:58.611953','',NULL),(2,'pbkdf2_sha256$390000$mEdcslJlx6rVmYHPKPDnLB$gyCGWV7pd8qWz0nq0IcLJzMWi9IVAVe8kjTtQfUQu0I=','2023-03-22 14:33:26.959317',0,'Juan_01','Juan','Perez','juan@gmail.com',0,1,'2023-03-21 00:13:07.691684','18.227.394-7',3),(3,'pbkdf2_sha256$390000$omEZWgCs1gQrxouWi0UfYj$IOPX48w+OTFjWczX2TpBJGT9Fhn8hRZDt7kb0ZQYrDc=','2023-03-21 16:17:19.004479',0,'Matias_02','Matias','Prado','matias@gmail.com',0,1,'2023-03-21 02:10:59.558340','17.238.393-0',3),(4,'pbkdf2_sha256$390000$VILMPlfmb8YkgGXWVrmRzh$r7EU+GGcPW9+Ov4FWhOVtHTKlJOf43XJ7aDS28D/eLM=',NULL,0,'Benjamin_03','Benjamim','Cornejo','benjamin@gmail.com',0,1,'2023-03-21 02:13:05.953829','20.123.456-k',4),(5,'pbkdf2_sha256$390000$hwMWLaRGlSDkVuKMqfPNC1$IvAglpISQH7ykJuX/JHD2pPvByOOiwlmtG7m4QYet+8=',NULL,0,'Tomas_04','Tomas','Gutierrez','tomas@gmail.com',0,1,'2023-03-21 02:17:11.395323','18.234.564-1',4);
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
  `id_comuna_id` int(11) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_viaadminstracion`
--

LOCK TABLES `app_viaadminstracion` WRITE;
/*!40000 ALTER TABLE `app_viaadminstracion` DISABLE KEYS */;
INSERT INTO `app_viaadminstracion` VALUES (1,'Oral'),(2,'Rectal'),(3,'Endovenoso'),(4,'Intramuscular');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Lector');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,28),(2,1,32),(3,1,36),(4,1,40),(5,1,44),(6,1,48),(7,1,52),(8,1,56),(9,1,60),(10,1,64),(11,1,68),(12,1,72),(13,1,76),(14,1,80),(15,1,84),(16,1,88),(17,1,92),(18,1,96),(19,1,100),(20,1,104),(21,1,108),(22,1,112),(23,1,116),(24,1,120);
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
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add Theme',1,'add_theme'),(2,'Can change Theme',1,'change_theme'),(3,'Can delete Theme',1,'delete_theme'),(4,'Can view Theme',1,'view_theme'),(5,'Can add log entry',2,'add_logentry'),(6,'Can change log entry',2,'change_logentry'),(7,'Can delete log entry',2,'delete_logentry'),(8,'Can view log entry',2,'view_logentry'),(9,'Can add permission',3,'add_permission'),(10,'Can change permission',3,'change_permission'),(11,'Can delete permission',3,'delete_permission'),(12,'Can view permission',3,'view_permission'),(13,'Can add group',4,'add_group'),(14,'Can change group',4,'change_group'),(15,'Can delete group',4,'delete_group'),(16,'Can view group',4,'view_group'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add user',7,'add_usuario'),(26,'Can change user',7,'change_usuario'),(27,'Can delete user',7,'delete_usuario'),(28,'Can view user',7,'view_usuario'),(29,'Can add cesfam',8,'add_cesfam'),(30,'Can change cesfam',8,'change_cesfam'),(31,'Can delete cesfam',8,'delete_cesfam'),(32,'Can view cesfam',8,'view_cesfam'),(33,'Can add comuna',9,'add_comuna'),(34,'Can change comuna',9,'change_comuna'),(35,'Can delete comuna',9,'delete_comuna'),(36,'Can view comuna',9,'view_comuna'),(37,'Can add contacto',10,'add_contacto'),(38,'Can change contacto',10,'change_contacto'),(39,'Can delete contacto',10,'delete_contacto'),(40,'Can view contacto',10,'view_contacto'),(41,'Can add diabetes',11,'add_diabetes'),(42,'Can change diabetes',11,'change_diabetes'),(43,'Can delete diabetes',11,'delete_diabetes'),(44,'Can view diabetes',11,'view_diabetes'),(45,'Can add enfermera',12,'add_enfermera'),(46,'Can change enfermera',12,'change_enfermera'),(47,'Can delete enfermera',12,'delete_enfermera'),(48,'Can view enfermera',12,'view_enfermera'),(49,'Can add farmacia',13,'add_farmacia'),(50,'Can change farmacia',13,'change_farmacia'),(51,'Can delete farmacia',13,'delete_farmacia'),(52,'Can view farmacia',13,'view_farmacia'),(53,'Can add hipertension',14,'add_hipertension'),(54,'Can change hipertension',14,'change_hipertension'),(55,'Can delete hipertension',14,'delete_hipertension'),(56,'Can view hipertension',14,'view_hipertension'),(57,'Can add laboratorio',15,'add_laboratorio'),(58,'Can change laboratorio',15,'change_laboratorio'),(59,'Can delete laboratorio',15,'delete_laboratorio'),(60,'Can view laboratorio',15,'view_laboratorio'),(61,'Can add medicamento fraccionamiento',16,'add_medicamentofraccionamiento'),(62,'Can change medicamento fraccionamiento',16,'change_medicamentofraccionamiento'),(63,'Can delete medicamento fraccionamiento',16,'delete_medicamentofraccionamiento'),(64,'Can view medicamento fraccionamiento',16,'view_medicamentofraccionamiento'),(65,'Can add medicamentos',17,'add_medicamentos'),(66,'Can change medicamentos',17,'change_medicamentos'),(67,'Can delete medicamentos',17,'delete_medicamentos'),(68,'Can view medicamentos',17,'view_medicamentos'),(69,'Can add principio activo',18,'add_principioactivo'),(70,'Can change principio activo',18,'change_principioactivo'),(71,'Can delete principio activo',18,'delete_principioactivo'),(72,'Can view principio activo',18,'view_principioactivo'),(73,'Can add region',19,'add_region'),(74,'Can change region',19,'change_region'),(75,'Can delete region',19,'delete_region'),(76,'Can view region',19,'view_region'),(77,'Can add tipo_usuario',20,'add_tipo_usuario'),(78,'Can change tipo_usuario',20,'change_tipo_usuario'),(79,'Can delete tipo_usuario',20,'delete_tipo_usuario'),(80,'Can view tipo_usuario',20,'view_tipo_usuario'),(81,'Can add via adminstracion',21,'add_viaadminstracion'),(82,'Can change via adminstracion',21,'change_viaadminstracion'),(83,'Can delete via adminstracion',21,'delete_viaadminstracion'),(84,'Can view via adminstracion',21,'view_viaadminstracion'),(85,'Can add usuario ficha',22,'add_usuarioficha'),(86,'Can change usuario ficha',22,'change_usuarioficha'),(87,'Can delete usuario ficha',22,'delete_usuarioficha'),(88,'Can view usuario ficha',22,'view_usuarioficha'),(89,'Can add quimico farmaceutico encargado',23,'add_quimicofarmaceuticoencargado'),(90,'Can change quimico farmaceutico encargado',23,'change_quimicofarmaceuticoencargado'),(91,'Can delete quimico farmaceutico encargado',23,'delete_quimicofarmaceuticoencargado'),(92,'Can view quimico farmaceutico encargado',23,'view_quimicofarmaceuticoencargado'),(93,'Can add provincia',24,'add_provincia'),(94,'Can change provincia',24,'change_provincia'),(95,'Can delete provincia',24,'delete_provincia'),(96,'Can view provincia',24,'view_provincia'),(97,'Can add paciente receta',25,'add_pacientereceta'),(98,'Can change paciente receta',25,'change_pacientereceta'),(99,'Can delete paciente receta',25,'delete_pacientereceta'),(100,'Can view paciente receta',25,'view_pacientereceta'),(101,'Can add paciente ficha clinica',26,'add_pacientefichaclinica'),(102,'Can change paciente ficha clinica',26,'change_pacientefichaclinica'),(103,'Can delete paciente ficha clinica',26,'delete_pacientefichaclinica'),(104,'Can view paciente ficha clinica',26,'view_pacientefichaclinica'),(105,'Can add paciente familiar',27,'add_pacientefamiliar'),(106,'Can change paciente familiar',27,'change_pacientefamiliar'),(107,'Can delete paciente familiar',27,'delete_pacientefamiliar'),(108,'Can view paciente familiar',27,'view_pacientefamiliar'),(109,'Can add medicamentos descuento',28,'add_medicamentosdescuento'),(110,'Can change medicamentos descuento',28,'change_medicamentosdescuento'),(111,'Can delete medicamentos descuento',28,'delete_medicamentosdescuento'),(112,'Can view medicamentos descuento',28,'view_medicamentosdescuento'),(113,'Can add medicamento ficha tecnica',29,'add_medicamentofichatecnica'),(114,'Can change medicamento ficha tecnica',29,'change_medicamentofichatecnica'),(115,'Can delete medicamento ficha tecnica',29,'delete_medicamentofichatecnica'),(116,'Can view medicamento ficha tecnica',29,'view_medicamentofichatecnica'),(117,'Can add farmacia sucursal',30,'add_farmaciasucursal'),(118,'Can change farmacia sucursal',30,'change_farmaciasucursal'),(119,'Can delete farmacia sucursal',30,'delete_farmaciasucursal'),(120,'Can view farmacia sucursal',30,'view_farmaciasucursal'),(121,'Can add farmacia cesfam',31,'add_farmaciacesfam'),(122,'Can change farmacia cesfam',31,'change_farmaciacesfam'),(123,'Can delete farmacia cesfam',31,'delete_farmaciacesfam'),(124,'Can view farmacia cesfam',31,'view_farmaciacesfam'),(125,'Can add familiar paciente usuario',32,'add_familiarpacienteusuario'),(126,'Can change familiar paciente usuario',32,'change_familiarpacienteusuario'),(127,'Can delete familiar paciente usuario',32,'delete_familiarpacienteusuario'),(128,'Can view familiar paciente usuario',32,'view_familiarpacienteusuario');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-03-31 03:22:01.883255','3','FD',2,'[{\"changed\": {\"fields\": [\"Logo\"]}}]',1,1),(2,'2023-03-31 03:22:27.759091','3','FD',2,'[{\"changed\": {\"fields\": [\"Logo\"]}}]',1,1),(3,'2023-03-31 03:22:38.621853','3','FD',2,'[{\"changed\": {\"fields\": [\"Favicon\"]}}]',1,1),(4,'2023-03-31 03:22:46.348513','3','FD',2,'[{\"changed\": {\"fields\": [\"Favicon\"]}}]',1,1),(5,'2023-03-31 03:23:19.364829','3','FD',2,'[{\"changed\": {\"fields\": [\"Logo\"]}}]',1,1),(6,'2023-03-31 03:23:40.997585','3','FD',2,'[{\"changed\": {\"fields\": [\"Favicon\"]}}]',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (2,'admin','logentry'),(1,'admin_interface','theme'),(8,'app','cesfam'),(9,'app','comuna'),(10,'app','contacto'),(11,'app','diabetes'),(12,'app','enfermera'),(32,'app','familiarpacienteusuario'),(13,'app','farmacia'),(31,'app','farmaciacesfam'),(30,'app','farmaciasucursal'),(14,'app','hipertension'),(15,'app','laboratorio'),(29,'app','medicamentofichatecnica'),(16,'app','medicamentofraccionamiento'),(17,'app','medicamentos'),(28,'app','medicamentosdescuento'),(27,'app','pacientefamiliar'),(26,'app','pacientefichaclinica'),(25,'app','pacientereceta'),(18,'app','principioactivo'),(24,'app','provincia'),(23,'app','quimicofarmaceuticoencargado'),(19,'app','region'),(20,'app','tipo_usuario'),(7,'app','usuario'),(22,'app','usuarioficha'),(21,'app','viaadminstracion'),(4,'auth','group'),(3,'auth','permission'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-03-31 03:17:01.774692'),(2,'contenttypes','0002_remove_content_type_name','2023-03-31 03:17:01.872865'),(3,'auth','0001_initial','2023-03-31 03:17:02.170671'),(4,'auth','0002_alter_permission_name_max_length','2023-03-31 03:17:02.242159'),(5,'auth','0003_alter_user_email_max_length','2023-03-31 03:17:02.258671'),(6,'auth','0004_alter_user_username_opts','2023-03-31 03:17:02.274848'),(7,'auth','0005_alter_user_last_login_null','2023-03-31 03:17:02.287724'),(8,'auth','0006_require_contenttypes_0002','2023-03-31 03:17:02.294204'),(9,'auth','0007_alter_validators_add_error_messages','2023-03-31 03:17:02.307078'),(10,'auth','0008_alter_user_username_max_length','2023-03-31 03:17:02.320071'),(11,'auth','0009_alter_user_last_name_max_length','2023-03-31 03:17:02.334433'),(12,'auth','0010_alter_group_name_max_length','2023-03-31 03:17:02.398742'),(13,'auth','0011_update_proxy_permissions','2023-03-31 03:17:02.411538'),(14,'auth','0012_alter_user_first_name_max_length','2023-03-31 03:17:02.423021'),(15,'app','0001_initial','2023-03-31 03:17:06.130151'),(16,'admin','0001_initial','2023-03-31 03:17:06.278843'),(17,'admin','0002_logentry_remove_auto_add','2023-03-31 03:17:06.297823'),(18,'admin','0003_logentry_add_action_flag_choices','2023-03-31 03:17:06.319713'),(19,'admin_interface','0001_initial','2023-03-31 03:17:06.410860'),(20,'admin_interface','0002_add_related_modal','2023-03-31 03:17:06.596241'),(21,'admin_interface','0003_add_logo_color','2023-03-31 03:17:06.643722'),(22,'admin_interface','0004_rename_title_color','2023-03-31 03:17:06.662242'),(23,'admin_interface','0005_add_recent_actions_visible','2023-03-31 03:17:06.717889'),(24,'admin_interface','0006_bytes_to_str','2023-03-31 03:17:06.813680'),(25,'admin_interface','0007_add_favicon','2023-03-31 03:17:06.892050'),(26,'admin_interface','0008_change_related_modal_background_opacity_type','2023-03-31 03:17:06.992661'),(27,'admin_interface','0009_add_enviroment','2023-03-31 03:17:07.092699'),(28,'admin_interface','0010_add_localization','2023-03-31 03:17:07.122708'),(29,'admin_interface','0011_add_environment_options','2023-03-31 03:17:07.248319'),(30,'admin_interface','0012_update_verbose_names','2023-03-31 03:17:07.261574'),(31,'admin_interface','0013_add_related_modal_close_button','2023-03-31 03:17:07.310527'),(32,'admin_interface','0014_name_unique','2023-03-31 03:17:07.339038'),(33,'admin_interface','0015_add_language_chooser_active','2023-03-31 03:17:07.391678'),(34,'admin_interface','0016_add_language_chooser_display','2023-03-31 03:17:07.448209'),(35,'admin_interface','0017_change_list_filter_dropdown','2023-03-31 03:17:07.460867'),(36,'admin_interface','0018_theme_list_filter_sticky','2023-03-31 03:17:07.518247'),(37,'admin_interface','0019_add_form_sticky','2023-03-31 03:17:07.628594'),(38,'admin_interface','0020_module_selected_colors','2023-03-31 03:17:07.842897'),(39,'admin_interface','0021_file_extension_validator','2023-03-31 03:17:07.870437'),(40,'admin_interface','0022_add_logo_max_width_and_height','2023-03-31 03:17:07.989437'),(41,'admin_interface','0023_theme_foldable_apps','2023-03-31 03:17:08.068148'),(42,'admin_interface','0024_remove_theme_css','2023-03-31 03:17:08.176457'),(43,'admin_interface','0025_theme_language_chooser_control','2023-03-31 03:17:08.239892'),(44,'admin_interface','0026_theme_list_filter_highlight','2023-03-31 03:17:08.295329'),(45,'admin_interface','0027_theme_list_filter_removal_links','2023-03-31 03:17:08.368112'),(46,'admin_interface','0028_theme_show_fieldsets_as_tabs_and_more','2023-03-31 03:17:08.474209'),(47,'sessions','0001_initial','2023-03-31 03:17:08.543977');
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
INSERT INTO `django_session` VALUES ('jxmhywjb24d37r6lohsiom9wtnyc9asl','.eJxVjDsOwjAQRO_iGln-xD9K-pzBWq_XOIAcKU4qxN1JpBRQjTTvzbxZhG2tceu0xCmzK5Ps8tslwCe1A-QHtPvMcW7rMiV-KPyknY9zptftdP8OKvS6r8kUQUXoAhocoVXKFmWlVNrsgWmQiFL7koNKwYDM3jsxWK9dyl4Fwz5f4H03QA:1pi5K5:p-WIxeBNVskV8FaqU1_GJ6BFjeIOWRYQN9ZSrO4UpVg','2023-04-14 03:21:05.442076');
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

-- Dump completed on 2023-03-31  3:42:36

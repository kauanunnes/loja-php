-- MariaDB dump 10.19  Distrib 10.4.22-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: loja
-- ------------------------------------------------------
-- Server version	10.4.22-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carrinho`
--

DROP TABLE IF EXISTS `carrinho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrinho` (
  `id_user` int(11) NOT NULL,
  `content` mediumtext DEFAULT '{}',
  PRIMARY KEY (`id_user`),
  CONSTRAINT `carrinho_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrinho`
--

LOCK TABLES `carrinho` WRITE;
/*!40000 ALTER TABLE `carrinho` DISABLE KEYS */;
INSERT INTO `carrinho` VALUES (1,'{\"30\":{\"qtd\": 2}}'),(2,'{}'),(3,'{}'),(4,'{}'),(6,'{\"19\":{\"qtd\":2}}'),(11,'{}'),(18,'{}'),(22,'{}'),(23,'{}'),(24,'{}'),(25,'{}'),(26,'{}'),(27,'{}'),(28,'{}');
/*!40000 ALTER TABLE `carrinho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_pagamento` varchar(30) DEFAULT NULL,
  `confirmacao` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,'Credit Card',1),(2,'Credit Card',1),(3,'Credit Card',1),(4,'Credit Card',1),(5,'Credit Card',1),(6,'Credit Card',1),(7,'Credit Card',1),(8,'Credit Card',1),(9,'Credit Card',1),(10,'PIX',1),(11,'Cartão de Crédito',1),(12,'PIX',1),(13,'PIX',1);
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `data_criacao` date DEFAULT NULL,
  `marca` varchar(20) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (17,'Kuba Disco','Fone para musicas classicas','fone de ouvido',800,'2020-12-31','Kuba','https://kuba.audio/pub/media/catalog/product/cache/646ddd7c192bc24f4b4bb53d51f356ea/k/u/kuba_disco_2_classico_principal-custom_1_3.png'),(18,'KZ ZSN','Fone para tons equilibrados','fone de ouvido',210,'2020-12-31','KZ',NULL),(19,'Kz ZS10 Pro','Fone perfeito com 10 armaduras balanceadas, vc n vai se arrepender, na moral','fone de ouvido',190,'2020-12-31','KZ',NULL),(20,'Astro A50','Fone Gamer Bluetooth lindo','fone de ouvido',1800,'2020-12-31','Astro',NULL),(21,'AirPods Pro','Fone Caro da Apple','fone de ouvido',1700,'2020-12-31','Apple',NULL),(22,'AirDots','Fone q qse certamente deve ser falsificado','fone de ouvido',150,'2020-12-31','Chinese democracy',NULL),(23,'Scylla','Fone gamer q vai querbrar em 3 meses','fone de ouvido',250,'2020-12-31','RadDragon',NULL),(24,'JBL T500 BT','Fone casual com mais grave que deveria','fone de ouvido',210,'2020-12-31','JBL',NULL),(25,'Havit','Fone indie','fone de ouvido',190,'2020-12-31','Havit',NULL),(26,'Arcano shp800','Fone muito idie, mas ótma qualidade','fone de ouvido',280,'2020-12-31','Arcano',NULL),(27,'Razer Cracken','Um dos melhores fones gamers em qualidade de audio','fone de ouvido',190,'2020-12-31','Razer',NULL),(28,'JBL Qauntum one','JBL gamer primium','fone de ouvido',1100,'2020-12-31','JBL',NULL),(29,'Sony Pulse','para PS5','fone de ouvido',600,'2020-12-31','Sony',NULL),(30,'moonleader mk1','melhor teclado do mundo','teclado mecanico',2000,'2020-12-31','ZSA','https://imgs.extra.com.br/1521784115/1xg.jpg?imwidth=500'),(31,'corsai k55','teclado mecanico basico','teclado mecanico',180,NULL,'Corsair',NULL),(32,'Keychron K4','teclado mecanico wireless with back ligth ','teclado mecanico',890,NULL,'Kaychron',NULL),(33,'KZ ZSN','Fone para tons equilibrados','fone de ouvido',210,'2020-12-31','KZ','https://m.media-amazon.com/images/I/61IKpyXMtUL._AC_SY450_.jpg'),(34,'Kz ZS10 Pro','Fone perfeito com 10 armaduras balanceadas, vc n vai se arrepender, na moral','fone de ouvido',190,'2020-12-31','KZ',NULL),(35,'Astro A50','Fone Gamer Bluetooth lindo','fone de ouvido',1800,'2020-12-31','Astro',NULL),(36,'AirPods Pro','Fone Caro da Apple','fone de ouvido',1700,'2020-12-31','Apple',NULL),(37,'AirDots','Fone q qse certamente deve ser falsificado','fone de ouvido',150,'2020-12-31','Chinese democracy',NULL),(38,'Scylla','Fone gamer q vai querbrar em 3 meses','fone de ouvido',250,'2020-12-31','RadDragon',NULL),(39,'JBL T500 BT','Fone casual com mais grave que deveria','fone de ouvido',210,'2020-12-31','JBL',NULL),(40,'Havit','Fone indie','fone de ouvido',190,'2020-12-31','Havit',NULL),(41,'Arcano shp800','Fone muito idie, mas ótma qualidade','fone de ouvido',280,'2020-12-31','Arcano',NULL),(42,'Razer Cracken','Um dos melhores fones gamers em qualidade de audio','fone de ouvido',190,'2020-12-31','Razer',NULL),(43,'JBL Qauntum one','JBL gamer primium','fone de ouvido',1100,'2020-12-31','JBL',NULL),(44,'Sony Pulse','para PS5','fone de ouvido',600,'2020-12-31','Sony',NULL),(45,'moonleader mk1','melhor teclado do mundo','teclado mecanico',2000,'2020-12-31','ZSA',NULL),(46,'corsai k55','teclado mecanico basico','teclado mecanico',180,NULL,'Corsair',NULL),(47,'Keychron K4','teclado mecanico wireless with back ligth ','teclado mecanico',890,NULL,'Kaychron',NULL);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `senha` varchar(128) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `email_2` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'kaua','kaua@puc','1234@vai','11111111111'),(2,'luiz','luiz@puc','1234@vai','-918475028'),(3,'andre','andre@puc','1234@vai','16375371740'),(4,'lino','lino@puc','1234@vai','55732750380'),(6,'Kauã','kaua@email.com','123456','00000000'),(11,'Kauã Nunes','kaua2@email.com','123456','11111111111'),(14,'Kaua','kaua@hotmail.com','123456','12372317831'),(15,'henrique','henrique@henrique.com','123456','12345678911'),(18,'henrique','henrique@email.com','123456','43431241231'),(22,'kevin','kevin@email.com','123456','55555555555'),(23,'gabriel','gabriel@email.com','123456','21367381263'),(24,'gggg','g@email.com','213456','26715612376'),(25,'dasuhdasasd','ju@email.com','123456','21897327861'),(26,'banana','banana@email.com','1','32153621787'),(27,'dsajdsa','k@dev.to','12','21378231673'),(28,'Juliana Nunes','juliana@email.com','123456','38712371289');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `pagamento_id` int(11) NOT NULL,
  `valor_total` float DEFAULT NULL,
  `cupom_desconto` varchar(15) DEFAULT NULL,
  `data_venda` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `pagamento_id` (`pagamento_id`),
  CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `venda_ibfk_2` FOREIGN KEY (`pagamento_id`) REFERENCES `pagamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (1,6,6,1410,NULL,'2022-11-07 23:21:06'),(2,6,6,1410,NULL,'2022-11-07 23:21:06'),(3,6,7,1410,NULL,'2022-11-07 23:25:31'),(4,6,8,1010,NULL,'2022-11-07 23:29:29'),(5,6,9,210,NULL,'2022-11-08 00:44:07'),(6,6,10,800,NULL,'2022-11-08 00:48:46'),(7,25,11,800,NULL,'2022-11-08 01:29:54'),(8,28,12,1300,NULL,'2022-11-08 23:31:41'),(9,28,13,1300,NULL,'2022-11-08 23:31:41');
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda_produto`
--

DROP TABLE IF EXISTS `venda_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda_produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produto_id` int(11) NOT NULL,
  `venda_id` int(11) NOT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_id` (`produto_id`),
  KEY `venda_id` (`venda_id`),
  CONSTRAINT `venda_produto_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id`),
  CONSTRAINT `venda_produto_ibfk_2` FOREIGN KEY (`venda_id`) REFERENCES `venda` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda_produto`
--

LOCK TABLES `venda_produto` WRITE;
/*!40000 ALTER TABLE `venda_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `venda_produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-09 18:05:15

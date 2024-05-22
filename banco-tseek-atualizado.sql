-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: tseek
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `assinatura`
--

DROP TABLE IF EXISTS `assinatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assinatura` (
  `id_assinatura` int NOT NULL AUTO_INCREMENT,
  `tipo_assinatura` varchar(45) DEFAULT NULL COMMENT 'mensal ou anual e etc.',
  `data_inicio` date DEFAULT NULL,
  `data_termino` date DEFAULT NULL,
  PRIMARY KEY (`id_assinatura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assinatura`
--

LOCK TABLES `assinatura` WRITE;
/*!40000 ALTER TABLE `assinatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `assinatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campeonato`
--

DROP TABLE IF EXISTS `campeonato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campeonato` (
  `id_campeonato` int NOT NULL AUTO_INCREMENT,
  `nome_campeonato` varchar(45) NOT NULL,
  `regras` varchar(45) DEFAULT NULL,
  `num_equipes` int NOT NULL,
  `num_participantes` int NOT NULL,
  `premio` double DEFAULT NULL,
  `local` varchar(45) NOT NULL,
  `preco_inscricao` varchar(45) DEFAULT NULL,
  `campeonatocol` double DEFAULT NULL,
  `link_inscricao` varchar(80) DEFAULT NULL,
  `data` varchar(45) NOT NULL,
  `pontuacao` int DEFAULT NULL,
  `colocacao` int DEFAULT NULL,
  PRIMARY KEY (`id_campeonato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campeonato`
--

LOCK TABLES `campeonato` WRITE;
/*!40000 ALTER TABLE `campeonato` DISABLE KEYS */;
/*!40000 ALTER TABLE `campeonato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato`
--

DROP TABLE IF EXISTS `candidato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidato` (
  `id_candidato` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `apelido` varchar(16) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `genero` varchar(10) NOT NULL,
  `idade` int NOT NULL,
  `estado` varchar(45) NOT NULL,
  `habilidade` text NOT NULL,
  `descricao` text NOT NULL,
  PRIMARY KEY (`id_candidato`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `id_candidato_UNIQUE` (`id_candidato`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato`
--

LOCK TABLES `candidato` WRITE;
/*!40000 ALTER TABLE `candidato` DISABLE KEYS */;
INSERT INTO `candidato` VALUES (1,'Emilly Santos','DarkQueen','emilly@gmail.com','1234','','',0,'','',''),(2,'Thiago Xavier','Xavier','thiago@gmail.com','123','','',0,'','',''),(15,'Kaue Silva','Kaue','kaue@gmail.com','1234','','',0,'','',''),(16,'Davi','Davi','davi@gmail.com','1234','','',0,'','',''),(17,'Danilo da Silva','Danilo','danilo@gmail.com','1234','','',0,'','',''),(18,'Vitor Henrique','Vitor','vitor@gmail.com','1234','','',0,'','',''),(19,'Matheus','Matheus','matheus@gmail.com','1234','','',0,'','',''),(20,'Bloom Winx','Bloom','bloom@gmail.com','1234','','',0,'','',''),(21,'Darling','Zero Two','darling@gmail.com','1234','','',0,'','',''),(31,'Bruna','JujubadoMal','bruna@gmail.com','1234','','',0,'','',''),(37,'teste','teste','teste@teste.com','1234','20240519231818571.jpg','',0,'','','');
/*!40000 ALTER TABLE `candidato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato_equipe`
--

DROP TABLE IF EXISTS `candidato_equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidato_equipe` (
  `candidato_id_candidato` int NOT NULL,
  `equipe_id_equipe` int NOT NULL,
  PRIMARY KEY (`candidato_id_candidato`,`equipe_id_equipe`),
  KEY `fk_candidato_has_equipe_equipe1_idx` (`equipe_id_equipe`),
  KEY `fk_candidato_has_equipe_candidato1_idx` (`candidato_id_candidato`),
  CONSTRAINT `fk_candidato_has_equipe_candidato1` FOREIGN KEY (`candidato_id_candidato`) REFERENCES `candidato` (`id_candidato`),
  CONSTRAINT `fk_candidato_has_equipe_equipe1` FOREIGN KEY (`equipe_id_equipe`) REFERENCES `equipe` (`id_equipe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato_equipe`
--

LOCK TABLES `candidato_equipe` WRITE;
/*!40000 ALTER TABLE `candidato_equipe` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidato_equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidato_vaga`
--

DROP TABLE IF EXISTS `candidato_vaga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidato_vaga` (
  `candidato_id_candidato` int NOT NULL,
  `vaga_id_vaga` int NOT NULL,
  KEY `fk_candidato_vaga_candidato1_idx` (`candidato_id_candidato`),
  KEY `fk_candidato_vaga_vaga1_idx` (`vaga_id_vaga`),
  CONSTRAINT `fk_candidato_vaga_candidato1` FOREIGN KEY (`candidato_id_candidato`) REFERENCES `candidato` (`id_candidato`),
  CONSTRAINT `fk_candidato_vaga_vaga1` FOREIGN KEY (`vaga_id_vaga`) REFERENCES `vaga` (`id_vaga`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidato_vaga`
--

LOCK TABLES `candidato_vaga` WRITE;
/*!40000 ALTER TABLE `candidato_vaga` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidato_vaga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipe`
--

DROP TABLE IF EXISTS `equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipe` (
  `id_equipe` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `descricao` text,
  `status` text,
  `data_criacao_time` date NOT NULL,
  `foto` varchar(255) NOT NULL,
  PRIMARY KEY (`id_equipe`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe`
--

LOCK TABLES `equipe` WRITE;
/*!40000 ALTER TABLE `equipe` DISABLE KEYS */;
INSERT INTO `equipe` VALUES (1,'Winx','As fadinhas','ativo','0000-00-00',''),(2,'Os incriveis',NULL,'ativo','0000-00-00',''),(3,'The Lady\'s',NULL,'ativo','0000-00-00',''),(4,'Stray Kids',NULL,'ativo','0000-00-00',''),(5,'Ateez',NULL,'ativo','0000-00-00',''),(6,'Toxic\'s','Mais tóxicos que nós não há','ativo','0000-00-00','');
/*!40000 ALTER TABLE `equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipe_jogo`
--

DROP TABLE IF EXISTS `equipe_jogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipe_jogo` (
  `jogo_id_jogo` int NOT NULL,
  `equipe_id_equipe` int NOT NULL,
  `rank_id_rank` int NOT NULL,
  `placar` decimal(10,0) NOT NULL,
  `status` enum('Vencedor','Perdedor','Empate') NOT NULL,
  KEY `fk_equipe_jogo_jogo1_idx` (`jogo_id_jogo`),
  KEY `fk_equipe_jogo_equipe1_idx` (`equipe_id_equipe`),
  CONSTRAINT `fk_equipe_jogo_equipe1` FOREIGN KEY (`equipe_id_equipe`) REFERENCES `equipe` (`id_equipe`),
  CONSTRAINT `fk_equipe_jogo_jogo1` FOREIGN KEY (`jogo_id_jogo`) REFERENCES `jogo` (`id_jogo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe_jogo`
--

LOCK TABLES `equipe_jogo` WRITE;
/*!40000 ALTER TABLE `equipe_jogo` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipe_jogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipe_plano`
--

DROP TABLE IF EXISTS `equipe_plano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipe_plano` (
  `equipe_id_equipe` int NOT NULL,
  `pagamento_id_pagamento` int NOT NULL,
  `assinatura_id_assinatura` int NOT NULL,
  KEY `fk_equipe_plano_equipe1_idx` (`equipe_id_equipe`),
  KEY `fk_equipe_plano_pagamento1_idx` (`pagamento_id_pagamento`),
  KEY `fk_equipe_plano_assinatura1_idx` (`assinatura_id_assinatura`),
  CONSTRAINT `fk_equipe_plano_assinatura1` FOREIGN KEY (`assinatura_id_assinatura`) REFERENCES `assinatura` (`id_assinatura`),
  CONSTRAINT `fk_equipe_plano_equipe1` FOREIGN KEY (`equipe_id_equipe`) REFERENCES `equipe` (`id_equipe`),
  CONSTRAINT `fk_equipe_plano_pagamento1` FOREIGN KEY (`pagamento_id_pagamento`) REFERENCES `pagamento` (`id_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipe_plano`
--

LOCK TABLES `equipe_plano` WRITE;
/*!40000 ALTER TABLE `equipe_plano` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipe_plano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcao`
--

DROP TABLE IF EXISTS `funcao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcao` (
  `id_funcao` int NOT NULL AUTO_INCREMENT,
  `candidato_equipe_candidato_id_candidato` int NOT NULL,
  `candidato_equipe_equipe_id_equipe` int NOT NULL,
  `nome_funcao` varchar(45) NOT NULL,
  `descricao_funcao` text,
  PRIMARY KEY (`id_funcao`),
  KEY `fk_funcao_candidato_equipe1_idx` (`candidato_equipe_candidato_id_candidato`,`candidato_equipe_equipe_id_equipe`),
  CONSTRAINT `fk_funcao_candidato_equipe1` FOREIGN KEY (`candidato_equipe_candidato_id_candidato`, `candidato_equipe_equipe_id_equipe`) REFERENCES `candidato_equipe` (`candidato_id_candidato`, `equipe_id_equipe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcao`
--

LOCK TABLES `funcao` WRITE;
/*!40000 ALTER TABLE `funcao` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `id_genero` int NOT NULL AUTO_INCREMENT,
  `nome_genero` varchar(45) NOT NULL,
  `descricao_genero` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero_jogo`
--

DROP TABLE IF EXISTS `genero_jogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero_jogo` (
  `jogo_id_jogo` int NOT NULL,
  `categoria_id_categoria` int NOT NULL,
  KEY `fk_categoriaxjogo_jogo1_idx` (`jogo_id_jogo`),
  KEY `fk_categoriaxjogo_categoria1_idx` (`categoria_id_categoria`),
  CONSTRAINT `fk_categoriaxjogo_categoria1` FOREIGN KEY (`categoria_id_categoria`) REFERENCES `genero` (`id_genero`),
  CONSTRAINT `fk_categoriaxjogo_jogo1` FOREIGN KEY (`jogo_id_jogo`) REFERENCES `jogo` (`id_jogo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero_jogo`
--

LOCK TABLES `genero_jogo` WRITE;
/*!40000 ALTER TABLE `genero_jogo` DISABLE KEYS */;
/*!40000 ALTER TABLE `genero_jogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogo`
--

DROP TABLE IF EXISTS `jogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jogo` (
  `id_jogo` int NOT NULL AUTO_INCREMENT,
  `nome_jogo` varchar(45) NOT NULL,
  `data_hora` date NOT NULL,
  `resultado` varchar(45) NOT NULL,
  `foto` varchar(255) NOT NULL,
  PRIMARY KEY (`id_jogo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogo`
--

LOCK TABLES `jogo` WRITE;
/*!40000 ALTER TABLE `jogo` DISABLE KEYS */;
INSERT INTO `jogo` VALUES (1,'Mobile Legends','0000-00-00','','');
/*!40000 ALTER TABLE `jogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jogo_campeonato`
--

DROP TABLE IF EXISTS `jogo_campeonato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jogo_campeonato` (
  `jogo_id_jogo` int NOT NULL,
  `campeonato_id_campeonato` int NOT NULL,
  KEY `fk_jogo_campeonato_jogo1_idx` (`jogo_id_jogo`),
  KEY `fk_jogo_campeonato_campeonato1_idx` (`campeonato_id_campeonato`),
  CONSTRAINT `fk_jogo_campeonato_campeonato1` FOREIGN KEY (`campeonato_id_campeonato`) REFERENCES `campeonato` (`id_campeonato`),
  CONSTRAINT `fk_jogo_campeonato_jogo1` FOREIGN KEY (`jogo_id_jogo`) REFERENCES `jogo` (`id_jogo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jogo_campeonato`
--

LOCK TABLES `jogo_campeonato` WRITE;
/*!40000 ALTER TABLE `jogo_campeonato` DISABLE KEYS */;
/*!40000 ALTER TABLE `jogo_campeonato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modalidade`
--

DROP TABLE IF EXISTS `modalidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modalidade` (
  `id_modalidade` int NOT NULL AUTO_INCREMENT,
  `campeonato_id_campeonato` int NOT NULL,
  `nome_modalidade` varchar(45) NOT NULL COMMENT 'Modalidade: refere-se a uma categoria específica de jogo com características e regras distintas. Por exemplo, "FIFA" é uma modalidade de jogo de futebol virtual, enquanto "League of Legends" é uma modalidade de jogo de estratégia em tempo real. As modalidades são determinadas pelo tipo de jogo e seu formato específico.\n\nGênero: refere-se a uma classificação mais ampla dos jogos com base em elementos como a mecânica de jogo, o estilo visual, o tema e a narrativa. Alguns exemplos de gêneros de jogos são "ação", "aventura", "estratégia", "RPG" e "esportes". O gênero abrange várias modalidades de jogos. Por exemplo, o gênero "esportes" inclui modalidades como futebol, basquete, tênis, entre outros.',
  PRIMARY KEY (`id_modalidade`),
  KEY `fk_modalidade_campeonato1_idx` (`campeonato_id_campeonato`),
  CONSTRAINT `fk_modalidade_campeonato1` FOREIGN KEY (`campeonato_id_campeonato`) REFERENCES `campeonato` (`id_campeonato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modalidade`
--

LOCK TABLES `modalidade` WRITE;
/*!40000 ALTER TABLE `modalidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `modalidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `id_pagamento` int NOT NULL AUTO_INCREMENT,
  `valor` double DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `metodo_pagamento` varchar(45) DEFAULT NULL COMMENT 'Cartão de crédito, Transferência bancaria, pix e etc.',
  PRIMARY KEY (`id_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portifolio`
--

DROP TABLE IF EXISTS `portifolio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portifolio` (
  `id_portifolio` int NOT NULL AUTO_INCREMENT,
  `candidato_id_candidato` int NOT NULL,
  `descricao_portifolio` varchar(45) DEFAULT NULL,
  `nome_jogador` varchar(45) DEFAULT NULL,
  `conquistas` text,
  `equipes_anteriores` varchar(45) DEFAULT NULL,
  `imagens` varchar(45) DEFAULT NULL,
  `videos` varchar(45) DEFAULT NULL,
  `contato` varchar(45) DEFAULT NULL,
  `avaliacoes` varchar(45) DEFAULT NULL COMMENT 'Avaliações ou Depoimentos feitos por outros usuários',
  PRIMARY KEY (`id_portifolio`),
  KEY `fk_portifolio_candidato1_idx` (`candidato_id_candidato`),
  CONSTRAINT `fk_portifolio_candidato1` FOREIGN KEY (`candidato_id_candidato`) REFERENCES `candidato` (`id_candidato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portifolio`
--

LOCK TABLES `portifolio` WRITE;
/*!40000 ALTER TABLE `portifolio` DISABLE KEYS */;
/*!40000 ALTER TABLE `portifolio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id_status` int NOT NULL AUTO_INCREMENT,
  `candidato_id_candidato` int NOT NULL,
  PRIMARY KEY (`id_status`),
  KEY `fk_status_candidato1_idx` (`candidato_id_candidato`),
  CONSTRAINT `fk_status_candidato1` FOREIGN KEY (`candidato_id_candidato`) REFERENCES `candidato` (`id_candidato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vaga`
--

DROP TABLE IF EXISTS `vaga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vaga` (
  `id_vaga` int NOT NULL AUTO_INCREMENT,
  `jogo` varchar(45) NOT NULL,
  `titulo_vaga` varchar(45) NOT NULL,
  `descricao_vaga` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'descrição detalhada da vaga, incluindo informações sobre habilidades necessárias, requisitos de experiência, horários de disponibilidade, etc.',
  `requisitos` text NOT NULL,
  `num_vagas` int NOT NULL,
  `status` enum('Aberta','Fechada','Em avaliação') DEFAULT NULL,
  `salario` varchar(45) DEFAULT NULL,
  `criacao` date NOT NULL COMMENT 'Data de criação da vaga',
  `encerramento` date NOT NULL,
  `jogo_id_jogo` int NOT NULL,
  PRIMARY KEY (`id_vaga`),
  UNIQUE KEY `id_vaga_UNIQUE` (`id_vaga`),
  KEY `fk_vaga_jogo1_idx` (`jogo_id_jogo`),
  CONSTRAINT `fk_vaga_jogo1` FOREIGN KEY (`jogo_id_jogo`) REFERENCES `jogo` (`id_jogo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaga`
--

LOCK TABLES `vaga` WRITE;
/*!40000 ALTER TABLE `vaga` DISABLE KEYS */;
INSERT INTO `vaga` VALUES (6,'Mobile Legends','Rotação','Ter que da a vida para deixar os outros vivos!','Paciente, onipresente e jogo de cintura.',2,NULL,'1.350','2022-10-01','0000-00-00',1),(7,'Mobile Legends','Mid Laner','','',3,NULL,'1.300','0000-00-00','0000-00-00',1),(8,'Mobile Legends','XP ','','',1,NULL,'1.350','0000-00-00','0000-00-00',1),(9,'Mobile Legends','Jungle','','',1,NULL,'1.400','0000-00-00','0000-00-00',1),(10,'Mobile Legends','Adc','','',4,NULL,'1.350','0000-00-00','0000-00-00',1);
/*!40000 ALTER TABLE `vaga` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-20 23:08:05

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26/11/2024 às 19:51
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `condominiosenai`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `apartamentos`
--

CREATE TABLE `apartamentos` (
  `id_apartamentos` int(11) NOT NULL,
  `id_condominio` int(11) DEFAULT NULL,
  `numero` varchar(13) NOT NULL,
  `andar` int(11) NOT NULL,
  `bloco` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `condominio`
--

CREATE TABLE `condominio` (
  `id_condominio` int(11) NOT NULL,
  `nome` text DEFAULT NULL,
  `endereco` text DEFAULT NULL,
  `cnpj` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `id_moradores` int(11) NOT NULL,
  `id_condominio` int(11) DEFAULT NULL,
  `cargo` varchar(13) DEFAULT NULL,
  `data_admissao` date DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `nome` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `moradores`
--

CREATE TABLE `moradores` (
  `id_moradores` int(11) NOT NULL,
  `id_apartamentos` int(11) DEFAULT NULL,
  `telefone` varchar(13) DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `nome` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `apartamentos`
--
ALTER TABLE `apartamentos`
  ADD PRIMARY KEY (`id_apartamentos`),
  ADD KEY `id_condominio` (`id_condominio`);

--
-- Índices de tabela `condominio`
--
ALTER TABLE `condominio`
  ADD PRIMARY KEY (`id_condominio`);

--
-- Índices de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`id_moradores`),
  ADD KEY `id_condominio` (`id_condominio`);

--
-- Índices de tabela `moradores`
--
ALTER TABLE `moradores`
  ADD PRIMARY KEY (`id_moradores`),
  ADD KEY `id_apartamentos` (`id_apartamentos`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `apartamentos`
--
ALTER TABLE `apartamentos`
  MODIFY `id_apartamentos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `condominio`
--
ALTER TABLE `condominio`
  MODIFY `id_condominio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  MODIFY `id_moradores` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `moradores`
--
ALTER TABLE `moradores`
  MODIFY `id_moradores` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `apartamentos`
--
ALTER TABLE `apartamentos`
  ADD CONSTRAINT `apartamentos_ibfk_1` FOREIGN KEY (`id_condominio`) REFERENCES `condominio` (`id_condominio`);

--
-- Restrições para tabelas `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD CONSTRAINT `funcionarios_ibfk_1` FOREIGN KEY (`id_condominio`) REFERENCES `condominio` (`id_condominio`);

--
-- Restrições para tabelas `moradores`
--
ALTER TABLE `moradores`
  ADD CONSTRAINT `moradores_ibfk_1` FOREIGN KEY (`id_apartamentos`) REFERENCES `apartamentos` (`id_apartamentos`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

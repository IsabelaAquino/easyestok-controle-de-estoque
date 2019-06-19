-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 22-Nov-2018 às 18:55
-- Versão do servidor: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `easyestok`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `entradas`
--

CREATE TABLE `entradas` (
  `id_entrada` int(11) NOT NULL,
  `produto_id_produto` int(11) DEFAULT NULL,
  `quant_entrada` int(11) NOT NULL,
  `nf` varchar(20) DEFAULT NULL,
  `tipo_entrada` varchar(25) DEFAULT NULL,
  `data` varchar(12) DEFAULT NULL,
  `motivo` varchar(60) DEFAULT NULL,
  `datatempo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `datacerta` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `entradas`
--

INSERT INTO `entradas` (`id_entrada`, `produto_id_produto`, `quant_entrada`, `nf`, `tipo_entrada`, `data`, `motivo`, `datatempo`, `datacerta`) VALUES
(1, 1, 200, '16220', 'Compra', '17/01/2018', NULL, '2018-01-22 19:25:42', '2018-01-17'),
(2, 2, 40, '16221', 'Compra', '17/01/2018', NULL, '2018-01-22 19:25:42', '2018-01-17'),
(4, 5, 10, '16222', 'Compra', '17/01/2018', NULL, '2018-01-22 19:25:42', '2018-01-22'),
(5, 1, 50, '16223', 'Compra', '17/01/2018', NULL, '2018-01-22 19:25:42', '2018-01-17'),
(6, 1, 50, NULL, 'Devolução', '19/01/2018', NULL, '2018-01-22 19:25:42', '2018-01-19'),
(7, 2, 40, NULL, 'Devolução', '19/01/2018', NULL, '2018-01-22 19:25:42', '2018-01-19'),
(8, 5, 10, NULL, 'Devolução', '19/01/2018', NULL, '2018-01-22 19:25:42', '2018-01-19'),
(9, 5, 5, NULL, 'Devolução', '19/01/2018', 'cliente desistiu da compra', '2018-01-22 19:25:42', '2018-01-19'),
(10, 1, 10, '16224', 'Compra', '22/01/2018', NULL, '2018-01-22 19:25:42', '2018-01-22'),
(11, 2, 10, NULL, 'Devolução', '22/01/2018', 'sem', '2018-01-22 19:25:42', '2018-01-22'),
(12, 5, 20, '16225', 'Compra', '27-01-2018', NULL, '2018-01-27 03:12:47', '2018-01-27'),
(13, 6, 10, NULL, 'Devolução', '10-01-2018', 'produto violado', '2018-01-27 03:13:55', '2018-01-10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `id_fornecedor` int(11) NOT NULL,
  `descricao_fornec` varchar(250) DEFAULT NULL,
  `descricao_rua` varchar(250) DEFAULT NULL,
  `descricao_bairro` varchar(250) DEFAULT NULL,
  `numero_endereco` varchar(20) DEFAULT NULL,
  `numero_cnpj` int(11) NOT NULL,
  `email_fornecedor` varchar(150) DEFAULT NULL,
  `telefone_fornecedor` varchar(20) DEFAULT NULL,
  `celular_fornecedor` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id_produto` int(11) NOT NULL,
  `cod_produto` varchar(10) DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `data` varchar(10) DEFAULT NULL,
  `local_estoque` varchar(250) DEFAULT NULL,
  `grupo_categoria` varchar(250) DEFAULT NULL,
  `estoque_minimo` int(11) NOT NULL,
  `estoque_maximo` int(11) NOT NULL,
  `validade` varchar(10) DEFAULT NULL,
  `unid_prod` varchar(20) DEFAULT NULL,
  `total_entradas` int(11) DEFAULT NULL,
  `datatempo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id_produto`, `cod_produto`, `nome`, `descricao`, `quantidade`, `data`, `local_estoque`, `grupo_categoria`, `estoque_minimo`, `estoque_maximo`, `validade`, `unid_prod`, `total_entradas`, `datatempo`) VALUES
(1, '1', 'Arroz Sepé ', 'sem descrição', 95, '12/01/2018', 'prateleira 01 piso 1', 'Não Perecível', 100, 500, '31/01/2022', 'Kg', NULL, '2018-01-22 19:17:32'),
(2, '2', 'feijão codil', 'sem descriçao', 100, '16/01/2018', 'piso 3 prateleira 5', 'Não Perecível', 50, 200, '16/01/2022', 'Kg', NULL, '2018-01-22 19:17:32'),
(5, '7', 'sabão em pó OMO', 'sem descrição', 48, '22/01/2018', 'p 1', 'Perecível', 10, 80, '22/01/2019', 'Kg', NULL, '2018-01-22 19:17:32'),
(6, '3', 'farinha pachá', 'farinha branca', 10, '22/01/2018', 'prateleira 15 piso 3', 'Perecível', 20, 60, '22/01/2020', 'Kg', NULL, '2018-01-22 19:33:16');

-- --------------------------------------------------------

--
-- Estrutura da tabela `saidas`
--

CREATE TABLE `saidas` (
  `id_saida` int(11) NOT NULL,
  `produto_id_produto` int(11) DEFAULT NULL,
  `quant_saida` int(11) NOT NULL,
  `nf` varchar(20) NOT NULL,
  `tipo_saida` varchar(25) DEFAULT NULL,
  `data` varchar(12) DEFAULT NULL,
  `datatempo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `datacerta` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `saidas`
--

INSERT INTO `saidas` (`id_saida`, `produto_id_produto`, `quant_saida`, `nf`, `tipo_saida`, `data`, `datatempo`, `datacerta`) VALUES
(1, 2, 100, '20235', 'Ajuste de Estoque', '22/01/2018', '2018-01-22 19:21:02', '2018-01-22'),
(2, 2, 100, '20236', 'Venda', '22/01/2018', '2018-01-22 19:21:02', '2018-01-22'),
(4, 2, 10, '20238', 'Venda', '22/01/2018', '2018-01-22 19:21:02', '2018-01-22'),
(5, 1, 5, '20364', 'Venda', '11-01-2018', '2018-01-27 03:14:49', '2018-01-11');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `login` varchar(40) NOT NULL,
  `senha` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `login`, `senha`) VALUES
(1, 'Isabela Aquino', 'admin', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `entradas`
--
ALTER TABLE `entradas`
  ADD PRIMARY KEY (`id_entrada`),
  ADD UNIQUE KEY `nf` (`nf`),
  ADD UNIQUE KEY `nf_2` (`nf`),
  ADD KEY `produto_id_produto` (`produto_id_produto`);

--
-- Indexes for table `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`id_fornecedor`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_produto`);

--
-- Indexes for table `saidas`
--
ALTER TABLE `saidas`
  ADD PRIMARY KEY (`id_saida`),
  ADD UNIQUE KEY `nf` (`nf`),
  ADD KEY `produto_id_produto` (`produto_id_produto`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `senha` (`senha`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `entradas`
--
ALTER TABLE `entradas`
  MODIFY `id_entrada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `saidas`
--
ALTER TABLE `saidas`
  MODIFY `id_saida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `entradas`
--
ALTER TABLE `entradas`
  ADD CONSTRAINT `entradas_ibfk_1` FOREIGN KEY (`produto_id_produto`) REFERENCES `produtos` (`id_produto`);

--
-- Limitadores para a tabela `saidas`
--
ALTER TABLE `saidas`
  ADD CONSTRAINT `saidas_ibfk_1` FOREIGN KEY (`produto_id_produto`) REFERENCES `produtos` (`id_produto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

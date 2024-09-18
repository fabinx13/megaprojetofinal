-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11/09/2024 às 23:37
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
-- Banco de dados: `loja_virtual`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `administradores`
--

CREATE TABLE `administradores` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `administradores`
--

INSERT INTO `administradores` (`id`, `username`, `password_hash`) VALUES
(1, 'admin', '$2y$10$M/bu9eeju1TyHWJZujZ0l.iwA/VVE60VL6.FtXcZbnkJ5IhQoKlBK');

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens_pedido`
--

CREATE TABLE `itens_pedido` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `itens_pedido`
--

INSERT INTO `itens_pedido` (`id`, `pedido_id`, `produto_id`, `quantidade`, `preco`) VALUES
(65, 59, 9, 2, 500.00),
(66, 60, 9, 1, 500.00),
(67, 61, 9, 1, 500.00),
(68, 62, 9, 1, 500.00),
(69, 63, 12, 1, 400.00),
(70, 64, 14, 1, 500.00),
(71, 65, 9, 1, 500.00),
(72, 66, 9, 2, 500.00),
(73, 67, 11, 1, 300.00),
(74, 68, 9, 1, 500.00),
(75, 69, 9, 1, 500.00),
(76, 70, 9, 2, 500.00),
(77, 71, 9, 2, 500.00),
(78, 72, 9, 2, 500.00),
(79, 73, 9, 2, 500.00),
(80, 74, 9, 2, 500.00),
(81, 75, 9, 2, 500.00),
(82, 76, 9, 2, 500.00),
(83, 76, 11, 1, 300.00),
(84, 77, 9, 2, 500.00),
(85, 77, 11, 1, 300.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pendente',
  `data_pedido` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedidos`
--

INSERT INTO `pedidos` (`id`, `usuario_id`, `total`, `status`, `data_pedido`) VALUES
(1, 4, 110.00, 'Pendente', '2024-09-02 04:07:34'),
(2, 4, 2600.00, 'Pendente', '2024-09-02 04:10:22'),
(3, 4, 10.00, 'Pendente', '2024-09-02 04:13:32'),
(4, 4, 10.00, 'Pendente', '2024-09-02 04:15:14'),
(5, 4, 10.00, 'Pendente', '2024-09-02 04:17:42'),
(6, 4, 40.00, 'Pendente', '2024-09-02 04:27:31'),
(7, 4, 10.00, 'Pendente', '2024-09-02 04:29:48'),
(8, 4, 10.00, 'Pendente', '2024-09-02 04:31:48'),
(9, 4, 10.00, 'Pendente', '2024-09-02 04:33:17'),
(10, 4, 10.00, 'Pendente', '2024-09-02 04:36:08'),
(11, 4, 10.00, 'Pendente', '2024-09-02 04:36:34'),
(12, 1, 1330.00, 'Pendente', '2024-09-02 05:06:44'),
(13, 1, 10.00, 'Pendente', '2024-09-02 05:07:54'),
(14, 1, 20.00, 'Pendente', '2024-09-02 11:38:13'),
(15, 1, 1300.00, 'Pendente', '2024-09-02 11:38:26'),
(19, 1, 10.00, 'Pendente', '2024-09-02 12:05:00'),
(20, 1, 10.00, 'Pendente', '2024-09-02 13:08:36'),
(21, 1, 10.00, 'Pendente', '2024-09-02 13:08:47'),
(22, 1, 20.00, 'Pendente', '2024-09-02 13:16:55'),
(23, 1, 20.00, 'Pendente', '2024-09-02 13:16:57'),
(24, 1, 20.00, 'Pendente', '2024-09-02 13:17:36'),
(25, 1, 10.00, 'Pendente', '2024-09-02 13:17:47'),
(26, 1, 20.00, 'Pendente', '2024-09-02 13:20:07'),
(27, 1, 10.00, 'Pendente', '2024-09-02 13:20:16'),
(28, 1, 1350.00, 'Pendente', '2024-09-02 13:24:57'),
(29, 1, 10.00, 'Pendente', '2024-09-02 13:25:25'),
(30, 1, 70.00, 'Pendente', '2024-09-02 14:32:40'),
(31, 1, 10.00, 'Pendente', '2024-09-02 14:32:49'),
(32, 1, 1300.00, 'Pendente', '2024-09-02 14:33:28'),
(33, 1, 0.00, 'Pendente', '2024-09-02 15:04:35'),
(34, 1, 0.00, 'Pendente', '2024-09-02 15:04:39'),
(35, 1, 0.00, 'Pendente', '2024-09-02 15:04:43'),
(36, 1, 0.00, 'Pendente', '2024-09-02 15:05:31'),
(37, 1, 0.00, 'Pendente', '2024-09-02 15:05:39'),
(38, 1, 0.00, 'Pendente', '2024-09-02 15:10:25'),
(39, 1, 0.00, 'Pendente', '2024-09-02 15:11:06'),
(40, 1, 0.00, 'Pendente', '2024-09-02 15:11:26'),
(41, 1, 0.00, 'Pendente', '2024-09-02 15:11:41'),
(42, 1, 0.00, 'Pendente', '2024-09-02 15:18:05'),
(43, 1, 0.00, 'Pendente', '2024-09-02 15:18:12'),
(44, 1, 0.00, 'Pendente', '2024-09-02 15:18:16'),
(45, 1, 0.00, 'Pendente', '2024-09-02 15:18:24'),
(46, 1, 0.00, 'Pendente', '2024-09-02 15:20:00'),
(47, 1, 0.00, 'Pendente', '2024-09-02 15:20:05'),
(48, 1, 10.00, 'Pendente', '2024-09-02 15:24:54'),
(49, 1, 10.00, 'Pendente', '2024-09-02 15:25:00'),
(50, 1, 10.00, 'Pendente', '2024-09-02 15:27:40'),
(51, 1, 1010.00, 'Pendente', '2024-09-02 15:27:55'),
(52, 1, 1000.00, 'Pendente', '2024-09-02 15:28:30'),
(53, 1, 10.00, 'Pendente', '2024-09-02 15:38:00'),
(54, 1, 1010.00, 'Pendente', '2024-09-02 15:38:12'),
(55, 1, 1010.00, 'Pendente', '2024-09-02 15:48:26'),
(56, 1, 320.00, 'Pendente', '2024-09-02 16:12:56'),
(57, 5, 10.00, 'Pendente', '2024-09-02 16:21:28'),
(58, 5, 1010.00, 'Pendente', '2024-09-02 16:22:23'),
(59, 1, 1000.00, 'Pendente', '2024-09-02 16:29:29'),
(60, 6, 500.00, 'Pendente', '2024-09-02 16:30:27'),
(61, 1, 500.00, 'Pendente', '2024-09-02 21:40:27'),
(62, 1, 500.00, 'Pendente', '2024-09-02 21:42:53'),
(63, 1, 400.00, 'Pendente', '2024-09-03 13:32:46'),
(64, 1, 500.00, 'Pendente', '2024-09-03 16:45:02'),
(65, 9, 500.00, 'Pendente', '2024-09-03 19:27:37'),
(66, 1, 1000.00, 'Pendente', '2024-09-11 18:25:22'),
(67, 1, 300.00, 'Pendente', '2024-09-11 18:25:31'),
(68, 1, 500.00, 'aguardando', '2024-09-11 18:30:19'),
(69, 1, 500.00, 'aguardando', '2024-09-11 18:33:31'),
(70, 1, 1000.00, 'aguardando', '2024-09-11 18:33:45'),
(71, 1, 1000.00, 'aguardando', '2024-09-11 18:36:06'),
(72, 1, 1000.00, 'aguardando', '2024-09-11 18:37:19'),
(73, 1, 1000.00, 'aguardando', '2024-09-11 18:41:24'),
(74, 1, 1000.00, 'aguardando', '2024-09-11 18:42:10'),
(75, 1, 1000.00, 'aguardando', '2024-09-11 18:42:22'),
(76, 1, 1300.00, 'aguardando', '2024-09-11 18:52:20'),
(77, 1, 1300.00, 'aguardando', '2024-09-11 18:52:36');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `estoque` int(11) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `descricao`, `preco`, `estoque`, `imagem`, `categoria`, `foto`) VALUES
(9, 'Teste 50', 'dayhgidahsgikhagdsh', 500.00, NULL, NULL, NULL, 'WhatsApp Image 2023-08-28 at 10.14.28.jpeg'),
(11, 'Teste pais', 'testando', 300.00, NULL, NULL, NULL, 'nutriiamore.png'),
(12, 'Teste Éder', 'Testando', 400.00, NULL, NULL, NULL, 'WhatsApp Image 2024-08-22 at 09.24.08.jpeg'),
(14, 'Teste 50', 'adfsdsgdsdg', 500.00, NULL, NULL, NULL, 'pizza-de-frigideira-low-carb1200.jpg'),
(15, 'Teste turma Senac editando', 'Testando isso aqui', 100.00, NULL, NULL, NULL, 'maxresdefault (1).jpg'),
(16, 'Testando front', 'dgsfhddtjfyjhyjgk', 600.00, NULL, NULL, NULL, 'maxresdefault (2).jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `transacoes`
--

CREATE TABLE `transacoes` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `codigo_transacao` varchar(255) NOT NULL,
  `status` enum('Aprovado','Pendente','Cancelado') DEFAULT 'Pendente',
  `data_transacao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `data_cadastro`) VALUES
(1, 'Monique Emídio de oliveira', 'moniquemidio@gmail.com', '$2y$10$uufoQEEnYNgJG/F/nClWCOkxwisa5Tty5dfSTk/dGfb2g1tF6g46G', '2024-09-02 00:51:24'),
(2, 'Monique Emídio de oliveira', 'monique@gmail.com', '$2y$10$0qhtcaPsgGlaGVgBCvufveLafx3J/nR7hYVOP7bDJFLFDyMyXo75G', '2024-09-02 01:50:42'),
(3, 'Dica teste', 'teste@mail.com', '$2y$10$EmDyTV3X1lYwEEgqjRsj4eOtLOdghuedylbUoBKh6/7r39scQxh.e', '2024-09-02 02:05:23'),
(4, 'Testando', 'testando@mail.com', '$2y$10$CPpW0dvm1DFxjmxxznhDju.DxuhSEL27CPUad/DGMcVBR0HlYwnR.', '2024-09-02 03:30:12'),
(5, 'Moninha', 'mona@mail.com', '$2y$10$i9M.L.5vmBcrMThUbLSMU.NxZVb9VUYSiP9zitWSdrjNF8TiD4q9u', '2024-09-02 16:18:40'),
(6, 'Matheus', 'matheus@mail.com', '$2y$10$e/KvoDnqx.v7ng103AQ2aOwBuEuL7KmhMMhp.jIYj2ZfUIvkwJFYy', '2024-09-02 16:30:11'),
(7, 'Claudio', 'claudio@email.com', '$2y$10$m71q9F8FG4dCsZnShsc14.z5IbcwbyBg6mqBUtY8B.E/CcPxUQfOi', '2024-09-02 21:43:21'),
(8, 'Éder', 'eder@mail.com', '$2y$10$kgx782sv.HHdjaoHI4Or3.Qyi8FlZAiGhAm5szFKpd5WMerkwdLJ6', '2024-09-03 13:34:26'),
(9, 'Juscelino', 'juscelino@mail.com', '$2y$10$iSP4yJy0LKlPwDSDRqDQeOkHtSa3Ian.NOJdJVbUIbamN6rQn3AmW', '2024-09-03 19:26:48');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Índices de tabela `itens_pedido`
--
ALTER TABLE `itens_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pedido_id` (`pedido_id`),
  ADD KEY `fk_produto_id` (`produto_id`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `transacoes`
--
ALTER TABLE `transacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`pedido_id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `administradores`
--
ALTER TABLE `administradores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `itens_pedido`
--
ALTER TABLE `itens_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `transacoes`
--
ALTER TABLE `transacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `itens_pedido`
--
ALTER TABLE `itens_pedido`
  ADD CONSTRAINT `fk_pedido_id` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `fk_produto_id` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `itens_pedido_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `itens_pedido_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`);

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `transacoes`
--
ALTER TABLE `transacoes`
  ADD CONSTRAINT `transacoes_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

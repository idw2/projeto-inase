-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 20-Mar-2015 às 18:16
-- Versão do servidor: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `inasetest`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `banco_questoes`
--

CREATE TABLE IF NOT EXISTS `banco_questoes` (
  `id` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modo_exibicao` char(1) NOT NULL,
  `id_disciplina` int(11) NOT NULL,
  `revisor` int(11) NOT NULL,
  `ordem` int(11) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT '1',
  `owner` char(45) NOT NULL,
  `tipo` char(1) NOT NULL,
  `trash` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `banco_questoes_rel_perguntas`
--

CREATE TABLE IF NOT EXISTS `banco_questoes_rel_perguntas` (
  `id` int(11) NOT NULL,
  `id_banco_questao` int(11) NOT NULL,
  `id_pergunta` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `calendarios_anuais`
--

CREATE TABLE IF NOT EXISTS `calendarios_anuais` (
  `id` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ordem` int(11) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT '1',
  `owner` char(45) NOT NULL,
  `data_inicial` date NOT NULL,
  `data_final` date NOT NULL,
  `pratica` text,
  `professor` varchar(45) DEFAULT NULL,
  `trash` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `chamados`
--

CREATE TABLE IF NOT EXISTS `chamados` (
  `id` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ordem` int(11) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT '1',
  `owner` char(45) NOT NULL,
  `motivo_chamado` varchar(45) NOT NULL,
  `chamado` text NOT NULL,
  `upload` varchar(255) NOT NULL,
  `trash` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comunicacoes_internas`
--

CREATE TABLE IF NOT EXISTS `comunicacoes_internas` (
  `id` int(11) NOT NULL DEFAULT '0',
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ordem` int(11) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT '1',
  `owner` char(45) NOT NULL,
  `motivo_ci` varchar(45) NOT NULL,
  `ci` text NOT NULL,
  `upload` varchar(255) NOT NULL,
  `trash` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `convenios`
--

CREATE TABLE IF NOT EXISTS `convenios` (
  `id` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ordem` int(11) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT '1',
  `owner` char(45) NOT NULL,
  `convenio` varchar(70) NOT NULL,
  `tipo` char(1) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `especificacoes` blob NOT NULL,
  `tipo_curso` varchar(20) NOT NULL,
  `area` text NOT NULL,
  `preco` int(11) NOT NULL,
  `trash` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `convenios_rel_uploads`
--

CREATE TABLE IF NOT EXISTS `convenios_rel_uploads` (
  `id` int(11) NOT NULL,
  `id_convenio` int(11) NOT NULL,
  `id_upload` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cursos`
--

CREATE TABLE IF NOT EXISTS `cursos` (
  `id` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ordem` int(11) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT '1',
  `owner` char(45) NOT NULL,
  `titulo` varchar(70) NOT NULL,
  `tipo` char(1) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `especificacoes` blob NOT NULL,
  `area` text NOT NULL,
  `preco` int(11) NOT NULL,
  `duracao` varchar(25) NOT NULL,
  `trash` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cursos_rel_disciplinas`
--

CREATE TABLE IF NOT EXISTS `cursos_rel_disciplinas` (
  `id` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `id_disciplina` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cursos_rel_foruns`
--

CREATE TABLE IF NOT EXISTS `cursos_rel_foruns` (
  `id` int(11) NOT NULL,
  `id_cursos` int(11) NOT NULL,
  `id_forum` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cursos_rel_uploads`
--

CREATE TABLE IF NOT EXISTS `cursos_rel_uploads` (
  `id` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `id_upload` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `disciplinas`
--

CREATE TABLE IF NOT EXISTS `disciplinas` (
  `id` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `disciplina` varchar(45) NOT NULL,
  `ordem` int(11) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT '1',
  `owner` char(45) NOT NULL,
  `trash` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `emails`
--

CREATE TABLE IF NOT EXISTS `emails` (
  `id` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` char(1) NOT NULL DEFAULT '1',
  `ordem` int(11) NOT NULL DEFAULT '0',
  `owner` char(32) NOT NULL,
  `email` varchar(45) NOT NULL,
  `is_principal` char(1) NOT NULL,
  `trash` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `enderecos`
--

CREATE TABLE IF NOT EXISTS `enderecos` (
  `id` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` char(1) NOT NULL DEFAULT '1',
  `ordem` int(11) NOT NULL DEFAULT '0',
  `owner` char(32) NOT NULL,
  `logradouro` varchar(255) NOT NULL,
  `numero` varchar(45) NOT NULL,
  `complemento` varchar(100) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `uf` char(2) NOT NULL,
  `is_principal` char(1) NOT NULL,
  `trash` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `enquetes`
--

CREATE TABLE IF NOT EXISTS `enquetes` (
  `id` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ordem` int(11) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT '1',
  `owner` char(45) NOT NULL,
  `data_inicial` date NOT NULL,
  `data_final` date NOT NULL,
  `tipo` varchar(1) NOT NULL,
  `area_exibicao` char(1) NOT NULL,
  `trash` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `enquetes_rel_perguntas`
--

CREATE TABLE IF NOT EXISTS `enquetes_rel_perguntas` (
  `id` int(11) NOT NULL,
  `id_enquete` int(11) NOT NULL,
  `id_pergunta` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `enquetes_rel_perguntas_rel_respostas`
--

CREATE TABLE IF NOT EXISTS `enquetes_rel_perguntas_rel_respostas` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_resposta` int(11) NOT NULL,
  `id_pergunta` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `foruns`
--

CREATE TABLE IF NOT EXISTS `foruns` (
  `id` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` char(1) NOT NULL DEFAULT '1',
  `ordem` int(11) NOT NULL DEFAULT '0',
  `owner` char(32) NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `trash` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `foruns_rel_perguntas`
--

CREATE TABLE IF NOT EXISTS `foruns_rel_perguntas` (
  `id` int(11) NOT NULL,
  `id_forum` int(11) NOT NULL,
  `id_pergunta` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `logins`
--

CREATE TABLE IF NOT EXISTS `logins` (
  `id` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` char(1) NOT NULL DEFAULT '1',
  `ordem` int(11) NOT NULL DEFAULT '0',
  `owner` char(32) NOT NULL,
  `ip` char(12) NOT NULL,
  `trash` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `moderacoes`
--

CREATE TABLE IF NOT EXISTS `moderacoes` (
  `id` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ordem` int(11) NOT NULL DEFAULT '0',
  `owner` char(45) NOT NULL,
  `notificada` char(1) NOT NULL DEFAULT '0',
  `aprovada` char(1) NOT NULL DEFAULT '1',
  `id_notificador` char(11) NOT NULL,
  `id_aprovador` char(11) NOT NULL,
  `trash` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `observadores`
--

CREATE TABLE IF NOT EXISTS `observadores` (
  `id` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nom_tabela` varchar(45) NOT NULL,
  `owner` char(32) NOT NULL,
  `acao` varchar(45) NOT NULL,
  `trash` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `observadores`
--

INSERT INTO `observadores` (`id`, `dta`, `nom_tabela`, `owner`, `acao`, `trash`) VALUES
(1, '2015-03-19 21:51:58', 'pessoas', '1', 'insert', '0'),
(2, '2015-03-19 21:51:58', 'pessoas', '2', 'insert', '0'),
(3, '2015-03-19 21:51:58', 'pessoas', '3', 'insert', '0'),
(4, '2015-03-19 21:51:58', 'usuarios', '1', 'insert', '0'),
(5, '2015-03-19 21:51:58', 'usuarios', '2', 'insert', '0'),
(6, '2015-03-19 21:51:58', 'usuarios', '3', 'insert', '0'),
(7, '2015-03-19 21:51:58', 'usuarios_rel_pessoas', '1', 'insert', '0'),
(8, '2015-03-19 21:51:58', 'usuarios_rel_pessoas', '1', 'insert', '0'),
(9, '2015-03-19 21:51:58', 'usuarios_rel_pessoas', '1', 'insert', '0'),
(10, '2015-03-19 21:51:58', 'telefones', '1', 'insert', '0'),
(11, '2015-03-19 21:51:58', 'pessoas_rel_telefones', '1', 'insert', '0'),
(12, '2015-03-19 21:51:58', 'telefones', '2', 'insert', '0'),
(13, '2015-03-19 21:51:58', 'pessoas_rel_telefones', '2', 'insert', '0'),
(14, '2015-03-19 21:51:58', 'telefones', '3', 'insert', '0'),
(15, '2015-03-19 21:51:58', 'pessoas_rel_telefones', '3', 'insert', '0'),
(16, '2015-03-19 21:51:58', 'telefones', '3', 'insert', '0'),
(17, '2015-03-19 21:51:58', 'pessoas_rel_telefones', '3', 'insert', '0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `perguntas`
--

CREATE TABLE IF NOT EXISTS `perguntas` (
  `id` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` char(1) NOT NULL DEFAULT '1',
  `owner` char(32) NOT NULL,
  `pergunta` blob NOT NULL,
  `ordem` int(11) NOT NULL,
  `tipo` char(1) NOT NULL DEFAULT '1',
  `trash` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `perguntas_rel_moderacoes`
--

CREATE TABLE IF NOT EXISTS `perguntas_rel_moderacoes` (
  `id` int(11) NOT NULL,
  `id_pergunta` int(11) NOT NULL,
  `id_moderacao` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissoes`
--

CREATE TABLE IF NOT EXISTS `permissoes` (
  `id` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` char(1) NOT NULL DEFAULT '1',
  `ordem` int(11) NOT NULL DEFAULT '0',
  `owner` char(32) NOT NULL,
  `permissao` varchar(20) NOT NULL,
  `is_principal` char(1) NOT NULL,
  `trash` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoas`
--

CREATE TABLE IF NOT EXISTS `pessoas` (
  `id` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nome` varchar(70) NOT NULL,
  `cpf_cnpj` char(14) NOT NULL,
  `ordem` int(11) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT '1',
  `owner` char(45) NOT NULL,
  `tipo` char(2) NOT NULL,
  `trash` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pessoas`
--

INSERT INTO `pessoas` (`id`, `dta`, `nome`, `cpf_cnpj`, `ordem`, `status`, `owner`, `tipo`, `trash`) VALUES
(0, '2000-01-23 02:00:00', 'teste', '124124', 0, '1', '1', 'pj', '0'),
(1, '2015-03-19 21:51:58', 'Rogerio Pontes', '00000000000', 0, '1', '0', 'pf', '0'),
(2, '2015-03-19 21:51:58', 'Gustavo Silva', '11111111111', 0, '1', '0', 'pf', '0'),
(3, '2015-03-19 21:51:58', 'Daniel Lessa', '22222222222', 0, '1', '0', 'pf', '0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoas_rel_emails`
--

CREATE TABLE IF NOT EXISTS `pessoas_rel_emails` (
  `id` int(11) NOT NULL,
  `id_pessoa` int(11) NOT NULL,
  `id_email` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoas_rel_enderecos`
--

CREATE TABLE IF NOT EXISTS `pessoas_rel_enderecos` (
  `id` int(11) NOT NULL,
  `id_pessoa` int(11) NOT NULL,
  `id_endereco` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoas_rel_telefones`
--

CREATE TABLE IF NOT EXISTS `pessoas_rel_telefones` (
  `id` int(11) NOT NULL,
  `id_pessoa` int(11) NOT NULL,
  `id_telefone` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `pessoas_rel_telefones`
--

INSERT INTO `pessoas_rel_telefones` (`id`, `id_pessoa`, `id_telefone`, `dta`) VALUES
(1, 1, 1, '2015-03-19 21:51:58'),
(2, 2, 2, '2015-03-19 21:51:58'),
(3, 3, 3, '2015-03-19 21:51:58'),
(4, 3, 3, '2015-03-19 21:51:58');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoas_rel_uploads`
--

CREATE TABLE IF NOT EXISTS `pessoas_rel_uploads` (
  `id` int(11) NOT NULL,
  `id_pessoa` int(11) NOT NULL,
  `id_upload` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `respostas`
--

CREATE TABLE IF NOT EXISTS `respostas` (
  `id` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ordem` int(11) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT '1',
  `owner` char(45) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_pergunta` int(11) NOT NULL,
  `resposta` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefones`
--

CREATE TABLE IF NOT EXISTS `telefones` (
  `id` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` char(1) NOT NULL DEFAULT '1',
  `ordem` int(11) NOT NULL DEFAULT '0',
  `owner` char(32) NOT NULL,
  `ddi` char(5) NOT NULL,
  `ddd` char(5) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `ramal` varchar(70) NOT NULL,
  `operadora` varchar(20) NOT NULL,
  `is_principal` char(1) NOT NULL,
  `trash` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `telefones`
--

INSERT INTO `telefones` (`id`, `dta`, `status`, `ordem`, `owner`, `ddi`, `ddd`, `telefone`, `ramal`, `operadora`, `is_principal`, `trash`) VALUES
(1, '2015-03-19 21:51:58', '1', 0, '1', '+55', '021', '0000000000', '', '', '1', '0'),
(2, '2015-03-19 21:51:58', '1', 0, '1', '+55', '021', '0000000000', '', '', '1', '0'),
(3, '2015-03-19 21:51:58', '1', 0, '1', '+55', '021', '0000000000', '', '', '1', '0'),
(4, '2015-03-19 21:51:58', '1', 0, '1', '+55', '021', '0000000000', '', '', '1', '0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `uploads`
--

CREATE TABLE IF NOT EXISTS `uploads` (
  `id` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ordem` int(11) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT '1',
  `owner` char(45) NOT NULL,
  `guid` int(11) NOT NULL,
  `caminho` varchar(255) NOT NULL,
  `trash` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(40) NOT NULL,
  `group_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(70) NOT NULL,
  `password` char(32) NOT NULL,
  `ordem` int(11) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT '1',
  `owner` char(45) NOT NULL,
  `trash` char(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `dta`, `username`, `password`, `ordem`, `status`, `owner`, `trash`) VALUES
(1, '2015-03-19 21:51:58', 'roger', '202cb962ac59075b964b07152d234b70', 0, '1', '1', '0'),
(2, '2015-03-19 21:51:58', 'gus', '202cb962ac59075b964b07152d234b70', 0, '1', '1', '0'),
(3, '2015-03-19 21:51:58', 'dani', '202cb962ac59075b964b07152d234b70', 0, '1', '1', '0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios_rel_banco_questoes`
--

CREATE TABLE IF NOT EXISTS `usuarios_rel_banco_questoes` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_banco_questao` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios_rel_calendarios_anuais`
--

CREATE TABLE IF NOT EXISTS `usuarios_rel_calendarios_anuais` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_calendario_anual` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios_rel_chamados`
--

CREATE TABLE IF NOT EXISTS `usuarios_rel_chamados` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_chamado` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios_rel_comunicacoes_internas`
--

CREATE TABLE IF NOT EXISTS `usuarios_rel_comunicacoes_internas` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_comunicacao_interna` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios_rel_convenios`
--

CREATE TABLE IF NOT EXISTS `usuarios_rel_convenios` (
  `id` int(11) NOT NULL,
  `id_convenio` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios_rel_cursos`
--

CREATE TABLE IF NOT EXISTS `usuarios_rel_cursos` (
  `id` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios_rel_emails`
--

CREATE TABLE IF NOT EXISTS `usuarios_rel_emails` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_email` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios_rel_enquetes`
--

CREATE TABLE IF NOT EXISTS `usuarios_rel_enquetes` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_enquete` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios_rel_foruns`
--

CREATE TABLE IF NOT EXISTS `usuarios_rel_foruns` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_forum` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios_rel_logins`
--

CREATE TABLE IF NOT EXISTS `usuarios_rel_logins` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_login` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios_rel_permissoes`
--

CREATE TABLE IF NOT EXISTS `usuarios_rel_permissoes` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_permissao` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios_rel_pessoas`
--

CREATE TABLE IF NOT EXISTS `usuarios_rel_pessoas` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_pessoa` int(11) NOT NULL,
  `dta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios_rel_pessoas`
--

INSERT INTO `usuarios_rel_pessoas` (`id`, `id_usuario`, `id_pessoa`, `dta`) VALUES
(1, 1, 1, '2015-03-19 21:51:58'),
(2, 2, 2, '2015-03-19 21:51:58'),
(3, 3, 3, '2015-03-19 21:51:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banco_questoes`
--
ALTER TABLE `banco_questoes`
 ADD PRIMARY KEY (`id`), ADD KEY `disciplinas_idx` (`id_disciplina`);

--
-- Indexes for table `banco_questoes_rel_perguntas`
--
ALTER TABLE `banco_questoes_rel_perguntas`
 ADD KEY `banco_questoes_idx` (`id_banco_questao`), ADD KEY `perguntas_idx` (`id_pergunta`), ADD KEY `banco_questoes_rel_perguntas_idx` (`id`);

--
-- Indexes for table `calendarios_anuais`
--
ALTER TABLE `calendarios_anuais`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chamados`
--
ALTER TABLE `chamados`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comunicacoes_internas`
--
ALTER TABLE `comunicacoes_internas`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `convenios`
--
ALTER TABLE `convenios`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `convenios_rel_uploads`
--
ALTER TABLE `convenios_rel_uploads`
 ADD PRIMARY KEY (`id`), ADD KEY `convenios_idx` (`id_convenio`), ADD KEY `uploads_idx` (`id_upload`);

--
-- Indexes for table `cursos`
--
ALTER TABLE `cursos`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cursos_rel_disciplinas`
--
ALTER TABLE `cursos_rel_disciplinas`
 ADD PRIMARY KEY (`id`), ADD KEY `cursos_idx` (`id_curso`), ADD KEY `disciplinas_idx` (`id_disciplina`), ADD KEY `cursos_rel_disciplinas_idx` (`id`);

--
-- Indexes for table `cursos_rel_foruns`
--
ALTER TABLE `cursos_rel_foruns`
 ADD PRIMARY KEY (`id`), ADD KEY `cursos_idx` (`id_cursos`), ADD KEY `foruns_idx` (`id_forum`);

--
-- Indexes for table `cursos_rel_uploads`
--
ALTER TABLE `cursos_rel_uploads`
 ADD PRIMARY KEY (`id`), ADD KEY `cursos_idx` (`id_curso`), ADD KEY `uploads_idx` (`id_upload`), ADD KEY `cursos_rel_uploads_idx` (`id`);

--
-- Indexes for table `disciplinas`
--
ALTER TABLE `disciplinas`
 ADD KEY `disciplinas_idx` (`id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enderecos`
--
ALTER TABLE `enderecos`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquetes`
--
ALTER TABLE `enquetes`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquetes_rel_perguntas`
--
ALTER TABLE `enquetes_rel_perguntas`
 ADD KEY `enquetes_idx` (`id_enquete`), ADD KEY `perguntas_idx` (`id_pergunta`), ADD KEY `enquetes_rel_perguntas_idx` (`id`);

--
-- Indexes for table `enquetes_rel_perguntas_rel_respostas`
--
ALTER TABLE `enquetes_rel_perguntas_rel_respostas`
 ADD PRIMARY KEY (`id`), ADD KEY `perguntas_idx` (`id_pergunta`), ADD KEY `respostas_idx` (`id_resposta`), ADD KEY `usuarios_idx` (`id_usuario`);

--
-- Indexes for table `foruns`
--
ALTER TABLE `foruns`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foruns_rel_perguntas`
--
ALTER TABLE `foruns_rel_perguntas`
 ADD PRIMARY KEY (`id`), ADD KEY `foruns_idx` (`id_forum`), ADD KEY `perguntas_idx` (`id_pergunta`), ADD KEY `foruns_rel_perguntas_idx` (`id`);

--
-- Indexes for table `logins`
--
ALTER TABLE `logins`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `moderacoes`
--
ALTER TABLE `moderacoes`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `observadores`
--
ALTER TABLE `observadores`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perguntas`
--
ALTER TABLE `perguntas`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perguntas_rel_moderacoes`
--
ALTER TABLE `perguntas_rel_moderacoes`
 ADD PRIMARY KEY (`id`), ADD KEY `perguntas_idx` (`id_pergunta`), ADD KEY `moderacoes_idx` (`id_moderacao`);

--
-- Indexes for table `permissoes`
--
ALTER TABLE `permissoes`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pessoas`
--
ALTER TABLE `pessoas`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pessoas_rel_emails`
--
ALTER TABLE `pessoas_rel_emails`
 ADD PRIMARY KEY (`id`), ADD KEY `pessoas_idx` (`id_pessoa`), ADD KEY `emails_idx` (`id_email`);

--
-- Indexes for table `pessoas_rel_enderecos`
--
ALTER TABLE `pessoas_rel_enderecos`
 ADD KEY `enderecos_idx` (`id_endereco`), ADD KEY `pessoas_idx` (`id_pessoa`);

--
-- Indexes for table `pessoas_rel_telefones`
--
ALTER TABLE `pessoas_rel_telefones`
 ADD KEY `pessoas_idx` (`id_pessoa`), ADD KEY `telefones_idx` (`id_telefone`), ADD KEY `pessoas_rel_telefones_idx` (`id`);

--
-- Indexes for table `pessoas_rel_uploads`
--
ALTER TABLE `pessoas_rel_uploads`
 ADD KEY `fk_43_pessoas_idx` (`id_pessoa`), ADD KEY `fk_43_uploads_idx` (`id_upload`), ADD KEY `fk_43_pessoas_rel_uploads_idx` (`id`);

--
-- Indexes for table `telefones`
--
ALTER TABLE `telefones`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios_rel_banco_questoes`
--
ALTER TABLE `usuarios_rel_banco_questoes`
 ADD KEY `usuarios_idx` (`id_usuario`), ADD KEY `banco_questoes_idx` (`id_banco_questao`), ADD KEY `usuarios_rel_banco_questoes_idx` (`id`);

--
-- Indexes for table `usuarios_rel_calendarios_anuais`
--
ALTER TABLE `usuarios_rel_calendarios_anuais`
 ADD KEY `usuarios_idx` (`id_usuario`), ADD KEY `calendarios_anuais_idx` (`id_calendario_anual`), ADD KEY `usuarios_rel_calendarios_anuais_idx` (`id`);

--
-- Indexes for table `usuarios_rel_chamados`
--
ALTER TABLE `usuarios_rel_chamados`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_16_usuarios_idx` (`id_usuario`), ADD KEY `fk_16_chamados_idx` (`id_chamado`), ADD KEY `fk_16_chamados_rel_usuarios_idx` (`id`);

--
-- Indexes for table `usuarios_rel_comunicacoes_internas`
--
ALTER TABLE `usuarios_rel_comunicacoes_internas`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_17_usuarios_idx` (`id_usuario`), ADD KEY `fk_17_comunicacoes_internas_idx` (`id_comunicacao_interna`);

--
-- Indexes for table `usuarios_rel_convenios`
--
ALTER TABLE `usuarios_rel_convenios`
 ADD PRIMARY KEY (`id`), ADD KEY `convenios_idx` (`id_convenio`), ADD KEY `usuarios_idx` (`id_usuario`);

--
-- Indexes for table `usuarios_rel_cursos`
--
ALTER TABLE `usuarios_rel_cursos`
 ADD PRIMARY KEY (`id`), ADD KEY `cursos_idx` (`id_curso`), ADD KEY `usuarios_idx` (`id_usuario`);

--
-- Indexes for table `usuarios_rel_emails`
--
ALTER TABLE `usuarios_rel_emails`
 ADD KEY `usuarios_idx` (`id_usuario`), ADD KEY `emails_idx` (`id_email`), ADD KEY `usuarios_rel_emails_idx` (`id`);

--
-- Indexes for table `usuarios_rel_enquetes`
--
ALTER TABLE `usuarios_rel_enquetes`
 ADD KEY `usuarios_idx` (`id_usuario`), ADD KEY `usuarios_rel_enquetes_idx` (`id`), ADD KEY `fk_3_enquetes_idx` (`id_enquete`);

--
-- Indexes for table `usuarios_rel_foruns`
--
ALTER TABLE `usuarios_rel_foruns`
 ADD PRIMARY KEY (`id`), ADD KEY `usuarios_idx` (`id_usuario`), ADD KEY `foruns_idx` (`id_forum`);

--
-- Indexes for table `usuarios_rel_logins`
--
ALTER TABLE `usuarios_rel_logins`
 ADD KEY `fk_41_usuarios_idx` (`id_usuario`), ADD KEY `fk_42_logins_idx` (`id_login`), ADD KEY `fk_42_usuarios_rel_logins_idx` (`id`);

--
-- Indexes for table `usuarios_rel_permissoes`
--
ALTER TABLE `usuarios_rel_permissoes`
 ADD KEY `usuarios_idx` (`id_usuario`), ADD KEY `permissoes_idx` (`id_permissao`);

--
-- Indexes for table `usuarios_rel_pessoas`
--
ALTER TABLE `usuarios_rel_pessoas`
 ADD KEY `pessoas_idx` (`id_pessoa`), ADD KEY `usuarios_idx` (`id_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

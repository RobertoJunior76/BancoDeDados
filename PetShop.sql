CREATE DATABASE `PetShop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

CREATE TABLE `Cliente` (
  `IDCliente` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) DEFAULT NULL,
  `E-mail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IDCliente`),
  CONSTRAINT `cod_endereco` FOREIGN KEY (`IDCliente`) REFERENCES `endereco` (`idEndereco`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Cliente_Pet` (
  `idCliente_Pet` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idCliente_Pet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Endereco` (
  `idEndereco` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_rua` varchar(45) DEFAULT NULL,
  `Numero` int(11) DEFAULT NULL,
  `Cep` int(11) DEFAULT NULL,
  `Bairro` varchar(45) DEFAULT NULL,
  `Cidade` varchar(45) DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  `Pais` varchar(45) DEFAULT NULL,
  `Complemento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEndereco`),
  CONSTRAINT `cod_tipo_residencia` FOREIGN KEY (`idEndereco`) REFERENCES `residencia` (`idResidencia`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Forma_De_Pagamento` (
  `IDFormaPagamento` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`IDFormaPagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Funcionario` (
  `idFuncionario` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Cpf` varchar(11) NOT NULL,
  `Salario` varchar(45) DEFAULT NULL,
  `Tipo` varchar(45) DEFAULT NULL,
  `Num_conselho` int(11) DEFAULT NULL,
  `Especialidade` varchar(45) DEFAULT NULL,
  `Comissao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idFuncionario`),
  CONSTRAINT `CodEndereco` FOREIGN KEY (`idFuncionario`) REFERENCES `endereco` (`idEndereco`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Pet` (
  `IDPet` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) DEFAULT NULL,
  `Especie` varchar(45) DEFAULT NULL,
  `Porte` varchar(45) DEFAULT NULL,
  `Dt_Nasc` datetime DEFAULT NULL,
  PRIMARY KEY (`IDPet`),
  CONSTRAINT `CodProntuario` FOREIGN KEY (`IDPet`) REFERENCES `prontuario` (`idProntuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Produto` (
  `idProduto` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) DEFAULT NULL,
  `Descricao` varchar(45) DEFAULT NULL,
  `Tipo` varchar(45) DEFAULT NULL,
  `Valor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Prod_Venda` (
  `idProd_Venda` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idProd_Venda`),
  CONSTRAINT `CODProduto` FOREIGN KEY (`idProd_Venda`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `CODVenda` FOREIGN KEY (`idProd_Venda`) REFERENCES `venda` (`idVenda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Prontuario` (
  `idProntuario` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(45) DEFAULT NULL,
  `Temperatura` varchar(45) DEFAULT NULL,
  `Peso` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProntuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Residencia` (
  `idResidencia` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idResidencia`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Telefone` (
  `idTelefone` int(11) NOT NULL AUTO_INCREMENT,
  `Telefone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTelefone`),
  CONSTRAINT `COD_CLIENTE` FOREIGN KEY (`idTelefone`) REFERENCES `cliente` (`IDCliente`),
  CONSTRAINT `COD_FUNCIONARIO` FOREIGN KEY (`idTelefone`) REFERENCES `funcionario` (`idFuncionario`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Venda` (
  `idVenda` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idVenda`),
  CONSTRAINT `CODCliente` FOREIGN KEY (`idVenda`) REFERENCES `cliente` (`IDCliente`),
  CONSTRAINT `CodFormaPagamento` FOREIGN KEY (`idVenda`) REFERENCES `forma_de_pagamento` (`IDFormaPagamento`),
  CONSTRAINT `CodFuncionario` FOREIGN KEY (`idVenda`) REFERENCES `funcionario` (`idFuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

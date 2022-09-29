-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ecomerce
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table ecomerce.Cliente
-- -----------------------------------------------------
CREATE TABLE  ecomerce.Cliente (
  id_Cliente INT NOT NULL AUTO_INCREMENT,
  endereco VARCHAR(45) NOT NULL,
  numero_Endereco INT NOT NULL,
  complemento_endereco VARCHAR(45) NULL,
  cep VARCHAR(5) NOT NULL,
  PRIMARY KEY (id_Cliente))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table ecomerce.FormaPagamento
-- -----------------------------------------------------
CREATE TABLE ecomerce.Forma_Pagamento (
  id_Forma_Pagamento INT NOT NULL AUTO_INCREMENT,
  dsecricao VARCHAR(20) NOT NULL,
  ativo BIT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (id_Forma_Pagamento))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table ecomerce.Pedido
-- -----------------------------------------------------
CREATE TABLE ecomerce.Pedido (
  id_Pedido INT NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(45) NULL,
  frete FLOAT NULL,
  id_Cliente INT NOT NULL,
  id_Forma_Pagamento INT NOT NULL,
  PRIMARY KEY (id_Pedido, id_Forma_Pagamento),
  INDEX fk_Pedido_Cliente_idx (id_Cliente ASC) VISIBLE,
  INDEX fk_Pedido_FormaPagamento1_idx (id_Forma_Pagamento ASC) VISIBLE,
  CONSTRAINT fk_Pedido_Cliente1
    FOREIGN KEY (id_Cliente)
    REFERENCES Cliente (id_Cliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Pedido_FormaPagamento
    FOREIGN KEY (id_Forma_Pagamento)
    REFERENCES FormaPagamento (id_Forma_Pagamento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table ecomerce.Produto
-- -----------------------------------------------------
CREATE TABLE ecomerce.Produto (
  id_Produto INT NOT NULL AUTO_INCREMENT,
  categoria VARCHAR(15) NULL,
  descricao VARCHAR(45) NULL,
  valor FLOAT NULL,
  PRIMARY KEY (id_Produto))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table ecomerce.Fornecedor
-- -----------------------------------------------------
CREATE TABLE ecomerce.Fornecedor (
  id_Fornecedor INT NOT NULL AUTO_INCREMENT,
  razao_Social VARCHAR(45) NULL,
  cnpj VARCHAR(45) NULL,
  PRIMARY KEY (id_Fornecedor),
  UNIQUE INDEX CNPJ_UNIQUE (cnpj ASC) VISIBLE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table ecomerce.DisponibilizaProduto
-- -----------------------------------------------------
CREATE TABLE ecomerce.Disponibiliza_Produto (
  id_Produto INT NOT NULL,
  id_Fornecedor INT NOT NULL,
  PRIMARY KEY (id_Produto, id_Fornecedor),
  INDEX fk_Produto_has_Fornecedor_Fornecedor1_idx (id_Fornecedor ASC) VISIBLE,
  INDEX fk_Produto_has_Fornecedor_Produto_idx (id_Produto ASC) VISIBLE,
  CONSTRAINT fk_Produto_has_Fornecedor_Produto
    FOREIGN KEY (id_Produto)
    REFERENCES Produto (id_Produto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Produto_has_Fornecedor_Fornecedor1
    FOREIGN KEY (id_Fornecedor)
    REFERENCES Fornecedor (id_Fornecedor)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table ecomerce.Estoque
-- -----------------------------------------------------
CREATE TABLE ecomerce.Estoque (
  id_Estoque INT NOT NULL AUTO_INCREMENT,
  local VARCHAR(30) NULL,
  PRIMARY KEY (id_Estoque))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table ecomerce.ProdutoEmEstoque
-- -----------------------------------------------------
CREATE TABLE ecomerce.Produto_Em_Estoque (
  id_Estoque INT NOT NULL,
  id_Produto INT NOT NULL,
  quantidade INT NOT NULL,
  PRIMARY KEY (id_Estoque, id_Produto),
  INDEX fk_Estoque_has_Produto_Produto1_idx (id_Produto ASC) VISIBLE,
  INDEX fk_Estoque_has_Produto_Estoque1_idx (id_Estoque ASC) VISIBLE,
  CONSTRAINT fk_Estoque_has_Produto_Estoque1
    FOREIGN KEY (id_Estoque)
    REFERENCES Estoque (id_Estoque)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Estoque_has_Produto_Produto1
    FOREIGN KEY (id_Produto)
    REFERENCES Produto (id_Produto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table ecomerce.RelacaoProdutoPedido
-- -----------------------------------------------------
CREATE TABLE ecomerce.Relacao_Produto_Pedido (
  Id_Produto INT NOT NULL,
  Id_Pedido INT NOT NULL,
  quantidade INT NOT NULL,
  PRIMARY KEY (Id_Produto, Id_Pedido),
  INDEX fkProdutoHasPedidoPedidoIdx (Id_Pedido ASC) VISIBLE,
  INDEX fkProdutoHasPedidoProdutoIdx (Id_Produto ASC) VISIBLE,
  CONSTRAINT fkProdutoHasPedidoProduto
    FOREIGN KEY (Id_Produto)
    REFERENCES Produto (id_Produto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fkProdutoHasPedidoPedido
    FOREIGN KEY (Id_Pedido)
    REFERENCES Pedido (id_Pedido)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table ecomerce.TerceiroVendedor
-- -----------------------------------------------------
CREATE TABLE  ecomerce.Terceiro_Vendedor (
  id_Terceiro_Vendedor INT NOT NULL AUTO_INCREMENT,
  razao_Social VARCHAR(60) NULL,
  local VARCHAR(45) NULL,
  PRIMARY KEY (id_Terceiro_Vendedor))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table ecomerce.ProdutoPorVendedor - Terceiro
-- -----------------------------------------------------
CREATE TABLE ecomerce.Produto_Vendedor_Terceiro (
  Id_Produto INT NOT NULL,
  Id_Terceiro INT NOT NULL,
  quantidade INT NOT NULL,
  PRIMARY KEY (Id_Produto, Id_Terceiro),
  INDEX fkProdutoHasTerceiroIdx (Id_Terceiro ASC) VISIBLE,
  INDEX fkProdutoHasTerceiroProdutoIdx (Id_Produto ASC) VISIBLE,
  CONSTRAINT fkProdutoHasTerceiroProduto
    FOREIGN KEY (Id_Produto)
    REFERENCES Produto (id_Produto)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fkProdutohasTerceiroVendedor
    FOREIGN KEY (id_Terceiro)
    REFERENCES TerceiroVendedor (id_Terceiro)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table ecomerce.Status
-- -----------------------------------------------------
CREATE TABLE ecomerce.Status (
  id_Status INT NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(45) NOT NULL,
  PRIMARY KEY (id_Status))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table ecomerce.StatusPedido
-- -----------------------------------------------------
CREATE TABLE ecomerce.StatusPedido (
  id_Rastreio INT NOT NULL AUTO_INCREMENT,
  Id_Pedido INT NOT NULL,
  data_Prevista_Entrega DATE NOT NULL,
  data_Atualizacao_Status DATE NOT NULL,
  Id_Status INT NOT NULL,
  codigo_Rastreio VARCHAR(20) NULL,
  PRIMARY KEY (id_Rastreio),
  INDEX fkEntregaPedidoidx (Id_Pedido ASC) VISIBLE,
  INDEX fkEntregaStatusidx (Id_Status ASC) VISIBLE,
  CONSTRAINT fkEntregaPedido
    FOREIGN KEY (Id_Pedido)
    REFERENCES Pedido (id_Pedido)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_EntregaStatus
    FOREIGN KEY (Id_Status)
    REFERENCES Status (id_Status)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table ecomerce.PessoaFisica
-- -----------------------------------------------------
CREATE TABLE ecomerce.PessoaFisica (
  id_Pessoa_Fisica INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(60) NOT NULL,
  rg VARCHAR(9) NOT NULL,
  cpf VARCHAR(11) NOT NULL,
  Id_Cliente INT NOT NULL,
  PRIMARY KEY (id_Pessoa_Fisica),
  INDEX fkPessoaFisicaClienteIdx (Id_Cliente ASC) VISIBLE,
  UNIQUE INDEX cpf_Unique (cpf ASC) VISIBLE,
  CONSTRAINT fk_Pessoa_Fisica_Cliente
    FOREIGN KEY (Id_Cliente)
    REFERENCES Cliente (id_Cliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table ecomerce.PessoaJuridica
-- -----------------------------------------------------
CREATE TABLE ecomerce.Pessoa_Juridica (
  id_Pessoa_Juridica INT NOT NULL AUTO_INCREMENT,
  razao_Social VARCHAR(60) NOT NULL,
  nome_Fantasia VARCHAR(45) NULL,
  cnpj VARCHAR(14) NOT NULL,
  Id_Cliente INT NOT NULL,
  PRIMARY KEY (id_Pessoa_Juridica),
  INDEX fkPessoaJuridicaClienteIdx (Id_Cliente ASC) VISIBLE,
  UNIQUE INDEX cnpj_Unique (cnpj ASC) VISIBLE,
  CONSTRAINT fkPessoaJuridicaCliente
    FOREIGN KEY (Id_Cliente)
    REFERENCES Cliente (id_Cliente)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table ecomerce.DadosPagamento
-- -----------------------------------------------------
CREATE TABLE ecomerce.Dados_Pagamento (
  id_Cartao_Credito INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(20) NOT NULL,
  numero VARCHAR(16) NOT NULL,
  nome_Titular VARCHAR(60) NOT NULL,
  validade DATE NOT NULL,
  bandeira VARCHAR(30) NULL,
  Id_Forma_Pagamento INT NOT NULL,
  ativo BIT(1) NULL,
  PRIMARY KEY (id_Cartao_Credito),
  INDEX fkFormaPagamentoIdx (Id_Forma_Pagamento ASC) VISIBLE,
  CONSTRAINT fkFormaPagamento
    FOREIGN KEY (Id_Forma_Pagamento)
    REFERENCES FormaPagamento (id_Forma_Pagamento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

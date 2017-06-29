CREATE DATABASE curriculos;

USE curriculos;

CREATE TABLE candidatos (
  id                INTEGER PRIMARY KEY AUTO_INCREMENT,
  nome              VARCHAR(150) NOT NULL,
  data_nascimento   DATE         NOT NULL,
  sexo              CHAR(1)      NOT NULL,
  estado_civil      VARCHAR(50)  NOT NULL,
  mae               VARCHAR(120),
  pai               VARCHAR(120),
  categoria_cnh     CHAR(2)             DEFAULT NULL,
  cep               INT          NOT NULL,
  uf                VARCHAR(2)   NOT NULL,
  cidade            VARCHAR(100) NOT NULL,
  endereco          VARCHAR(255) NOT NULL,
  numero            INTEGER(6)   NOT NULL,
  complemento       VARCHAR(255)        DEFAULT NULL,
  ddd_telefone      INT(3),
  telefone          INT(9),
  ddd_celular       INT(3),
  celular           INT(9),
  ddd_tefone_recado INTEGER(3),
  tefone_recado     INTEGER(9),
  falar_com         VARCHAR(40)
)ENGINE=InnoDB;


CREATE TABLE diversidade (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  candidato_id       INTEGER UNIQUE NOT NULL ,
  possui_deficiencia BOOLEAN     DEFAULT FALSE,
  deficiencia        VARCHAR(60) DEFAULT NULL,
  INDEX (candidato_id),
  FOREIGN KEY (candidato_id) REFERENCES candidatos (id)
  ON DELETE CASCADE
)ENGINE=InnoDB;

CREATE TABLE pretencao_profissional(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  candidato_id       INTEGER UNIQUE NOT NULL ,
  cargo VARCHAR(120) NOT NULL,
  cidade VARCHAR(120) DEFAULT NULL,
  possui_experiencia_profissional BOOLEAN DEFAULT FALSE,
  esta_trabalhando BOOLEAN DEFAULT FALSE,
  INDEX (candidato_id),
  FOREIGN KEY (candidato_id) REFERENCES candidatos (id)
    ON DELETE CASCADE
)ENGINE=InnoDB;

CREATE TABLE curriculo(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  candidato_id       INTEGER UNIQUE NOT NULL,
  curriculo VARCHAR(80) NOT NULL,
  INDEX (candidato_id),
  FOREIGN KEY (candidato_id) REFERENCES candidatos (id)
    ON DELETE CASCADE
)ENGINE=InnoDB;

CREATE TABLE escolaridade(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  candidato_id       INTEGER UNIQUE NOT NULL,
  escolaridade VARCHAR(80) NOT NULL,
  instituicao VARCHAR(120) NOT NULL,
  curso VARCHAR(120) NOT NULL,
  nivel_ingles ENUM('Basico', 'Intermediario', 'Avancado', 'Fluente'),
  nivel_espanhol ENUM('Basico', 'Intermediario', 'Avancado', 'Fluente'),
  INDEX (candidato_id),
  FOREIGN KEY (candidato_id) REFERENCES candidatos (id)
    ON DELETE CASCADE
)ENGINE=InnoDB;

CREATE TABLE habilidades(
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  candidato_id       INTEGER UNIQUE NOT NULL,
  word ENUM('Basico', 'Intermediario', 'Avancado') NOT NULL,
  excel ENUM('Basico', 'Intermediario', 'Avancado') NOT NULL,
  power_point ENUM('Basico', 'Intermediario', 'Avancado') NOT NULL,
  INDEX (candidato_id),
  FOREIGN KEY (candidato_id) REFERENCES candidatos (id)
    ON DELETE CASCADE

)ENGINE=InnoDB;

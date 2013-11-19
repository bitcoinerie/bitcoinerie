DROP DATABASE IF EXISTS BitcoinDB;

CREATE DATABASE BitcoinDB DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE BitcoinDB;

CREATE TABLE MyTransaction(
  id_transaction  INT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  emetteur  INT(10) NOT NULL,
  recepteur INT(10) NOT NULL,
  montant FLOAT(20) NOT NULL,
  dateTransaction DATETIME  NOT NULL

  -- CONSTRAINT fk_user_emittor FOREIGN KEY (emetteur) REFERENCES myUser(id_user)

  -- CONSTRAINT fk_user_receptor FOREIGN KEY (recepteur) REFERENCES myUser(id_user)
)
ENGINE = INNODB;


INSERT INTO MyTransaction(emetteur, recepteur, montant,dateTransaction) VALUES(
3,5,100,'2013-11-18 20:59:59');


CREATE TABLE MyEchange(
  id_echange  INT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  emetteur  INT(10) NOT NULL,
  recepteur INT(10) NOT NULL,
  montant FLOAT(20) NOT NULL,
  probabilite FLOAT(20) NOT NULL,
  dateDerniereModification DATETIME  NOT NULL

  -- CONSTRAINT fk_user_emitter FOREIGN KEY (emetteur) REFERENCES Utilisateur(id_user)

  -- CONSTRAINT fk_user_receptor FOREIGN KEY (recepteur) REFERENCES Utilisateur(id_user)
);


CREATE TABLE myUser(
  id_user INT(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(10) NOT NULL,
  prenom VARCHAR(10) NOT NULL,
  reputation FLOAT(20) NOT NULL,
  montant_compte FLOAT(20) NOT NULL,
  login VARCHAR(10) NOT NULL,
  dateInscription DATETIME  NOT NULL,
  email VARCHAR(10) NOT NULL
)
ENGINE = INNODB;
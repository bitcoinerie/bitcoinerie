

DROP TABLE IF EXISTS Membre;
DROP TABLE IF EXISTS Biblio;
DROP TABLE IF EXISTS Livre;
DROP TABLE IF EXISTS Emprunt;

CREATE TABLE Membre
(
	IdMembre INTEGER NOT NULL PRIMARY KEY,
	nomMembre CHAR(10) NOT NULL,
	adrMembre CHAR(12),
	cpMembre CHAR(5)
);

CREATE TABLE Biblio
(
	IdBiblio INTEGER NOT NULL PRIMARY KEY,
	nomBiblio CHAR(15) NOT NULL,
	adrBiblio CHAR(12),
	cpBiblio CHAR(5)
);

CREATE TABLE Livre
(
	IdLivre CHAR(8) NOT NULL PRIMARY KEY,
	titreLivre CHAR(40),
	auteurLivre CHAR(30) NOT NULL,
	categLivre SMALLINT DEFAULT 1 CHECK(categLivre<6),
	IdBiblio INTEGER NOT NULL,
	FOREIGN KEY (IdBiblio)
		REFERENCES Biblio(IdBiblio)
);

CREATE TABLE Emprunt
(
	IdLivre CHAR(8) NOT NULL,
	IdMembre INTEGER NOT NULL,
	dateEmprunt DATE,
	dureeEmprunt INTEGER,
   	PRIMARY KEY (IdLivre, IdMembre)
);


INSERT INTO Membre VALUES (2, 'Durand', 'Marseille', '13008');
INSERT INTO Membre VALUES (7, 'Cassagne', 'Marseille', '13007');
INSERT INTO Membre VALUES (5, 'André', 'Gardanne', '13120');
INSERT INTO Membre VALUES (21, 'Petiot', 'Marseille', '13008');
INSERT INTO Membre VALUES (15, 'Monet', 'Aubagne', '13200');
INSERT INTO Membre VALUES (30,'Napo','Marseille','13012');

INSERT INTO Biblio VALUES (208, 'Prado', 'Marseille', '13008');
INSERT INTO Biblio VALUES (71, 'République', 'Marseille', '13002');
INSERT INTO Biblio VALUES (112, 'St Charles', 'Marseille', '13001');
INSERT INTO Biblio VALUES (202, 'Aubagne', 'Aubagne', '13200');

INSERT INTO Livre VALUES ('0228PRAZ','Les Misérables', 'Victor Hugo', 1, 208);
INSERT INTO Livre VALUES ('1206QIQA','Paroles','Jacques Prévert', 3, 202);
INSERT INTO Livre VALUES ('7658MNLK','Avicenne', 'Gilbert Sinoué', 1, 112);
INSERT INTO Livre VALUES ('4021QRPO', 'Les Contemplations','Victor Hugo', 1, 112);
INSERT INTO Livre VALUES ('7089PQIU', 'Le dernier pharaon','Gilbert Sinoué', 1, 202);
INSERT INTO Livre VALUES ('6154PANB','Ruy Blas', 'Victor Hugo', 5, 71);
INSERT INTO Livre VALUES ('1920RLTY','Contes pour les enfants pas sages', 'Jacques Prévert', 2, 208);
INSERT INTO Livre VALUES ('1956JJSS','Le crabe aux pinces d''or', 'Hergé', 4, 71);
INSERT INTO Livre VALUES ('4919FFEF','Silex and the city', 'Jul', 4, 202);


INSERT INTO Emprunt VALUES ('1920RLTY', 2, '2010-02-12', 6);
INSERT INTO Emprunt VALUES ('0228PRAZ',30, '2011-02-05',5);
INSERT INTO Emprunt VALUES ('6154PANB', 2, '2010-09-28', 9);
INSERT INTO Emprunt VALUES ('1920RLTY',30, '2011-01-10',10);
INSERT INTO Emprunt VALUES ('7658MNLK',30, '2011-01-28',11);
INSERT INTO Emprunt VALUES ('1920RLTY', 15, '2010-03-15', 6);
INSERT INTO Emprunt VALUES ('1956JJSS',30, '2011-02-19',2);
INSERT INTO Emprunt VALUES ('1206QIQA', 15, '2010-11-02', 10);
INSERT INTO Emprunt VALUES ('7658MNLK', 2, '2010-06-02', 5);
INSERT INTO Emprunt VALUES ('4919FFEF',30, '2011-04-19',7);
INSERT INTO Emprunt VALUES ('7658MNLK', 15, '2010-05-04', 5);
INSERT INTO Emprunt VALUES ('6154PANB', 5, '2010-05-04', 7);







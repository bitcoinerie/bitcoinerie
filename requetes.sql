.mode columns
.header on
.width 35

-- 1 -- Liste des auteurs présents dans la base. 

SELECT DISTINCT auteurLivre 
FROM Livre;

-- 2 -- Liste des Livres de Victor Hugo 

SELECT titreLivre
FROM Livre
WHERE auteurLivre = 'Victor Hugo';

-- 3 -- Liste des Livres de Victor Hugo appartenant à la catégorie 5 (Théâtre).

SELECT titreLivre
FROM Livre
WHERE auteurLivre = 'Victor Hugo'
AND categLivre = 5;

-- 4 -- Liste des Livres de Jacques Prevert ou de Gilbert Sinoue.

SELECT titreLivre
FROM Livre
WHERE auteurLivre = 'Jacques Prévert'
OR auteurLivre = 'Gilbert Sinoué';

-- 5 -- Liste des Membres n’habitant pas à Marseille.

SELECT nomMembre
FROM Membre
WHERE adrMembre <> 'Marseille';

-- 6 -- Liste des livres (titre, auteur) empruntés au moins une fois.

SELECT titreLivre, auteurLivre 
FROM Livre
WHERE IdLivre IN (
    SELECT IdLivre 
    FROM Emprunt
    );
    
-- Idem, utilisation de JOIN

SELECT DISTINCT titreLivre, auteurLivre 
FROM Livre JOIN Emprunt ON Livre.IdLivre = Emprunt.IdLivre;
    
-- 7 -- Liste des livres jamais empruntés.

SELECT titreLivre, auteurLivre 
FROM Livre
WHERE IdLivre NOT IN (
    SELECT IdLivre 
    FROM Emprunt
    );
    
-- Idem, approche ensembliste

    SELECT titreLivre, auteurLivre 
    FROM Livre
EXCEPT
    SELECT titreLivre, auteurLivre 
    FROM Livre
    WHERE IdLivre IN (
        SELECT IdLivre 
        FROM Emprunt
        );
    

-- 8 -- Liste des membres qui ont emprunté Ruy Blas.     
SELECT nomMembre
FROM Membre
WHERE IdMembre IN (
    SELECT IdMembre
    FROM Emprunt
    WHERE IdLivre IN (
        SELECT IdLivre 
        FROM Livre
        WHERE titreLivre = 'Ruy Blas'
        )
    );
  
-- Idem avec JOIN --
SELECT nomMembre
FROM Membre JOIN Emprunt 
                ON Membre.IdMembre = Emprunt.IdMembre 
            JOIN Livre      
                ON Emprunt.IdLivre = Livre.IdLivre
WHERE titreLivre = 'Ruy Blas';
    

-- 9 -- Liste des livres empruntés par des membres habitant dans le 8ème arrondissement de Marseille. 

SELECT titreLivre, auteurLivre
FROM Livre
WHERE IdLivre IN (
    SELECT IdLivre
    FROM Emprunt
    WHERE IdMembre IN (
        SELECT IdMembre
        FROM Membre
        WHERE cpMembre = '13008'
        )
    );

-- 10 -- Quels sont les livres qui ont été empruntés au cours de la période allant du 16/01/10 au 15/06/10?

SELECT titreLivre, auteurLivre
FROM Livre
WHERE IdLivre IN (
    SELECT IdLivre
    FROM Emprunt
    WHERE dateEmprunt 
    BETWEEN '2010-01-16' AND '2010-06-15' 
    );

-- 11. Donner la liste des livres se trouvant à St Charles ou à République.

SELECT titreLivre, auteurLivre 
FROM Livre
WHERE IdBiblio IN (
    SELECT IdBiblio 
    FROM Biblio
    WHERE nomBiblio = 'St Charles'
    OR nomBiblio = 'République'
    );
    
-- 12 -- Quels sont les numéros des membres qui ont emprunté au moins un livre à Marseille 
      -- pour une durée supérieure ou égale à 7 jours ?
      
SELECT DISTINCT IdMembre
FROM Emprunt
WHERE dureeEmprunt >= 7
AND IdLivre IN (
    SELECT IdLivre
    FROM Livre
    WHERE IdBiblio IN (
        SELECT IdBiblio
        FROM Biblio
        WHERE adrBiblio = 'Marseille'
        )
    );
    
-- 13 -- Liste des membres qui ont emprunté à la fois ‘Contes pour les enfants pas sages’ 
      -- et ‘Avicenne’

    SELECT IdMembre
    FROM Emprunt
    WHERE IdLivre IN (
        SELECT IdLivre
        FROM Livre
        WHERE titreLivre = 'Contes pour les enfants pas sages'
        )
INTERSECT
    SELECT IdMembre
    FROM Emprunt
    WHERE IdLivre IN (
        SELECT IdLivre
        FROM Livre
        WHERE titreLivre = 'Avicenne'
        );
    
-- 14 -- Quels sont les numéros des livres qui ont été empruntés au moins deux fois?
SELECT IdLivre
FROM (
    SELECT IdLivre, COUNT(*) AS nb
    FROM Emprunt
    GROUP By IdLivre
    HAVING nb > 1
    );

-- Idem (auto-jointure)
 
SELECT DISTINCT E1.IdLivre 
FROM Emprunt E1 JOIN Emprunt E2 ON E1.IdLivre = E2.IdLivre
WHERE E1.IdMembre != E2.IDMembre;

--15 -- Quels sont les numéros des livres qui ont été empruntés au moins deux fois 
     -- au cours de la période allant du 16/01/10 au 15/03/10?

SELECT DISTINCT E1.IdLivre 
FROM Emprunt E1 JOIN Emprunt E2 ON E1.IdLivre = E2.IdLivre
WHERE E1.IdMembre != E2.IDMembre
AND E1.dateEmprunt  BETWEEN '2010-01-16' AND '2010-03-15';

-- 16 -- Pour chaque catégorie de livre, donner le nombre de livres disponibles.

SELECT categLivre, COUNT(*)
FROM Livre
GROUP BY categLivre;

-- 17 -- Pour chaque catégorie de livre, donner le nombre de livres empruntés 
      -- au moins une fois.

SELECT categLivre, COUNT(*)
FROM Livre
WHERE IdLivre IN (
    SELECT IdLivre
    FROM Emprunt)
GROUP BY categLivre;

-- 18 -- Donner les noms des membres qui ont emprunté plus de deux livres.  

SELECT nomMembre
FROM (
    SELECT nomMembre, COUNT(*) AS cpt
    FROM Membre JOIN Emprunt ON Membre.IdMembre = Emprunt.IdMembre
    GROUP BY nomMembre
    HAVING cpt > 1
    );

-- 19 -- Quels sont les numéro et noms des membres qui ont emprunté au moins un livre 
      -- écrit par ‘Victor Hugo’ mais qui n’ont jamais emprunté de livre écrit par ‘Jacques Prévert’ ?

    SELECT IdMembre
    FROM Emprunt JOIN Livre ON Emprunt.IdLivre = Livre.IdLivre
    WHERE auteurLivre = 'Victor Hugo'
EXCEPT 
    SELECT IdMembre
    FROM Emprunt JOIN Livre ON Emprunt.IdLivre = Livre.IdLivre
    WHERE auteurLivre = 'Jacques Prévert';

-- 20 -- C'est une division!!
      -- on s'en sort avec un COUNT

SELECT nomMembre, adrMembre
FROM (
    SELECT DISTINCT nomMembre, adrMembre, auteurLivre, COUNT(*) AS cpt
    FROM Membre JOIN Emprunt 
                    ON Membre.IdMembre = Emprunt.IdMembre 
                JOIN Livre      
                    ON Emprunt.IdLivre = Livre.IdLivre
    GROUP BY nomMembre, adrMembre
    HAVING cpt IN(
        SELECT COUNT(DISTINCT auteurLivre) AS cpt
        FROM Livre)
    );


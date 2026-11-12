-- R3.07 -- TP Index et optimisation
-- Genere un jeu de donnees volumineux dans un schema separe "perf"
-- (100 000 clients, 200 000 comptes, 1 000 000 d'operations).
-- Duree : quelques secondes. Le script peut etre relance (il repart de zero).
-- Volontairement : AUCUN index en dehors des cles primaires.

DROP SCHEMA IF EXISTS perf CASCADE;
CREATE SCHEMA perf;
SET search_path TO perf;

CREATE TABLE Client (
    numClient       INT PRIMARY KEY,
    nomClient       VARCHAR(50) NOT NULL,
    prenomClient    VARCHAR(50) NOT NULL,
    ville           VARCHAR(50) NOT NULL,
    dateNaissClient DATE
);

CREATE TABLE Compte (
    numCompte  INT PRIMARY KEY,
    solde      NUMERIC(12,2) NOT NULL,
    typeCompte VARCHAR(20) NOT NULL,
    numClient  INT NOT NULL REFERENCES Client(numClient)
);

CREATE TABLE Operation (
    numOperation  INT PRIMARY KEY,
    dateOperation DATE NOT NULL,
    typeOperation VARCHAR(10) NOT NULL,
    montant       NUMERIC(10,2) NOT NULL,
    numCompte     INT NOT NULL REFERENCES Compte(numCompte)
);

SELECT setseed(0.307);  -- donnees identiques pour tout le monde

INSERT INTO Client
SELECT g,
       'Nom' || g,
       (ARRAY['Anne','Yann','Lena','Malo','Nora','Tom','Ines','Paul'])[1 + g % 8],
       (ARRAY['Vannes','Lorient','Rennes','Brest','Nantes'])[1 + g % 5],
       DATE '1950-01-01' + (random() * 20000)::int
FROM generate_series(1, 100000) AS g;

INSERT INTO Compte
SELECT g,
       round((random() * 10000)::numeric, 2),
       (ARRAY['COURANT','EPARGNE'])[1 + g % 2],
       1 + (g - 1) % 100000
FROM generate_series(1, 200000) AS g;

INSERT INTO Operation
SELECT g,
       DATE '2020-01-01' + (random() * 2000)::int,
       (ARRAY['DEPOT','RETRAIT','VIREMENT'])[1 + (random() * 2)::int],
       round((random() * 1000)::numeric, 2),
       1 + (random() * 199999)::int
FROM generate_series(1, 1000000) AS g;

ANALYZE;

SELECT 'Client' AS table_, count(*) FROM Client
UNION ALL SELECT 'Compte', count(*) FROM Compte
UNION ALL SELECT 'Operation', count(*) FROM Operation;

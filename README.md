# R3.07 — SQL dans un langage de programmation (BUT2 Informatique, IUT de Vannes) — 2026/2027

## Organisation du dépôt

```
cours/ch1_jdbc … ch7_plpgsql     diapos (beamer), un dossier par chapitre ; code/ et img/ éventuels
tp/tp1_jdbc … tp6_plpgsql         sujets de TP ; code/ fourni aux étudiants ; correction/ (non publié)
quiz/quiz1, quiz/quiz2           questions Moodle (XML, non publié)
latex/common/                    préambules communs (diapos, TP) et logos
docs/                            plan prévisionnel (plan_cours.odt/.pdf)
archive/2025-2026/               supports de l'an dernier et fichiers retirés (non publié)
```

Le dépôt est **public** : les dossiers `tp/*/correction/`, `quiz/` et `archive/` sont ignorés par Git.
Une correction est publiée à la fin des séances du TP, en forçant son ajout :

```
git add -f tp/tp1_jdbc/correction/
git commit -m "Correction du TP1"
```

Une fois ajoutée, elle est suivie normalement (les modifications suivantes se commitent sans `-f`).

Chaque support se compile depuis son dossier, par exemple :

```
cd cours/ch1_jdbc && latexmk -pdf ch1_jdbc.tex
```

| Chapitre | TP |
|---|---|
| 1 JDBC | TP1 JDBC : tables de base, CRUD |
| 2 Transactions et concurrence | TP2 Contraintes, transactions, concurrence |
| 3 Index et optimisation | TP3 Index |
| 4 JPA, 5 DAO/DTO | TP4 JPA + DAO/DTO |
| 6 Repository et Spring Data | TP5 Repository |
| 7 PL/pgSQL : procédures, exceptions, curseurs, triggers | TP6 Procédures stockées et triggers |

Équipe : Chouki Tibermacine (Gr A et Gr B) · Selena Lamari (Gr C).

Pas de CM : toutes les séances sont des TD. Les parties de cours (chapitres) sont faites par l'enseignant·e du groupe, au début des séances indiquées ci-dessous. Les trois groupes ont 18 séances et suivent la même progression ; seule la répartition par semaine change (docs/plan_cours.pdf) :

| Sem. | 47 | 48 | 49 | 50 | 51 | 02 |
|---|---|---|---|---|---|---|
| Gr A | 3 | 3 | 3 | 2 | 4 | 3 |
| Gr B | 3 | 3 | 2 | 2 | 5 | 3 |
| Gr C | 3 | 3 | 3 | 3 | 3 | 3 |

La colonne « Sem. » du tableau ci-dessous suit les groupes A et B. Le groupe C suit l'ordre du groupe A (Index en séance 9, semaine 49) ; seule sa séance 12 (TP4 2/3) tombe en semaine 50 au lieu de 51.

## Répartition des 18 séances (1h30)

Chapitres : 1 JDBC · 2 Transactions et concurrence · 3 Index et optimisation · 4 JPA · 5 DAO/DTO · 6 Repository et Spring Data · 7 Procédures stockées, curseurs, triggers.

| Gr A | Gr B | Gr C | Sem. | Contenu | Supports |
|---|---|---|---|---|---|
| 1 | 1 | 1 | 47 (16/11) | Ch. 1 JDBC recentré (installation, Docker, CLOB/BLOB, RowSet en annexe) | cours/ch1_jdbc |
| 2 | 2 | 2 | 47 | TP1 (1/3) : docker-compose, init.sql, psql, connexion | tp/tp1_jdbc |
| 3 | 3 | 3 | 47 | TP1 (2/3) : CRUD | tp/tp1_jdbc |
| 4 | 4 | 4 | 48 (23/11) | TP1 (3/3) + rendu (dockerisation de l'appli = bonus) | tp/tp1_jdbc |
| 5 | 5 | 5 | 48 | Ch. 2 Transactions et concurrence + exigences de rendu (Git, README, .env) | cours/ch2_transactions |
| 6 | 6 | 6 | 48 | TP2 (1/3) : contraintes, .env, transactions | tp/tp2_transactions |
| 7 | 7 | 7 | 49 (30/11) | TP2 (2/3) : table associative, gestion des exceptions | tp/tp2_transactions |
| 8 | 8 | 8 | 49 | TP2 (3/3) : concurrence d'accès (psql à deux terminaux, puis Java) | tp/tp2_transactions |
| 9 | — | 9 | 49 | Gr A et C : Ch. 3 Index (30 min) + TP3 Index (1 h) | cours/ch3_index, tp/tp3_index |
| 10 | 9 | 10 | 50 (07/12) | Ch. 4 JPA | cours/ch4_jpa |
| 11 | 10 | 11 | 50 | **Quiz 1** (15 min) + Ch. 5 DAO/DTO (30 min) + début TP4 | quiz/quiz1, cours/ch5_dao_dto, tp/tp4_jpa_dao_dto |
| — | 11 | — | 51 (14/12) | Gr B : Ch. 3 Index (30 min) + TP3 Index (1 h) | cours/ch3_index, tp/tp3_index |
| 12 | 12 | 12 (sem. 50) | 51 | TP4 (2/3) : entités Client/Compte/Operation + DAO | tp/tp4_jpa_dao_dto |
| 13 | 13 | 13 | 51 | TP4 (3/3) : DTO, service, tests + rendu (bonus N+1) | tp/tp4_jpa_dao_dto |
| 14 | 14 | 14 | 51 | Ch. 6 Repository et Spring Data (45 min) + début TP5 | cours/ch6_spring_data, tp/tp5_repository |
| 15 | 15 | 15 | 51 | TP5 Repository | tp/tp5_repository |
| 16 | 16 | 16 | 02 (04/01) | **Quiz 2** (15 min) + Ch. 7 Procédures stockées, curseurs, exceptions, triggers | quiz/quiz2, cours/ch7_plpgsql |
| 17 | 17 | 17 | 02 | TP6 (1/2) : virement (exceptions, appel JDBC), curseurs | tp/tp6_plpgsql |
| 18 | 18 | 18 | 02 | TP6 (2/2) : triggers + rendu final | tp/tp6_plpgsql |

Volume : 27 h encadrées (PN : 24 h dont 14 h TP).

## Couverture du programme national
| Savoir de référence | Où |
|---|---|
| SQL intégré (JDBC, JPA, Spring) | Ch. 1, 4, 5, 6 ; TP1 à TP5 |
| Procédures, curseurs, triggers, exceptions | Ch. 7 ; TP6 (ex. 1 à 3) |
| Transactions et concurrence d'accès | Ch. 2 ; TP2 partie 3 ; TP6 |
| Persistance des données | Ch. 4 à 6 ; TP4, TP5 |
| Index et optimisation | Ch. 3 ; TP3 Index ; bonus N+1 du TP4 |

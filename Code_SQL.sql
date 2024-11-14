DROP TABLE IF EXISTS Etudiant ;
CREATE TABLE Etudiant (NumCNIEtu_Etudiant VARCHAR(44) AUTO_INCREMENT NOT NULL,
NomEtu_Etudiant VARCHAR(44),
PrenomEtu_Etudiant VARCHAR(44),
AdresseEtu_Etudiant VARCHAR(44),
NiveauEtu_Etudiant VARCHAR(44),
PRIMARY KEY (NumCNIEtu_Etudiant)) ENGINE=InnoDB;

DROP TABLE IF EXISTS Session ;
CREATE TABLE Session (CodeSess_Session VARCHAR(22) AUTO_INCREMENT NOT NULL,
NomSess_Session VARCHAR(22),
DateDebut_Session VARCHAR(33),
DateFin_Session VARCHAR(44),
CodeForm_Formation VARCHAR(44),
PRIMARY KEY (CodeSess_Session)) ENGINE=InnoDB;

DROP TABLE IF EXISTS Formation ;
CREATE TABLE Formation (CodeForm_Formation VARCHAR(55) AUTO_INCREMENT NOT NULL,
TitreForm_Formation VARCHAR(33),
DureeForm_Formation VARCHAR(33),
PrixForm_Formation VARCHAR(33),
PRIMARY KEY (CodeForm_Formation)) ENGINE=InnoDB;

DROP TABLE IF EXISTS Specialite ;
CREATE TABLE Specialite (CodeSpec_Specialite VARCHAR(22) AUTO_INCREMENT NOT NULL,
NomSpec_Specialite VARCHAR(33),
DescSpec_Specialite VARCHAR(44),
PRIMARY KEY (CodeSpec_Specialite)) ENGINE=InnoDB;

DROP TABLE IF EXISTS est_inscrit ;
CREATE TABLE est_inscrit (NumCNIEtu_Etudiant VARCHAR(44),
AUTO_INCREMENT NOT NULL,
CodeSess_Session VARCHAR(44),NOT NULL,
TypeCours_est inscrit VARCHAR(32),
PRIMARY KEY (NumCNIEtu_Etudiant,
 CodeSess_Session)) ENGINE=InnoDB;

DROP TABLE IF EXISTS Appartient ;
CREATE TABLE Appartient (CodeForm_Formation VARCHAR(44),AUTO_INCREMENT NOT NULL,
CodeSpec_Specialite VARCHAR(44),NOT NULL,
PRIMARY KEY (CodeForm_Formation,
 CodeSpec_Specialite)) ENGINE=InnoDB;

ALTER TABLE Session ADD CONSTRAINT FK_Session_CodeForm_Formation FOREIGN KEY (CodeForm_Formation) REFERENCES Formation (CodeForm_Formation);
ALTER TABLE est_inscrit ADD CONSTRAINT FK_est_inscrit_NumCNIEtu_Etudiant FOREIGN KEY (NumCNIEtu_Etudiant) REFERENCES Etudiant (NumCNIEtu_Etudiant);
ALTER TABLE est_inscrit ADD CONSTRAINT FK_est_inscrit_CodeSess_Session FOREIGN KEY (CodeSess_Session) REFERENCES Session (CodeSess_Session);
ALTER TABLE Appartient ADD CONSTRAINT FK_Appartient_CodeForm_Formation FOREIGN KEY (CodeForm_Formation) REFERENCES Formation (CodeForm_Formation);
ALTER TABLE Appartient ADD CONSTRAINT FK_Appartient_CodeSpec_Specialite FOREIGN KEY (CodeSpec_Specialite) REFERENCES Specialite (CodeSpec_Specialite);

3.	Ajout de la contrainte CHECK dans la tabke « Session »
ALTER TABLE Session ADD CONSTRAINT CK_Session_datefin CHECK (datefin > datedébut);

4.	Ajout de la colonne “Active” sur la table “Specialite”
ALTER TABLE Specialite ADD Active BIT;

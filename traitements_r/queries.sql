-- Ajout des champs utilisés par le faker
ALTER TABLE poi84 ADD COLUMN gestionnaire text;
ALTER TABLE poi84 ADD COLUMN note_public decimal;
ALTER TABLE poi84 ADD COLUMN note_critique decimal;
ALTER TABLE poi84 ADD COLUMN type_critique text;
ALTER TABLE poi84 ADD COLUMN occupation integer;

-- Création de la table poi84_caracteristics
CREATE TABLE poi84_caracteristics AS SELECT gestionnaire,
note_public, note_critique, type_critique, occupation FROM poi84;

-- Vidage du contenu de la table poi84_caracteristics
DELETE FROM poi84_caracteristics;

-- Création d'un champ de jointure de type SERIAL dans la table poi84_caracteristics
ALTER TABLE poi84_caracteristics ADD COLUMN gid SERIAL;

-- MàJ du champ gestionnaire
UPDATE poi84 b SET gestionnaire = a.gestionnaire
FROM poi84_caracteristics a WHERE a.gid = b.gid;

-- MàJ du champ note_public
UPDATE poi84 b SET note_public = a.note_public
FROM poi84_caracteristics a WHERE a.gid = b.gid;

-- MàJ du champ note_critique
UPDATE poi84 b SET note_critique = a.note_critique
FROM poi84_caracteristics a WHERE a.gid = b.gid;

-- MàJ du champ type_critique
UPDATE poi84 b SET type_critique = a.type_critique
FROM poi84_caracteristics a WHERE a.gid = b.gid;

-- MàJ du champ occupation
UPDATE poi84 b SET occupation = a.occupation
FROM poi84_caracteristics a WHERE a.gid = b.gid;
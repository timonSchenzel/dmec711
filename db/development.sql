DROP TABLE IF EXISTS "clients";
CREATE TABLE "clients"(
  "id" INTEGER PRIMARY KEY NOT NULL,
  "name" TEXT,
  "photo" VARCHAR(100)
);
INSERT INTO "clients" VALUES(1,'Hans','p4.jpg');
INSERT INTO "clients" VALUES(2,'Annemarie','2.jpg');
INSERT INTO "clients" VALUES(3,'Danny','p2.jpg');
INSERT INTO "clients" VALUES(4,'Emiel','p6.jpg');
INSERT INTO "clients" VALUES(5,'Kim','p3.jpg');
DROP TABLE IF EXISTS "clients_therapies";
CREATE TABLE "clients_therapies"(
  "therapies_id" INTEGER NOT NULL,
  "clients_id" INTEGER NOT NULL,
  PRIMARY KEY("therapies_id","clients_id"),
  CONSTRAINT "fk_clients_therapies_therapies1"
    FOREIGN KEY("therapies_id")
    REFERENCES "therapies"("id"),
  CONSTRAINT "fk_clients_therapies_clients1"
    FOREIGN KEY("clients_id")
    REFERENCES "clients"("id")
);
DROP TABLE IF EXISTS "dossier_items";
CREATE TABLE "dossier_items"(
  "id" INTEGER PRIMARY KEY NOT NULL,
  "name" TEXT,
  "description" TEXT,
  "dossier_id" INTEGER NOT NULL,
  "created_at" DATETIME,
  "updated_at" DATETIME,
  CONSTRAINT "fk_therapeuten_dossiers1"
    FOREIGN KEY("dossier_id")
    REFERENCES "dossiers"("id")
);
INSERT INTO "dossier_items" VALUES(1,'Arm/hand oefening','Oefening gedaan om de arm/hand coördinatie te verbeteren',1,NULL,NULL);
INSERT INTO "dossier_items" VALUES(2,'Mes en vork oefening','Oefenen met mes en vork eten',2,NULL,NULL);
INSERT INTO "dossier_items" VALUES(3,'Kopje vasthouden','Oefenen met het vasthouden van een kopje',3,NULL,NULL);
INSERT INTO "dossier_items" VALUES(4,'Loop oefening','Lopen oefenen',4,NULL,NULL);
INSERT INTO "dossier_items" VALUES(5,'Bloemen snijden','Leren snijden van bloemen',5,NULL,NULL);
INSERT INTO "dossier_items" VALUES(6,'Bloemen snijden','Leren snijden van bloemen',1,NULL,NULL);
INSERT INTO "dossier_items" VALUES(7,'Loop oefening','Lopen oefenen',1,NULL,NULL);
INSERT INTO "dossier_items" VALUES(8,'Kopje vasthouden','Oefenen met het vasthouden van een kopje',2,NULL,NULL);
INSERT INTO "dossier_items" VALUES(9,'Loop oefening','Lopen oefenen',3,NULL,NULL);
INSERT INTO "dossier_items" VALUES(10,'Bloemen snijden','Leren snijden van bloemen',4,NULL,NULL);
INSERT INTO "dossier_items" VALUES(11,'Loop oefening','Lopen oefenen',5,NULL,NULL);
DROP TABLE IF EXISTS "dossiers";
CREATE TABLE "dossiers"(
  "id" INTEGER PRIMARY KEY NOT NULL,
  "name" TEXT,
  "photo" VARCHAR(100),
  "client_id" INTEGER NOT NULL,
  CONSTRAINT "fk_dossiers_clienten1"
    FOREIGN KEY("client_id")
    REFERENCES "clients"("id")
);
INSERT INTO "dossiers" VALUES(1,'Dossier',NULL,1);
INSERT INTO "dossiers" VALUES(2,'Dossier',NULL,2);
INSERT INTO "dossiers" VALUES(3,'Dossier',NULL,3);
INSERT INTO "dossiers" VALUES(4,'Dossier',NULL,4);
INSERT INTO "dossiers" VALUES(5,'Dossier',NULL,5);
DROP TABLE IF EXISTS "exersises";
CREATE TABLE "exersises"(
  "id" INTEGER PRIMARY KEY NOT NULL,
  "name" TEXT,
  "discriptions" TEXT,
  "therapy_id" INTEGER NOT NULL,
  CONSTRAINT "fk_exersise_therapies1"
    FOREIGN KEY("therapy_id")
    REFERENCES "therapies"("id")
);
DROP TABLE IF EXISTS "notes";
CREATE TABLE "notes"(
  "id" INTEGER PRIMARY KEY NOT NULL,
  "name" TEXT,
  "description" TEXT,
  "client_id" INTEGER NOT NULL,
  "created_at" DATETIME,
  "updated_at" DATETIME,
  CONSTRAINT "fk_notes_clients1"
    FOREIGN KEY("client_id")
    REFERENCES "clients"("id")
);
DROP TABLE IF EXISTS "schema_migrations";
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
DROP TABLE IF EXISTS "therapies";
CREATE TABLE "therapies" ("id" INTEGER PRIMARY KEY  NOT NULL ,"name" TEXT,"discriptions" TEXT,"therapist_id" INTEGER NOT NULL );
INSERT INTO "therapies" VALUES(1,'Arm/hand therapie','Arm/hand oefeningen',1);
INSERT INTO "therapies" VALUES(2,'Eten met mes en vork','Een patiënt leren eten met mes en vrok',1);
DROP TABLE IF EXISTS "therapist_clients";
CREATE TABLE "therapist_clients"(
  "therapist_id" INTEGER NOT NULL,
  "client_id" INTEGER NOT NULL,
  PRIMARY KEY("therapist_id","client_id"),
  CONSTRAINT "fk_clienten_copy1_therapeuten1"
    FOREIGN KEY("therapist_id")
    REFERENCES "therapists"("id"),
  CONSTRAINT "fk_clienten_copy1_clienten1"
    FOREIGN KEY("client_id")
    REFERENCES "clients"("id")
);
INSERT INTO "therapist_clients" VALUES(1,1);
INSERT INTO "therapist_clients" VALUES(1,4);
DROP TABLE IF EXISTS "therapists";
CREATE TABLE "therapists" ("id" INTEGER PRIMARY KEY  NOT NULL ,"name" TEXT,"email" TEXT,"password_digest" TEXT,"remember_token" VARCHAR);
INSERT INTO "therapists" VALUES(1,'Henk','henk@han.nl','$2a$10$sjCpM60.GSHatpMR.ns66.QhhZ8myXnAVkactJe3KDtcezudaoK/2','MQbMgy8bojVDLoNIRNnttA');
CREATE INDEX "clients_therapies.fk_clients_therapies_clients1_idx" ON "clients_therapies"("clients_id");
CREATE INDEX "clients_therapies.fk_clients_therapies_therapies1_idx" ON "clients_therapies"("therapies_id");
CREATE INDEX "dossier_items.fk_therapeuten_dossiers1_idx" ON "dossier_items"("dossier_id");
CREATE INDEX "dossiers.fk_dossiers_clienten1_idx" ON "dossiers"("client_id");
CREATE INDEX "exersises.fk_exersise_therapies1_idx" ON "exersises"("therapy_id");
CREATE INDEX "notes.fk_notes_clients1_idx" ON "notes"("client_id");
CREATE INDEX "therapeuts_clients.fk_clienten_copy1_clienten1_idx" ON "therapist_clients"("client_id");
CREATE INDEX "therapeuts_clients.fk_clienten_copy1_therapeuten1_idx" ON "therapist_clients"("therapist_id");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");

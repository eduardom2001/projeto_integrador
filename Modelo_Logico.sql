-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "secretario" (
    "CPF" varchar(11)  NOT NULL ,
    "email" varchar(50)  NOT NULL ,
    "nome" varchar(69)  NOT NULL ,
    "senha" varchar(50)  NOT NULL ,
    "tel1" varchar(11)  NOT NULL ,
    "tel2" varchar(11)  NOT NULL ,
    CONSTRAINT "pk_secretario" PRIMARY KEY (
        "CPF"
    )
)

GO

CREATE TABLE "dentista" (
    "CPF" varchar(11)  NOT NULL ,
    "email" varchar(50)  NOT NULL ,
    "nome" varchar(69)  NOT NULL ,
    "senha" varchar(50)  NOT NULL ,
    "tel1" varchar(11)  NOT NULL ,
    "tel2" varchar(11)  NOT NULL ,
    CONSTRAINT "pk_dentista" PRIMARY KEY (
        "CPF"
    )
)

GO

CREATE TABLE "consulta" (
    "ID" int  NOT NULL ,
    "CPF" varchar(11)  NOT NULL ,
    "datecon" date  NOT NULL ,
    "IDP" int  NOT NULL ,
    "IDD" int  NOT NULL ,
    CONSTRAINT "pk_consulta" PRIMARY KEY (
        "ID"
    )
)

GO

CREATE TABLE "solicitaexame" (
    "IDC" int  NOT NULL ,
    "IDE" int  NOT NULL 
)

GO

CREATE TABLE "exames" (
    "ID" int  NOT NULL ,
    "tipo" varchar(50)  NOT NULL ,
    "date" date  NULL ,
    "IDP" int  NOT NULL ,
    CONSTRAINT "pk_exames" PRIMARY KEY (
        "ID"
    )
)

GO

CREATE TABLE "paciente" (
    "ID" int  NOT NULL ,
    "CPF" varchar(11)  NULL ,
    "tel1" varchar(11)  NOT NULL ,
    "tel2" varchar(11)  NOT NULL ,
    "nome" varchar(69)  NOT NULL ,
    "convenio" varchar(69)  NOT NULL ,
    "rua" varchar(50)  NOT NULL ,
    "num" int  NOT NULL ,
    "bairro" varchar(50)  NOT NULL ,
    "email" varchar(50)  NOT NULL ,
    CONSTRAINT "pk_paciente" PRIMARY KEY (
        "ID"
    )
)

GO

CREATE TABLE "descricao" (
    "ID" int  NOT NULL ,
    "data" date  NOT NULL ,
    "conteudo" varchar(255)  NOT NULL ,
    CONSTRAINT "pk_descricao" PRIMARY KEY (
        "ID"
    )
)

GO

ALTER TABLE "consulta" ADD CONSTRAINT "fk_consulta_CPF" FOREIGN KEY("CPF")
REFERENCES "dentista" ("CPF")
GO

ALTER TABLE "consulta" ADD CONSTRAINT "fk_consulta_IDP" FOREIGN KEY("IDP")
REFERENCES "paciente" ("ID")
GO

ALTER TABLE "consulta" ADD CONSTRAINT "fk_consulta_IDD" FOREIGN KEY("IDD")
REFERENCES "descricao" ("ID")
GO

ALTER TABLE "solicitaexame" ADD CONSTRAINT "fk_solicitaexame_IDC" FOREIGN KEY("IDC")
REFERENCES "consulta" ("ID")
GO

ALTER TABLE "solicitaexame" ADD CONSTRAINT "fk_solicitaexame_IDE" FOREIGN KEY("IDE")
REFERENCES "exames" ("ID")
GO

ALTER TABLE "exames" ADD CONSTRAINT "fk_exames_IDP" FOREIGN KEY("IDP")
REFERENCES "paciente" ("ID")
GO


create table secretario(
    cpf         varchar(11) not null constraint pk_secretario primary key,
    email       varchar(50) not null,
    nome        varchar(50) not null,
    senha       varchar(100) not null,
    tel1        varchar(13) not null,
    tel2        varchar(13) null
    );
--
create table dentista(
    cpf         varchar(11) not null constraint pk_dentista primary key,
    email       varchar(50) not null,
    nome        varchar(50) not null,
    senha       varchar(100) not null,
    tel1        varchar(13) not null,
    tel2        varchar(13) null
);
--
create table paciente(
    id          int not null constraint pk_paciente primary key,
    cpf         varchar(11) null,
    tel1        varchar(13) not null,
    tel2        varchar(13) null,
    nome        varchar(50) not null,
    convenio    varchar(50) not null,
    rua         varchar(50) null,
    num         int null,
    bairro      varchar(50) null,
    email       varchar(50) null
);
--
create table consulta(
    id          int not null constraint pk_consulta primary key,
    cpf         varchar(11) not null,
    datacon     date not null,
    idp         int not null,
    constraint fk_dentista foreign key (cpf) references dentista(cpf),
    constraint fk_paciente foreign key (idp) references paciente(id)
);
--
create table exames(
    id          int not null constraint pk_exames primary key,
    tipo        varchar(50) not null,
    dataex      date null,
    idp         int not null,
    constraint fk_paciente foreign key (idp) references paciente(id)
);
--
create table solicitaexame(
    idc         int not null,
    ide         int not null,
    constraint pk_solicitaexame primary key (idc, ide),
    constraint fk_consulta foreign key (idc) references consulta(id),
    constraint fk_exames foreign key (ide) references exames(id)
);
--
create table descricao(
    id          int not null constraint pk_descricao primary key,
    datades     date not null,
    conteudo    varchar(300) not null,
    cpf         varchar(11) not null,
    idc         int not null,
    constraint fk_dentista foreign key (cpf) references dentista(cpf),
    constraint fk_consulta foreign key (idc) references consulta(id)
);
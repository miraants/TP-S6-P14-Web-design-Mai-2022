DROP DATABASE seo_article;
CREATE DATABASE seo_article ;
CREATE USER seo PASSWORD 'seo';
ALTER DATABASE seo_article OWNER TO seo;
\c seo_article seo;
seo

create table categorie(
    idCategorie serial primary key not null,
    nom varchar(150) not null
);

insert into categorie values 
    (default, 'sport'),
    (default, 'faits divers'),
    (default, 'politique');


create table article(
    idArticle serial primary key not null,
    resume varchar not null,
    idCategorie int not null,
    contenu varchar not null
);

alter table article add foreign key (idCategorie) references categorie(idCategorie);

create or replace view v_article as 
select a.*, c.nom from article a join categorie c on a.idCategorie=c.idCategorie;

insert into article values 
    (default, 'Guerre Ukraine Russie', 3, 'Debarquement des troupes russes en Europe'),
    (default, 'Madagascar - Centrafrique', 1, 'Resultat des scores 0-2; Les Bareas s inclinent a domocile'),
    (default, 'Tsimbazaza', 2, 'Le parc zoologique au bord de la fermeture definitive');

show databases;
create database BD;
use BD;
create table Auteurs(NoAuteur int, Nom_auteur varchar(50), mail varchar(50),primary key(NoAuteur));
create table Editeur(NoEditeur int, Nom_Editeur varchar(50), adresse varchar(50), telephone varchar(20), primary key(NoEditeur));
create table Livre(ID_livre int,titre varchar(50),Nbr_exemplaire int,NoEditeur int,primary key(ID_livre),foreign key(NoEditeur)references Editeur(NoEditeur));
create table Ecritpar(ID_livre int,NoAuteur int, primary key(ID_livre,NoAuteur),foreign key(ID_livre)references Livre(ID_livre),foreign key(NoAuteur)references Auteurs(NoAuteur));

insert into Editeur(NoEditeur,Nom_Editeur,adresse,telephone) 
values (1,"Editeur1","yaghmoracen","066666666");
insert into Editeur(NoEditeur,Nom_Editeur,adresse,telephone) 
values (2,"Editeur2","Mosta","07777777");
insert into Editeur(NoEditeur,Nom_Editeur,adresse,telephone) 
values (3,"Editeur3","mdin jdida","088888888");

insert into Auteurs(NoAuteur,Nom_auteur,mail) 
values (1,"Auteur1","yaghmoracen@moh.com");
insert into Auteurs(NoAuteur,Nom_auteur,mail) 
values (2,"Auteur2","mosta@moh.com");
insert into Auteurs(NoAuteur,Nom_auteur,mail) 
values (3,"Auteur3","mdinjdida@moh.com");

insert into Livre(ID_livre,titre,Nbr_exemplaire,NoEditeur)
values(1,"Harry Potter",15,2);
insert into Livre(ID_livre,titre,Nbr_exemplaire,NoEditeur)
values(2,"les bases de données",5,1);
insert into Livre(ID_livre,titre,Nbr_exemplaire,NoEditeur)
values(3,"Schtrumpf",21,3);

insert into Ecritpar(ID_livre,NoAuteur)
values(1,1);
insert into Ecritpar(ID_livre,NoAuteur)
values(1,2);
insert into Ecritpar(ID_livre,NoAuteur)
values(1,3);
insert into Ecritpar(ID_livre,NoAuteur)
values(2,1);
insert into Ecritpar(ID_livre,NoAuteur)
values(3,1);
insert into Ecritpar(ID_livre,NoAuteur)
values(2,2);

select Nom_Editeur,Nom_auteur 
from Livre,Editeur,Ecritpar,Auteurs 
where titre="les bases de données"
and Livre.NoEditeur=Editeur.NoEditeur 
and Livre.ID_livre =Ecritpar.ID_livre
and Auteurs.NoAuteur = Ecritpar.NoAuteur;

alter table Livre
add column prix int;

alter table Livre
add column TVA float;

select (prix * 0.21) as TVA,titre
from Livre
where Nbr_exemplaire>10;

select count(*)
from Livre
where titre="les bases de données";

select * 
from Livre
group by NoEditeur;

delete from Editeur
where NoEditeur = 4;

delete from Auteurs
where NoAuteur = 4;

select *
from Auteurs
order by (Nom_auteur);
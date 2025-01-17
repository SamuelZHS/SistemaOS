-- SELECIONAR O BANCO DE DADOS
use dbsystemos;
-- O SCRIPT A BAIXO CRIA UMA TABELA
create table tbusers(
iduser int primary key,
usuario varchar(50) not null,
fone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null
);
-- COMANDO QUE DESCREVE A TABELA
describe tbusers;
-- INSERIR DADOS NA TABELA (CRUD)
-- CREATE == INSERT
insert into tbusers(iduser, usuario,fone,login,senha)
values(1, 'Samuel Santos','21985236259','samuelsantos','12345678');
-- EXIBIR DADOS DA TABELA (CRUD)

-- USUARIO 02
insert into tbusers(iduser, usuario,fone,login,senha)
values(2, 'Ennie Alves','2198554259','enniealves','12345678');
-- USUARIO 03
insert into tbusers(iduser, usuario,fone,login,senha)
values(3, 'Marlene Santos','21954821542','lena','12345678');
-- READ == SELECT
select*from tbusers;
-- MODIFICAR DADOS NA TABELA
-- UPDATE == ATUALIZAR
update tbusers set fone = '8888-8888' where iduser=1;
-- APAGA UM REGISTRO DA TABELA (CRUD)
-- DELETE == DELETE
delete from tbusers where iduser = 3;

select * from tbusers; 


create table tbclientes(
idcli int primary key auto_increment,
nomecli varchar(50) not null,
endcli varchar(100),
fonecli varchar(50) not null,
emailcli varchar(50) unique
);

describe tbclientes;

insert into tbclientes(nomecli, endcli,fonecli,emailcli)
values('Jonas Silva','Rua Antonio Carlos, 2873','8888-8888','jonassilva@corporate.com');

select * from tbclientes;

update tbclientes set nomecli = 'Rodrigo Pereira' where idcli = '2';
update tbclientes set emailcli = 'rodrigopereira@corporate' where idcli = '2';

use dbsystemos;

create table tbos(
os int primary key auto_increment,
data_os timestamp default current_timestamp,
equipamento varchar(150) not null,
defeito varchar(150) not null,
servico varchar(150),
tecnico varchar(30),
valor decimal(10,2),
idcli int not null,
foreign key(idcli) references tbclientes(idcli)
);

describe tbos;

insert into tbos (equipamento,defeito,servico,tecnico,valor,idcli)
values ('Notebook','Não liga','Troca da fonte','Samuel','350.00',1);

select * from tbos;

-- TRAZER INFORMAÇÕES DE DUAS TABELAS
select
O.os,equipamento,defeito,valor,servico,
C.nomecli,fonecli
from tbos as O
inner join tbclientes as C
on (O.idcli = C.idcli);



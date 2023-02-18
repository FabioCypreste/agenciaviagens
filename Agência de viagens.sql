
/* O comando abaixo é  utilizado para criar o banco de dados de uma agência de viagens internacionais*/
create database AgenciaViagens;

/* O comando abaixo é utilizado para se utilizar o banco de dados criado anteriormente*/
use AgenciaViagens;

/* Abaixo, será criada a tabela 'passagem' da agência de viagens*/

create table passagem (
id_passagem int primary key AUTO_INCREMENT,
numero_passagem int UNIQUE not null,
preco_passagem decimal(5,2), /* O cliente pode ter ganho a passagem em um sorteio */ 
poltrona_passagem int not null UNIQUE, /* A poltrona será localizada por números de até 3 dígitos, ex: Poltrona 182, poltrona 091...*/
classe_passagem varchar(1) not null, /* Classes do avião: S: Classe Econômica, F> Primeira Classe*/
data_passagem date not null
);
 /* Abaixo, será criada a tabela 'aviao'*/
 
create table aviao (
id_aviao int primary key not null AUTO_INCREMENT,
cor_aviao varchar(20) not null,
fabricante_aviao varchar(30) not null,
ano_aviao date not null,
tipo_aviao varchar(30) not null,
capacidade_aviao int not null,
nome_piloto_aviao varchar(40) not null,
pecas_trocadas boolean /*Está coluna refere-se a se o avião teve peças trocadas ao longo do tempo.*/
);

create table voo (
id_voo int primary key AUTO_INCREMENT, /* Chave primária*/
num_voo int UNIQUE,
companhia_voo varchar(40) not null,
horário_voo date,
destino_voo varchar(70),
fk_id_aviao int, /* Não está declarada como not null pois um avião pode voar sem passageiros*/
foreign key (fk_id_aviao) references aviao (id_aviao) /* Um voo precisa acontecer com um avião*/
);

create table cliente ( 
id_cliente int primary key AUTO_INCREMENT,
nome_cliente varchar(45) not null,
cpf_cliente varchar(11) not null UNIQUE,
nacionalidade_cliente varchar(20) not null, 
numero_passaporte int not null UNIQUE,
codigo_telefônico int not null, /* Exemplo: +055 (Brasil), adicionei esta tabela pois é necessária para ligações internacionais, assim como alguns países não aceitam o código telefônico como DDD*/
ddd_cliente int not null,
telefone_cliente int not null,
endereço_cliente varchar(100) not null,
tipo_sanguineo varchar(3) not null, /* Para o caso de incidentes na viagem que sejam necessárias transfusões de sangue*/
fk_id_passagem int, /* Esta fk está sem not null por conta de alguém poder ser cliente sem ter uma passagem (ex: Perdido a passagem ou não ter comprado uma passagem, mas um alimento na loja de conveniências)*/
foreign key cliente (fk_id_passagem) references passagem (id_passagem)
);

create table aeroporto (
id_aeroporto int primary key AUTO_INCREMENT,
codigo_aeroporto varchar(3) not null UNIQUE,
nome_aeroporto varchar(80) not null UNIQUE, /* O nome será UNIQUE pois mesmo que possuam locais com nomes parecidos ou iguais, podem ser diferenciados no código do avião*/
localizacao_aeroporto varchar(70) not null,
fk_id_voo int, /* Esta fk está sem o not null pois o aeroporto pode não ter nenhum voo em um dia */
foreign key (fk_id_voo) references voo (id_voo) /*Um aeroporto pode ter vários voos*/
);

/* Abaixo, estão os inserts para as colunas da tabela 'passagem'*/

insert into passagem(numero_passagem, preco_passagem, poltrona_passagem, classe_passagem, data_passagem) values(01, 399.99, 001, 'S', "2022-01-01"); 
insert into passagem(numero_passagem, preco_passagem, poltrona_passagem, classe_passagem, data_passagem) values(02, 199.99, 002, 'F', '2022-02-02'); 
insert into passagem(numero_passagem, preco_passagem, poltrona_passagem, classe_passagem, data_passagem) values(03, 699.99, 003, 'S', '2022-03-03'); 
insert into passagem(numero_passagem, preco_passagem, poltrona_passagem, classe_passagem, data_passagem) values(04, 549.99, 004, 'F', '2022-04-04'); 
insert into passagem(numero_passagem, preco_passagem, poltrona_passagem, classe_passagem, data_passagem) values(05, 679.99, 005, 'F', '2022-05-05'); 
insert into passagem(numero_passagem, preco_passagem, poltrona_passagem, classe_passagem, data_passagem) values(06, 599.99, 006, 'F', '2022-06-06'); 
insert into passagem(numero_passagem, preco_passagem, poltrona_passagem, classe_passagem, data_passagem) values(07, 586.99, 007, 'F', '2022-07-07'); 
insert into passagem(numero_passagem, preco_passagem, poltrona_passagem, classe_passagem, data_passagem) values(08, 530.99, 008, 'S', '2022-08-08'); 
insert into passagem(numero_passagem, preco_passagem, poltrona_passagem, classe_passagem, data_passagem) values(09, 399.99, 009, 'S', '2022-09-09'); 
insert into passagem(numero_passagem, preco_passagem, poltrona_passagem, classe_passagem, data_passagem) values(10, 100.99, 010, 'S', '2022-10-10');

/*Abaixo, estão os inserts para as colunas da tabela 'aviao'*/

insert into aviao(cor_aviao, fabricante_aviao, ano_aviao, tipo_aviao, capacidade_aviao, nome_piloto_aviao, pecas_trocadas) values('branco','Aviões do Forró', '2001-01-01', 'turboélice', 100,'Jeremias', false);
insert into aviao(cor_aviao, fabricante_aviao, ano_aviao, tipo_aviao, capacidade_aviao, nome_piloto_aviao, pecas_trocadas) values('branco','Aviões', '2001-01-01', 'turboélice', 100,'Tobias', false);
insert into aviao(cor_aviao, fabricante_aviao, ano_aviao, tipo_aviao, capacidade_aviao, nome_piloto_aviao, pecas_trocadas) values('branco','Avionetas', '2001-01-01', 'turboélice', 100,'Arthur', false);
insert into aviao(cor_aviao, fabricante_aviao, ano_aviao, tipo_aviao, capacidade_aviao, nome_piloto_aviao, pecas_trocadas) values('branco','Air', '2001-01-01', 'turboélice', 100,'Ellie', false);
insert into aviao(cor_aviao, fabricante_aviao, ano_aviao, tipo_aviao, capacidade_aviao, nome_piloto_aviao, pecas_trocadas) values('branco','Aéreo', '2001-01-01', 'turboélice', 100,'Judas', false);
insert into aviao(cor_aviao, fabricante_aviao, ano_aviao, tipo_aviao, capacidade_aviao, nome_piloto_aviao, pecas_trocadas) values('branco','Ventania', '2001-01-01', 'turboélice', 100,'Fábio', false);
insert into aviao(cor_aviao, fabricante_aviao, ano_aviao, tipo_aviao, capacidade_aviao, nome_piloto_aviao, pecas_trocadas) values('branco','Thousand Sunny', '2001-01-01', 'turboélice', 100,'Penha', false);
insert into aviao(cor_aviao, fabricante_aviao, ano_aviao, tipo_aviao, capacidade_aviao, nome_piloto_aviao, pecas_trocadas) values('branco','ZUUUUUUM', '2001-01-01', 'turboélice', 100,'Ana', false);
insert into aviao(cor_aviao, fabricante_aviao, ano_aviao, tipo_aviao, capacidade_aviao, nome_piloto_aviao, pecas_trocadas) values('branco','Hélices Cromadas', '2001-01-01', 'turboélice', 100,'Antônio', false);
insert into aviao(cor_aviao, fabricante_aviao, ano_aviao, tipo_aviao, capacidade_aviao, nome_piloto_aviao, pecas_trocadas) values('branco','É um pássaro?', '2001-01-01', 'turboélice', 100,'Luiz', false);

/*Abaixo, estão os inserts para as colunas da tabela 'voo'*/

insert into voo(num_voo, companhia_voo, horário_voo, destino_voo, fk_id_aviao) values(1123, 'Céu azul', '01-01-01', 'Guarulhos', 1);
insert into voo(num_voo, companhia_voo, horário_voo, destino_voo, fk_id_aviao) values(1234, 'Star', '02-02-02', 'Buenos Aires', 2);
insert into voo(num_voo, companhia_voo, horário_voo, destino_voo, fk_id_aviao) values(3456, 'Voe', '03-03-03', 'Palmas', 3);
insert into voo(num_voo, companhia_voo, horário_voo, destino_voo, fk_id_aviao) values(4567, 'Solar', '04-04-04', 'Caraguatatuba', 4);
insert into voo(num_voo, companhia_voo, horário_voo, destino_voo, fk_id_aviao) values(5678, 'Lua', '05-05-05', 'Washington', 5);
insert into voo(num_voo, companhia_voo, horário_voo, destino_voo, fk_id_aviao) values(6789, 'Subindo ao céu', '06-06-06', 'Toronto', 6);
insert into voo(num_voo, companhia_voo, horário_voo, destino_voo, fk_id_aviao) values(7890, 'Suba!', '07-07-07', 'Dubai', 7);
insert into voo(num_voo, companhia_voo, horário_voo, destino_voo, fk_id_aviao) values(8901, 'Flying', '08-08-08', 'Rio Branco', 8);
insert into voo(num_voo, companhia_voo, horário_voo, destino_voo, fk_id_aviao) values(9012, 'Voador', '09-09-09', 'Maraial', 9);
insert into voo(num_voo, companhia_voo, horário_voo, destino_voo, fk_id_aviao) values(1324, 'Zoom', '10-10-10', 'Shenzou', 10);

/*Abaixo, estão os inserts para as colunas da tabela 'cliente'*/

insert into cliente(nome_cliente, cpf_cliente, nacionalidade_cliente, numero_passaporte, codigo_telefônico, ddd_cliente, telefone_cliente, endereço_cliente, tipo_sanguineo, fk_id_passagem) values('João Silva', 11111111111, 'Brasileiro',111111, 055, 027, 111111111,  'Rua alguma coisa', 'AB+', 1);
insert into cliente(nome_cliente, cpf_cliente, nacionalidade_cliente, numero_passaporte, codigo_telefônico, ddd_cliente, telefone_cliente, endereço_cliente, tipo_sanguineo, fk_id_passagem) values('Flávio Costa', 22222222222, 'Brasileiro', 222222, +55, 21, 222222222, 'Avenida de lá', 'O-', 2);
insert into cliente(nome_cliente, cpf_cliente, nacionalidade_cliente, numero_passaporte, codigo_telefônico, ddd_cliente, telefone_cliente, endereço_cliente, tipo_sanguineo, fk_id_passagem) values('John Doe', 33333333333, 'Americano', 333333, +61, 61, 33333333, 'Avenue something', 'A-', 3);
insert into cliente(nome_cliente, cpf_cliente, nacionalidade_cliente, numero_passaporte, codigo_telefônico, ddd_cliente, telefone_cliente, endereço_cliente, tipo_sanguineo, fk_id_passagem) values('Maria Robin', 44444444444, 'Brasileira', 444444, +55, 28, 444444444, 'Rua dos bobos', 'O+', 4);
insert into cliente(nome_cliente, cpf_cliente, nacionalidade_cliente, numero_passaporte, codigo_telefônico, ddd_cliente, telefone_cliente, endereço_cliente, tipo_sanguineo, fk_id_passagem) values('Zé Zeca', 55555555555, 'Brasileiro', 555555, +55, 48, 555555555, 'Rua Algo', 'A-', 5);
insert into cliente(nome_cliente, cpf_cliente, nacionalidade_cliente, numero_passaporte, codigo_telefônico, ddd_cliente, telefone_cliente, endereço_cliente, tipo_sanguineo, fk_id_passagem) values('José Assis', 66666666666, 'Brasileiro', 666666, +55, 27, 666666666, 'Av, Carlos Lindoberg', 'O+', 6);
insert into cliente(nome_cliente, cpf_cliente, nacionalidade_cliente, numero_passaporte, codigo_telefônico, ddd_cliente, telefone_cliente, endereço_cliente, tipo_sanguineo, fk_id_passagem) values('Monkey D. Luffy', 77777777777, 'Brasileiro', 777777, +55, 56, 777777777, 'Av. Foosha', 'A+', 7);
insert into cliente(nome_cliente, cpf_cliente, nacionalidade_cliente, numero_passaporte, codigo_telefônico, ddd_cliente, telefone_cliente, endereço_cliente, tipo_sanguineo, fk_id_passagem) values('Kishimoto', 88888888888, 'Japonês', 888888, +81, 81, 888888888, 'Rua Folha', 'B-', 8);
insert into cliente(nome_cliente, cpf_cliente, nacionalidade_cliente, numero_passaporte, codigo_telefônico, ddd_cliente, telefone_cliente, endereço_cliente, tipo_sanguineo, fk_id_passagem) values('Peter Parker', 99999999999, 'Brasileiro', 999999, +55, 27, 999999999, 'Bruquilin', 'B+', 9);
insert into cliente(nome_cliente, cpf_cliente, nacionalidade_cliente, numero_passaporte, codigo_telefônico, ddd_cliente, telefone_cliente, endereço_cliente, tipo_sanguineo, fk_id_passagem) values('Fábio Zhang', 10101010101, 'Chinês', 101010, +86, +86, 101010101, 'Rua XingLing','B+', 10);

/*Abaixo, estão os inserts para as colunas da tabela 'aeroporto'*/

insert into aeroporto(codigo_aeroporto, nome_aeroporto, localizacao_aeroporto, fk_id_voo) values('VIT', 'Aeroporto de Vitória', 'Vitória - BR', 1);
insert into aeroporto(codigo_aeroporto, nome_aeroporto, localizacao_aeroporto, fk_id_voo) values('SPL', 'Aeroporto de São Paulo', 'São Paulo - BR', 2);
insert into aeroporto(codigo_aeroporto, nome_aeroporto, localizacao_aeroporto, fk_id_voo) values('LND', 'Aeroporto de Londres', 'Hong Kong - China', 3);
insert into aeroporto(codigo_aeroporto, nome_aeroporto, localizacao_aeroporto, fk_id_voo) values('TLD', 'Aeroporto da Tailândia', 'Bangkok - Tailândia', 4);
insert into aeroporto(codigo_aeroporto, nome_aeroporto, localizacao_aeroporto, fk_id_voo) values('RUN', 'Aeroporto do Reino Unido', 'Londres - Reino Unido', 5);
insert into aeroporto(codigo_aeroporto, nome_aeroporto, localizacao_aeroporto, fk_id_voo) values('PAR', 'Aeroporto de Paris', 'Paris - França', 6);
insert into aeroporto(codigo_aeroporto, nome_aeroporto, localizacao_aeroporto, fk_id_voo) values('TRT', 'Aeroporto de Toronto', 'Toronto - Canadá', 7);
insert into aeroporto(codigo_aeroporto, nome_aeroporto, localizacao_aeroporto, fk_id_voo) values('BAR', 'Aeroporto de Buenos Aires', ' Buenos Aires - Argentina', 8);
insert into aeroporto(codigo_aeroporto, nome_aeroporto, localizacao_aeroporto, fk_id_voo) values('KIE', 'Aeroporto de Kiev', 'Kiev - Ucrânia', 9);
insert into aeroporto(codigo_aeroporto, nome_aeroporto, localizacao_aeroporto, fk_id_voo) values('MCU', 'Aeroporto de Macau', ' Macau - China', 10);
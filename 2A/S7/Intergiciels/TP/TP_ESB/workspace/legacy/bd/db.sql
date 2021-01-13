drop table PUBLIC.accounts if exists;
create table accounts (
    firstname       varchar(30)      not null,
    lastname        varchar(30)      not null,
    email           varchar(30)      not null
  );
  
insert into PUBLIC.accounts(firstname, lastname, email) values ('Dan', 'Hagi', 'hagi@n7.fr');

commit;

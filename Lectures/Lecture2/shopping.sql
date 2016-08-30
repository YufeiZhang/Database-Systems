
create table Store (
	phone       text,
	address     text,
	primary key (phone)
);

create table Customer (
	custNo      integer,
	name        text,
	address     text,
	hasFavorite text,  -- may be NULL if has no favourite store
	primary key (custNo),
	foreign key (hasFavorite) references Store(phone)
);

create table Account (
	acctNo      integer,
	balance     integer,
	store       text not null,  -- not null enforces total participation
	primary key (acctNo),
	foreign key (store) references Store(phone)
);

-- can't force total participation in n:m relationships in SQL

create table CustomerHasAccount (
	customer    integer,
	account     integer,
	primary key (customer,account),
--  constraint  AllCustomers check
--		(select distinct customer from CustomerHasAccount)
--		=
--		(select distinct customerNo from Customer)
	foreign key (customer) references Customer(custNo),
	foreign key (account) references Account(acctNo)
);

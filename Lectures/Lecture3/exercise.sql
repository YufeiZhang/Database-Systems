-- This is an exercise
create table Branch(
	branchName  text,
	address     text,
	assets      text,
	primary key (branchName),
);

create table Account(
	branchName  text,
	accountNo   text,
	balance     integer,
	primary key (accountNo),
	foreign key (branchName) reference Branch(branchName)
);

create table Customer(
	name        text,
	address     text,
	customerNo  integer,
	homeBranch  text,
	primary key (customerNo),
	foreign key (homeBranch) reference Branch(branchName)
);

create table HeldBy(
	account  text,
	customer text,
	primary key (account, customer),
	foreign key (account) reference Account(accountNo),
	foreign key (customer) reference Customer(customerNo)
);

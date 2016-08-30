-- This on is better than "name text"
create domain NameValue as varchar(100) not null;
-- This domain is using for names

create table Drug (
	-- This one is not good enough
	-- name text; 
	name        NameValue,
	dno         integer,
	formular    text, -- this can be null
	primary key (dno)
);

create table Doctor (
	name        NameValue,
	tfn         integer,
	speciality  text not null,
	primary key (tfn)
);

create table Patient (
	name        NameValue,
	address     text not null,
	pid         integer,
	primary key (pid)
);

create table Prescribes(
	"date"      date    not null,
	quantity    integer not null,
	drugid      integer references Drug(dno),
	doctorid    integer references Doctor(tfn),
	patientid   integer references Patient(pid) not null,
	primary key ("date", patientid, drugid)
	-- in the primary key, you do not need doctor because you can go to diff 
	-- doctor to get the same drug as long as you get the prescribes
);
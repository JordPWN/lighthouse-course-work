CREATE TABLE contacts (
	id		serial NOT NULL PRIMARY KEY,
	name	varchar(32) NOT NULL,
	email	varchar(32) NOT NULL

	has_many :phone_numbers
);

CREATE TABLE phone_numbers (
	id 						serial NOT NULL PRIMARY KEY,
	contact_id		integer,
	my_number			integer

	belongs_to :contacts
);


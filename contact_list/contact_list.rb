#!/usr/bin/env ruby

require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList

	
	method = ARGV[0]
	argument1 = ARGV[1]
	argument2 = ARGV[2]
  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.
  def initialize

  end

  if ARGV.empty?
  	puts "Here is a list of available commands:\n"
  	puts "				new			- Create a new contact\n"
  	puts "				list			- List all contacts\n"
  	puts "				find			- Find a contact by ID\n"
  	puts "				search			- Search for a contact by terms\n"
  end

  if ARGV[0] == "new" 
  	p Contact.create(argument1, argument2)
  end
  if ARGV[0] == "list"
  	puts Contact.all
  end
  if ARGV[0] == "find"
  	puts Contact.find(argument1)
  end
  if ARGV[0] == "search"
  	puts Contact.search(argument1)
  end

end
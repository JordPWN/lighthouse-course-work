#!/usr/bin/env ruby

require_relative 'contact'
require 'active_record'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.

# Output messages from Active Record to standard out
ActiveRecord::Base.logger = Logger.new(STDOUT)

puts 'Establishing connection to database ...'
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  database: 'postgres',
  user: 'development',
  password: 'development',
  host: 'localhost',
  port: 5432,
  pool: 5,
  encoding: 'unicode',
  min_messages: 'error'
)
puts 'CONNECTED'

ActiveRecord::Base.logger = Logger.new(STDOUT)

class ContactList

	
	method = ARGV[0]
	argument1 = ARGV[1]
	argument2 = ARGV[2]
  argument3 = ARGV[3]

  method, *args = ARGV

  def initialize

  end

  if method.nil?
  	puts "Here is a list of available commands:\n"
  	puts "				new			- Create a new contact\n"
  	puts "				list			- List all contacts\n"
  	puts "				find			- Find a contact by ID\n"
  	puts "				search			- Search for a contact by terms\n"
    puts "        update      - Update a contact by ID then NAME then EMAIL\n"
  end

  if ARGV[0] == "new"
    # name, email = *args
  	p Contact.create(name: argument1, email: argument2)
  end
  if ARGV[0] == "list"
  	puts Contact.all
  end
  if ARGV[0] == "find"
  	puts Contact.find(argument1)
  end
  if ARGV[0] == "search"
  	puts Contact.where("name || email LIKE ?", "%#{argument1}%")
  end
  if ARGV[0] == "update"
    puts Contact.find(argument1).update(name: argument2, email: argument3)
  end

end
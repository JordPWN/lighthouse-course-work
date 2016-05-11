require 'csv'
require 'pg'

class Contact

  attr_reader :id
  attr_accessor :name, :email

  @@conn = PG.connect({
    host: 'localhost',
    dbname: 'postgres',
    user: 'development',
    password: 'development'
  })
  
  def initialize(id, name, email)
    @name = name
    @email = email
    @id = id
  end

  def saved?
   !id.nil?
  end

  def save(id=nil, name, email)
    flag = 0
    if saved?
       @@conn.exec_params('UPDATE contacts WHERE name = $1 AND email = $2;', [name, email])
    else
      # Do insert query, with RETURNING id; at the end of it.
      # Set id on instance
      @@conn.exec_params('INSERT INTO contacts (name, email) VALUES ($1, $2) RETURNING id;', [name,email])
      flag = 1
    end
     # Return boolean of whether insert/update worked
     flag
  end

  #Redefine default to_s method for Contact.class to prettify it
  def to_s
    "ID: #{self.id} Name: #{self.name} Email: #{self.email}"
  end

  #CLASS FUNCTIONS
  class << self

    #Returns an array containing all contacts
  def all
    results = []

    @@conn.exec("SELECT * FROM contacts;") do |contacts|
      contacts.each do |contact|
        results << create_from_row(contact)
      end
    end
    results
  end

  def create_from_row(contact)
    Contact.new(contact["id"],contact["name"], contact["email"])
  end

    #Creates new contacts
    def create(name, email)
      if !@@conn.exec_params("SELECT email FROM contacts WHERE email = $1", [email])
          return "This email address already exists!"
      end
      # new_contact = "\n" + [Contact.all.size+1, name, email].join(",")
      if contact.save(name, email)#save
        "New entry inserted."
      else
        "Entry updated."
      end
    end

    def update(id, new_name, new_email)
      update_contact = Contact.find(id)
      update_contact.name = new_name
      update_contact.email = new_email
      update_contact.save(update_contact.id, update_contact.name, update_contact.email)
    end
    
    #Find contact by ID
    def find(id)
      @@conn.exec_params("SELECT * FROM contacts WHERE id=$1;", [id]) do |results|
      return create_from_row(results[0])
      end    
    end

    #Search through name & email by name or email address
    def search(term)#select
      my_array = @@conn.exec_params("SELECT * FROM contacts WHERE name LIKE $1 OR email LIKE $1;", [term])
    end

  end#End of class functions

end
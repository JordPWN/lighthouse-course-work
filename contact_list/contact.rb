require 'csv'

class Contact

  @@all = []

  attr_reader :id
  attr_accessor :name, :email
  
  def initialize(id, name, email)
    @name = name
    @email = email
    @id = id
  end

  #Redefine default to_s method for Contact.class to prettify it
  def to_s
    "ID:#{self.id} Name: #{self.name} Email: #{self.email}"
  end

  #CLASS FUNCTIONS
  class << self

    #Returns an array containing all contacts
    def all
      CSV.foreach("contacts.csv") do |row|
        @@all << Contact.new(row[0],row[1],row[2])#.new
      end
      @@all
    end

    #Creates new contacts
    def create(name, email)
      new_contact = "\n" + [Contact.all.size+1, name, email].join(",")
      File.open("contacts.csv", "a"){|append| append.write(new_contact)}
      new_contact
    end
    
    #Find contact by ID
    def find(id)
      Contact.all.detect do |contact|
        id == contact.id
      end
    end

    #Search through name & email by name or email address
    def search(term)
      read_file = self.all
      hits = []
      read_file.each do |contact|
        if contact.name.include?(term) || contact.email.include?(term)
          hits << contact
        end
      end
      return hits
    end

  end#End of class functions

end
require "active_record"

class Contact < ActiveRecord::Base

  def to_s
    "ID: #{self.id} Name: #{self.name} Email: #{self.email}"
  end

end
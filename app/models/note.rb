class Note < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :client

end

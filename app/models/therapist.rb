class Therapist < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :therapies
  has_many :therapist_clients
  has_many :clients, :through => :therapist_clients
end

class Dossier < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :dossier_itemsItem
  belongs_to :client
end

class Dossier < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :DossierItem
  belongs_to :Client
end

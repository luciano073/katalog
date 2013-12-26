class ProductionTeam < ActiveRecord::Base
  self.table_name = "production_team"
  belongs_to :film
  belongs_to :artist
end

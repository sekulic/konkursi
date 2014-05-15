class Valuta < ActiveRecord::Base
  has_many :konkursi, :foreign_key => "valuta_id" 
end

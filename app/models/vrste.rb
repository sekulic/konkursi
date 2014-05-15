class Vrste < ActiveRecord::Base
 has_many :konkursi, :foreign_key => "vrsta_id"  
end

class Sektori < ActiveRecord::Base
  has_and_belongs_to_many :konkursi
  has_many :sektori_konkursi, :dependent => :destroy
  has_many :konkursi, :through => :sektori_konkursi  
end

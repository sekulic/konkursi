class Aplikant < ActiveRecord::Base
  has_and_belongs_to_many :konkursi
  has_many :aplikant_konkursi, :dependent => :destroy
  has_many :konkursi, :through => :aplikant_konkursi  
  validates :name, presence: true  
end

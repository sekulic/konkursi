class Pit < ActiveRecord::Base
  validates :name, presence: true
  
  belongs_to :user, :class_name => User 
  has_many :komentars, :foreign_key => "pit_id"   
end

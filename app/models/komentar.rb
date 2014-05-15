class Komentar < ActiveRecord::Base
  belongs_to :user, :class_name => User
  belongs_to :pit, :class_name => Pit  
end

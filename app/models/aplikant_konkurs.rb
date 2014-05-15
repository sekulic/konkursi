class AplikantKonkurs < ActiveRecord::Base
  belongs_to :konkurs
  belongs_to :aplikant
  validates :aplikant_id, :presence => true
  validates :konkurs_id, :presence => true
end
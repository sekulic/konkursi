class SektoriKonkurs < ActiveRecord::Base
  belongs_to :konkurs
  belongs_to :sektori
  validates :sektori_id, :presence => true
  validates :konkurs_id, :presence => true
end

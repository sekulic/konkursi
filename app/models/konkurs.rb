class Konkurs < ActiveRecord::Base
  belongs_to :valuta, :class_name => Valuta
  belongs_to :vrsta, :class_name => Vrste
  belongs_to :status, :class_name => Status 
  belongs_to :raspisivac, :class_name => Raspisivac      
  has_many :sektori_konkursi, :dependent => :destroy
  has_many :sektoris, :through => :sektori_konkursi
  accepts_nested_attributes_for :sektoris
  has_many :aplikant_konkursi, :dependent => :destroy
  has_many :aplikants, :through => :aplikant_konkursi
  accepts_nested_attributes_for :aplikants
  has_attached_file :dokument,
                    :path => "/dokumenti/:id/dokument:id.:extension",
                    :url => ":s3_domain_url"
# Validate content type
  validates_attachment_content_type :dokument, :content_type => /\Aapplication/
# Validate filename
  validates_attachment_file_name :dokument, :matches => [/zip\Z/, /rar\Z/]
  validates :ime, presence: true, length: { minimum: 5 }
  validates :iznos, presence: true, format: { without: /\s/ }, numericality: true
  validates :opis, presence: true
end

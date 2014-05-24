class Raspisivac < ActiveRecord::Base
      has_many :konkursi, :foreign_key => "raspisivac_id" 
      has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png",
      :path => "/raspisivac/:id/:style.:extension",
      :url => ":s3_domain_url"
      validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

      validates :name, presence: true
      validates :avatar, presence: true
end

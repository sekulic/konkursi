require 'spec_helper'

describe Raspisivac do
 it "has a valid factory" do
    FactoryGirl.build(:raspisivac).should be_valid 
    end  
 it { should have_attached_file(:avatar) }

 it { should validate_attachment_content_type(:avatar).
                allowing('image/png', 'image/gif', 'image/jpg').
                rejecting('text/plain', 'text/xml' , 'application/pdf') }
                 
 it "is invalid without a firstname" do
   FactoryGirl.build(:raspisivac, name: nil).should_not be_valid
 end
end

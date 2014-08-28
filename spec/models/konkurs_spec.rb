require 'spec_helper'

describe Konkurs do
 it "has a valid factory" do
    FactoryGirl.build(:konkurs).should be_valid
 end 
 it { should have_attached_file(:dokument) }

 it { should validate_attachment_content_type(:dokument).
                allowing('application/rar', 'application/zip').
                rejecting('text/plain', 'text/xml' ) }
                 
 it "is invalid without a name" do
   FactoryGirl.build(:konkurs, ime: nil).should_not be_valid
 end  
 it "is invalid without a description" do
   FactoryGirl.build(:konkurs, opis: nil).should_not be_valid
 end
 it "is invalid without a value" do
   FactoryGirl.build(:konkurs, iznos: nil).should_not be_valid
 end
 it { should belong_to(:valuta) } 
 it { should ensure_length_of(:ime).is_at_least(5) }  
 it { should validate_numericality_of(:iznos) } 
end

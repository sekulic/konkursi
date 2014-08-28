require 'spec_helper'

describe User do
 it "has a valid factory" do
    FactoryGirl.build(:user).should be_valid 
 end 
 
 it "is invalid without a username" do
   FactoryGirl.build(:user, username: nil).should_not be_valid 
 end 
 it "is invalid without a password" do
   FactoryGirl.build(:user, password: nil).should_not be_valid 
 end 
 it { should ensure_length_of(:password).is_at_least(8) }     
end

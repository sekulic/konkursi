require 'spec_helper'

describe Aplikant do
 it "has a valid factory" do
    FactoryGirl.build(:aplikant).should be_valid 
 end 
 
 it "is invalid without a name" do
   FactoryGirl.build(:aplikant, name: nil).should_not be_valid
 end 
end

require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "Forum with JavaScript", :js => true do  
  it "Should have right legend on forum" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user) 
    visit forum_path
    expect(page).to have_selector("legend", text: "Diskusije")  
  end  
  it "Should have right content when user isn't loged in" do
    visit forum_path
    expect(page).to have_selector("h2", text: "Morate biti ulogovani da bi ste učestvovali u diskusijama.")  
  end  
end

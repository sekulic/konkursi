require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!
describe "StaticPages", :type => :feature do
  let(:base_title) { "Projekti.rs" }
  subject { page }
  shared_examples_for "All static pages" do
    it {should have_title(full_title(page_title))}  
  end
  describe "Home page" do
  before {visit root_path}
    let(:page_title) { "Početna" }
    it_should_behave_like "All static pages"   
  end     
  it "Should have right links on layout" do
    visit root_path
    click_link("Kontakt", match: :first)
    expect(page).to have_selector("h1", text: "Kontakt")
    click_link("Registrujte se", match: :first)
    expect(page).to have_selector("legend", text: "Registrujte se")
  end        
  it "Should have right links on layout as user" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit root_path
    click_link("Moj nalog", match: :first)
    expect(page).to have_selector("legend", text: "Moj nalog")  
  end 
  it "Should have right links on layout as admin" do
    admin = FactoryGirl.create(:user, admin: true)
    login_as(admin, :scope => :user)
    visit root_path
    click_link("Administracija", match: :first)
    expect(page).to have_selector("a", text: "korisnici")  
  end 
end 
 
require 'spec_helper'

describe "StaticPages" do
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
    click_link "Kontakt"
    expect(page).to have_selector("h1", text: "Kontakt")
    click_link "Registrujte se"
    expect(page).to have_selector("legend", text: "Registrujte se")
  end
end

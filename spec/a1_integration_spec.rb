require 'capybara/rspec'
require './app'
require 'spec_helper'

Capybara.app = Sinatra::Application
set(:show_exceptions,false)

describe('viewing and adding stylists', {:type => :feature}) do
  it('processes user input to add a stylist to the stylist list') do
    visit('/stylists/new')
    fill_in('name', :with => "Tiberius")
    click_button('submit')
    expect(page).to have_content("Tiberius")
  end
end

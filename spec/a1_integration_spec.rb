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

describe('viewing and adding clients', {:type => :feature}) do
  it('processes user input to add a client to the client list') do
    visit('/clients/new')
    fill_in('name', :with => "Khan")
    click_button('submit')
    expect(page).to have_content("Khan")
  end
end

describe('adding a client to a stylist', {:type => :feature}) do
  it('shows a stylits details with a list of clients. On selecting a client and clicking submit, display added client on updated stylist list.') do
    test_stylist = Stylist.new({:name => "Tiberius", :id => nil})
    test_stylist.save
    test_client = Client.new({:name => "Khan", :id => nil, :stylist_id => nil})
    test_client.save
    visit("/stylists/#{test_stylist.id}")
    select test_client.name, from: "clients"
    click_button('submit')
    expect(page).to have_content(test_client.name)
  end
end

describe('deleting a client', {:type => :feature}) do
  it('shows a client detail page. On clicking delete button, shows a delete confirmation page.') do
    test_client = Client.new({:name => "Khan", :id => nil, :stylist_id => nil})
    test_client.save
    visit("/clients/#{test_client.id}")
    click_button("delete")
    expect(page).to have_content("Deleted.")
  end
end

describe('deleting a stylist', {:type => :feature}) do
  it('shows a stylist detail page. On clicking delete button, shows a delete confirmation page.') do
    test_stylist = Stylist.new({:name => "Tiberius", :id => nil})
    test_stylist.save
    visit("/stylists/#{test_stylist.id}")
    click_button("delete")
    expect(page).to have_content("Deleted.")
  end
end

require 'rails_helper'

feature 'Welcome' do
  scenario 'displays friendly hello message' do
    visit '/'
    expect(page).to have_content('hey, there!')
  end
end

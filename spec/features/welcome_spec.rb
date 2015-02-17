require 'rails_helper'

feature 'Welcome' do
  scenario 'displays support email' do
    visit '/'
    expect(page).to have_content('bjoernalbers@gmail.com')
  end
end

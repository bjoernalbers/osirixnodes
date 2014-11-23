require 'rails_helper'

feature 'Welcome' do
  scenario 'displays support email' do
    visit '/'
    expect(page).to have_content('support@osirixnodes.com')
  end
end

# As a user
# I want to see my api key after login
# In order to use it right away

include Warden::Test::Helpers
Warden.test_mode!

feature 'View API key' do
  scenario 'on root page' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit '/'

    url = "https://www.example.com/plist/#{user.api_key}"
    expect(page).to have_selector("input[value='#{url}']")
  end
end

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
    #TODO: Test with right URL (incl. https)!
    expect(page).to have_content("http://www.example.com/plist/#{user.api_key}")
  end
end

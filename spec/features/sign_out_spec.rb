include Warden::Test::Helpers
Warden.test_mode!

feature 'Sign out' do
  #let(:email) { 'steve@jobs.com' }
  #let(:password) { '&Minted14Jodi' }

  scenario 'with valid credentials' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit '/'
    click_link 'Log out'

    expect(page).to have_content(/signed out successfully/i)
    expect(current_path).to eq '/'
  end
end

# All users have to sign up
# Because the business owner needs the email address

feature 'Sign up' do
  let(:email) { 'steve@jobs.com' }
  let(:password) { '&Minted14Jodi' }

  scenario 'happy path' do
    #user = FactoryGirl.create(:user, email: email, password: password)

    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Sign up'

    expect(page).to have_content(/signed up successfully/i)

    # Should be on the own nodes page
    expect(current_path).to eq '/nodes'
  end
end

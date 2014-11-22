# All users have to sign up
# Because the business owner needs the email address

feature 'Sign up' do
  let(:email) { 'steve@jobs.com' }
  let(:password) { '&Minted14Jodi' }

  scenario 'with valid attributes' do
    visit '/'

    click_link 'Sign up'
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    click_button 'Sign up'

    expect(page).to have_content(/confirmation/i)
    expect(current_path).to eq '/'
  end
end

# All users have to sign up
# Because the business owner needs the email address

feature 'Sign Up' do
  let(:email) { 'steve@jobs.com' }
  let(:password) { '&Minted14Jodi' }

  scenario 'happy path' do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Sign up'

    expect(page).to have_content(/confirmation/i)

    expect(current_path).to eq '/'
  end
end

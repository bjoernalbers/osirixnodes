# All users have to sign up
# Because the business owner needs the email address

feature 'limited Sign up' do
  scenario 'no signed up user' do
    visit '/'
    expect(page.body).to have_link('Sign up for FREE', href: new_user_registration_url)
    expect(page.body).to have_link('sign up for free', href: new_user_registration_url)
    expect(page).to have_content('100 BETA seats left')
  end

  scenario '1 signed up user' do
    create(:user)
    visit '/'
    expect(page.body).to have_link('Sign up for FREE', href: new_user_registration_url)
    expect(page.body).to have_link('sign up for free', href: new_user_registration_url)
    expect(page).to have_content('99 BETA seats left')
  end

  scenario 'without free BETA seats available' do
    100.times { create(:user) }
    visit '/'
    expect(page.body).to_not have_link('Sign up for FREE', href: new_user_registration_url)
    expect(page.body).to_not have_link('sign up for free', href: new_user_registration_url)
    expect(page).to have_content('No BETA seats left')
  end
end

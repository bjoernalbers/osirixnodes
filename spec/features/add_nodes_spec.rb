include Warden::Test::Helpers
Warden.test_mode!

feature 'Add Nodes' do
  scenario 'with valid attributes' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    expect(user.nodes).to be_empty

    visit '/'
    
    click_link 'Add Node'
    fill_in 'Name', with: 'My first node'
    fill_in 'Address', with: '1.2.3.4'
    fill_in 'Port', with: 5678
    fill_in 'Aetitle', with: 'MYFIRSTNODE'
    click_button 'Create Node'

    user.reload
    expect(user.nodes).to_not be_empty
    expect(page).to have_content('My first node')
    
    # check that we're on the nodes page
  end

  scenario 'with invalid attributes' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    expect(user.nodes).to be_empty

    visit '/'
    
    click_link 'Add Node'
    fill_in 'Name', with: 'My first node'
    fill_in 'Address', with: '1.2.3.4'
    fill_in 'Port', with: 5678
    fill_in 'Aetitle', with: '' # Missing AETitle
    click_button 'Create Node'

    user.reload
    expect(user.nodes).to be_empty
    expect(page).to have_content(/aetitle/i)
    
    # check that we're on the nodes page
  end
end

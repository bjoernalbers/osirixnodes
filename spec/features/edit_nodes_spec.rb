include Warden::Test::Helpers
Warden.test_mode!

feature 'Edit Nodes' do
  scenario 'with valid attributes' do
    user = FactoryGirl.create(:user)
    node = FactoryGirl.create(:node, user: user, name: 'Chunky')
    login_as(user, :scope => :user)

    visit '/'

    expect(page).to have_content('Chunky')
    
    click_link 'Edit'
    fill_in 'Name', with: 'Bacon'
    click_button 'Update Node'

    node.reload
    expect(node.name).to eq('Bacon')
    expect(page).to have_content('Bacon')
    expect(page).to_not have_content('Chunky')
    
    # check that we're on the nodes page
  end
end

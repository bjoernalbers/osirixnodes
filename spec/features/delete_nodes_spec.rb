include Warden::Test::Helpers
Warden.test_mode!

feature 'Delete Nodes' do
  scenario 'happy path' do
    user = FactoryGirl.create(:user)
    node = FactoryGirl.create(:node, user: user)
    login_as(user, :scope => :user)
    expect(user.nodes).to_not be_empty

    visit '/'
    
    click_link 'Delete'

    expect(page).to_not have_content(node.name)
    user.reload
    expect(user.nodes).to be_empty
    
    # check that we're on the nodes page
  end
end

# As a user
# I want to be able to see all my nodes in one place
# Because this service is all about MY nodes

include Warden::Test::Helpers
Warden.test_mode!

feature 'View Nodes' do
  scenario 'single node' do
    user = FactoryGirl.create(:user)
    other = FactoryGirl.create(:user)

    login_as(user, :scope => :user)

    node = FactoryGirl.create(:node, user: user)
    other_node = FactoryGirl.create(:node, user: other)
    # given i am signed in / logged in / whatever
    visit '/nodes'
    expect(page).to have_content(node.name)
    expect(page).to_not have_content(other_node.name)
  end
end

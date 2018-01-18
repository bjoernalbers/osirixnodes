feature 'Edit Nodes' do
  scenario 'with valid attributes' do
    node = FactoryGirl.create(:node, name: 'Chunky')

    visit '/'

    expect(page).to have_content('Chunky')
    
    click_link 'Edit'
    fill_in 'Name', with: 'Bacon'
    uncheck 'Q&R'
    click_button 'Update Node'

    node.reload
    expect(node.name).to eq('Bacon')
    expect(node.qr).to eq false
    
    # check that we're on the nodes page
  end
end

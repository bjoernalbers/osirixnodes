feature 'Delete Nodes' do
  scenario 'happy path' do
    node = create(:node)
    expect(Node.count).not_to eq 0

    visit '/'
    
    click_link 'Delete'

    expect(page).not_to have_content(node.name)
    expect(Node.count).to eq 0
    
    # check that we're on the nodes page
  end
end

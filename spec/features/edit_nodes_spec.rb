feature 'Edit Nodes' do
  scenario 'with valid attributes' do
    node = FactoryGirl.create(:node, name: 'Chunky')

    visit '/'

    expect(page).to have_content('Chunky')
    
    click_link 'Edit'
    fill_in 'Name', with: 'Bacon'
    uncheck 'Q&R'
    fill_in 'WADO-Port', with: '8088'
    click_button 'Update Node'

    node.reload
    expect(node.name).to eq('Bacon')
    expect(node.wado_port).to eq 8088
    expect(node.qr).to eq false
    
    # check that we're on the nodes page
  end
end

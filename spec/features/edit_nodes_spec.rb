feature 'Edit Nodes' do
  scenario 'with valid attributes' do
    node = FactoryGirl.create(:node, name: 'Chunky')

    visit '/'

    expect(page).to have_content('Chunky')
    
    click_link 'Edit'
    fill_in 'Name', with: 'Bacon'
    uncheck 'Q&R'
    fill_in 'WADO-Port', with: '8088'
    check 'WADO-HTTPS'
    fill_in 'WADO-Path', with: 'hello'
    select 'JPEG LS Lossless', from: 'WADO-Transfer Syntax'
    click_button 'Update Node'

    node.reload
    expect(node.name).to eq('Bacon')
    expect(node.wado_port).to eq 8088
    expect(node.wado_https).to eq true
    expect(node.wado_transfer_syntax).to eq 13
    expect(node.wado_url).to eq 'hello'
    expect(node.qr).to eq false
    
    # check that we're on the nodes page
  end
end

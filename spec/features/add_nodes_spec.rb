feature 'Add Nodes' do
  scenario 'with valid attributes' do
    expect(Node.count).to eq 0

    visit '/'
    
    click_link 'Add Node'
    fill_in 'Name', with: 'My first node'
    fill_in 'Address', with: '1.2.3.4'
    fill_in 'Port', with: 5678
    fill_in 'Aetitle', with: 'MYFIRSTNODE'
    click_button 'Create Node'

    expect(Node.count).not_to eq 0
    expect(page).to have_content('My first node')
    
    # check that we're on the nodes page
  end

  scenario 'with invalid attributes' do
    expect(Node.count).to eq 0

    visit '/'
    
    click_link 'Add Node'
    fill_in 'Name', with: 'My first node'
    fill_in 'Address', with: '1.2.3.4'
    fill_in 'Port', with: 5678
    fill_in 'Aetitle', with: '' # Missing AETitle
    click_button 'Create Node'

    expect(Node.count).to eq 0
    expect(page).to have_content(/aetitle/i)
    
    # check that we're on the nodes page
  end

  # 'Explicit Little Endian'           => 0,
  # 'Implicit Little Endian'           => 9,
  # 'JPEG 2000 Lossless'               => 1,
  # 'JPEG 2000 Lossy - High Quality'   => 2,
  # 'JPEG 2000 Lossy - Medium Quality' => 3,
  # 'JPEG 2000 Lossy - Low Quality'    => 4,
  # 'JPEG LS Lossless'                 => 13,
  # 'JPEG LS Lossy - High Quality'     => 15,
  # 'JPEG LS Lossy - Medium Quality'   => 16,
  # 'JPEG LS Lossy - Low Quality'      => 14,
  # 'JPEG Lossless'                    => 5

  scenario 'with default attributes' do
    visit '/'

    click_link 'Add Node'
    fill_in 'Name', with: 'My first node'
    fill_in 'Address', with: '1.2.3.4'
    fill_in 'Port', with: 5678
    fill_in 'Aetitle', with: 'MYFIRSTNODE'
    click_button 'Create Node'

    expect(page).to have_content('Explicit Little Endian')
    expect(page).to have_content('C-MOVE')
  end

  scenario 'with non-default attributes' do
    visit '/'

    click_link 'Add Node'
    fill_in 'Name', with: 'My first node'
    fill_in 'Address', with: '1.2.3.4'
    fill_in 'Port', with: 5678
    fill_in 'Aetitle', with: 'MYFIRSTNODE'
    #select('JPEG 2000 Lossless', from: 'Transfer Syntax')
    select('JPEG 2000 Lossless', from: 'node[transfer_syntax]')
    select('C-GET', from: 'node[retrieve_mode]')
    click_button 'Create Node'

    expect(page).to have_content('JPEG 2000 Lossless')
    expect(page).to have_content('C-GET')
  end
end

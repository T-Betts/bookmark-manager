
feature 'Delete Link' do
  scenario 'deleting a link should remove it from the homepage' do
    link = Link.create(url: 'http://testexample.com', title: 'Test Link')
    visit('/')

    within "#link-#{link.id}" do
      click_button 'Delete'
    end

    expect(current_path).to eq '/'
    expect(page).not_to have_content('Test Link')
  end
end

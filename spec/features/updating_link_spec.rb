feature 'Updating a link' do
  scenario 'user can update link' do
    link = Link.create(url: 'http://testexample.com', title: 'Test Link')
    visit("/update-link/#{link.id}")

    fill_in('url', with: 'http://www.snakersacademy.com')
    fill_in('title', with: 'Snakers Academy')
    click_button('Update')

    expect(current_path).to eq '/'
    expect(page).not_to have_content 'Test Link'
    expect(page).to have_content 'Snakers Academy'
  end
end
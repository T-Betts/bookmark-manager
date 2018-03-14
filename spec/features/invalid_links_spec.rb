feature 'Valid link check' do
  scenario 'raises error for invalid link' do
    visit('/')
    fill_in 'url', with: 'hello world'
    click_button 'Submit'
    expect(page).to have_content("Error: Invalid URL. Please try again.")
  end
end

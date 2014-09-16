describe "adding drugs" do
  it "allows user to create a new drug if all information is entered" do
    user = User.create(name: 'nacho', password: 'testpassword')
    visit '/login'
    fill_in 'Name', with: 'nacho'
    fill_in 'Password', with: 'testpassword'
    click_button 'Log In'
    visit '/drugs'
    find(:xpath, "//a[contains(@href,'/drugs/new')]").click
    fill_in 'Name', with: 'Norco'
    fill_in 'Description', with: 'Hydrocodone Generic for pain'
    # cost = find(:xpath, "//a[contains(@id, 'cost_not_in_dh')]")
    # cost.fill_in
    fill_in 'Cost_not_in_dh', with: '10'
    fill_in 'Cost_in_dh', with: '30'
    fill_in 'Bill_to_dh', with: '20'
    click_button 'Create Drug'
    expect(page).to have_content 'Norco created successfully'
  end
end

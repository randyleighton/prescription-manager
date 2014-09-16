require 'rails_helper'

describe "drug authentication" do
  it "will not allow user to access drug page without being logged in" do
    visit '/'
    find(:xpath, "//a[contains(@href,'/drugs')]").click
    expect(page).to have_content 'Log In'
  end
end
  # it "will allow a user to access drug page if logged in" do
  #   user = User.create(name: 'nacho', password: 'testpassword')

  # end

# describe "adding drugs" do
#   it "allows user to create a new drug if all information is entered" do

#   end
#   it "will not allow a user to create a new drug if missing information" do

#   end
# end

# describe "individual drugs" do
#   it "views the information for a specific drug when a user clicks on it" do

#   end
#   it "deletes a drug when a user chooses to destroy it" do

#   end
# end

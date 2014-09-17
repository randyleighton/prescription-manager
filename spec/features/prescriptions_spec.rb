require 'rails_helper'

describe "prescription authentication" do
  it "will not allow user to access prescription page without being logged in" do
    visit '/'
    find('img#prescrip-main').click
    expect(page).to have_content 'Log In'
  end

end

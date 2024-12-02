require 'rails_helper'

RSpec.describe "Minimal app", type: :system do

  it "opens in a web browser" do

    # visit rails_health_check which opens a blank green page
    visit "up"

    expect(page.find("body")[:style]).to eq("background-color: green")
  end

end

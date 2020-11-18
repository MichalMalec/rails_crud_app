require "spec_helper"

describe "CreateCategory", type: :request do
  let(:category1) { create(:category) }
  let(:category2) { create(:category, name: "Travel") }
  
  it "should show categories listing" do
    get "/categories"
    assert_match "Sports", response.body
    assert_match "Travel", response.body
  end
end

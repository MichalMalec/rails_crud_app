require "spec_helper"

describe "CreateCategory", type: :request do
  it "get new category form and create category" do
    get "/categories/new"
    expect(response.status).to eq 200

    expect {
      post categories_path, params: { category: { name: "Travel" } }
      response.should redirect_to category_path(Category.last)
    }.to change(Category, :count).by(1)
    follow_redirect!
    expect(response.status).to eq 200
    assert_match "Travel", response.body
  end
end

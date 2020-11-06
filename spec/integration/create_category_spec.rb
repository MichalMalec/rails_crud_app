require "spec_helper"

describe "CreateCategory", type: :request do
  it "get new category form and create category" do
    get "/categories/new"
    expect(response.status).to eq 200

    expect {
      post categories_path, params: { category: { name: "Travel" } }
      expect(response.status).to eq 302
    }.to change(Category, :count).by(1)
    follow_redirect!
    expect(response.status).to eq 200
    assert_match "Travel", response.body
  end

  context "form validations" do
    it "rejects invalid category if name is empty" do
      get "/categories/new"
      expect(response.status).to eq 200

      expect {
        post categories_path, params: { category: { name: " " } }
      }.not_to change(Category, :count)
      assert_match "errors", response.body
      assert_select "div.alert"
      assert_select "h4.alert-heading"
    end
  end
end

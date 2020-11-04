require "spec_helper"

describe CategoriesController, type: :request do
  let(:category) { create(:category) }

  context "index categories" do
    it "returns: 200 with listed categories" do
      get categories_path

      expect(response.status).to eq 200
    end
  end

  context "get category" do
    it "returns: 200 with listed category" do
      get category_path(category.id)

      expect(response.status).to eq 200
    end
  end

  context "new category" do
    it "returns: 200 with get new category" do
      get new_category_path

      expect(response.status).to eq 200
    end
  end

  context "create category" do
    it "returns: 201 with new created category" do
      expect {
        post categories_path, params: { category: { name: "Travel" } }
      }.to change(Category, :count).by(1)
    end
  end
end


require "spec_helper"

describe CategoriesController, type: :request do
  let(:category) { create(:category) }
  let(:admin_user_1) { create(:user, username: "johndoe", email: "johndoe@o2.pl",
                            password: "password123", admin: true )}
  let(:admin_user_2) { create(:user, username: "johnnydoe", email: "johnnydoe@o2.pl",
                          password: "password123", admin: true )}

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
      sign_in_as(admin_user_1)
      get new_category_path

      expect(response.status).to eq 200
    end
  end

  context "create category" do
    it "returns: 201 with new created category" do
      sign_in_as(admin_user_2)
      expect {
        post categories_path, params: { category: { name: "Travel" } }
      }.to change(Category, :count).by(1)

      response.should redirect_to category_path(Category.last)
    end

    it "should NOT create a category if user is NOT an admin" do
      expect {
        post categories_path, params: { category: { name: "Travel" } }
      }.not_to change(Category, :count)

      response.should redirect_to categories_path
    end
  end
end


require "spec_helper"

describe Category do
  let(:category_name) { "Sports" }
  let(:category) { Category.new(name: category_name) }

  it 'should be valid' do
    expect(category).to be_valid
  end

  context 'should have name' do
    let(:category_name) { "" }

    it 'that is NOT empty' do
      expect(category).not_to be_valid
    end
  end

  context 'should have name' do
    let(:category_2) { Category.new(name: category_name) }

    it 'that is unique' do
      category.save

      expect(category_2).not_to be_valid
      category.delete
    end
  end

  it 'should not have too long name' do
    category.name = "a" * 16

    expect(category).not_to be_valid
  end

  it 'should not have too short name' do
    category.name = "aa"

    expect(category).not_to be_valid
  end
end

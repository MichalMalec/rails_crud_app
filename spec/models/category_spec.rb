require "spec_helper"

describe Category do
  let(:category) { Category.new(name: "Sports") }

  it 'category should be valid' do
    expect(category).should be_valid
  end
end

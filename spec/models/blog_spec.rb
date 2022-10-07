require 'rails_helper'

describe Blog, type: :model do
  context '作成できる場合' do
    specify "titleがあれば有効な状態であること" do
      blog = Blog.new(title: "title")
      expect(blog).to be_valid
    end
  end

  context '作成できない場合' do
    specify "titleがなければ無効な状態であること" do
      blog = Blog.new(title: "")
      expect(blog).to be_invalid
    end
  end
end
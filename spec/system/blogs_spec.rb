require 'rails_helper'

RSpec.describe 'Blog管理', type: :system do
  let!(:user) { create(:user) }

  before do
    login_as(user)
  end

  specify 'Blogの新規作成時にtitleを入力しなかった場合にエラーが表示されること' do
    visit new_blog_path
    expect(page).to have_current_path new_blog_path

    expect {
      click_on "Create Blog"
    }.to_not change(Blog, :count)

    expect(page).to have_content "タイトルを入力してください"
  end

  specify 'Blogの新規作成時にtitleを入力した場合はデータが保存され閲覧画面に遷移すること' do
    visit new_blog_path
    fill_in 'blog[title]', with: 'title'
    expect {
      click_button 'Create Blog'
      sleep 3
    }.to change(Blog, :count).by(1)
    expect(page).to have_current_path blogs_path
    expect(page).to have_content 'blog was successfully created.'
  end
end
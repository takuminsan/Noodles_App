require 'rails_helper'

describe 'コメント機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, user: @user)
  end

  it 'コメント機能が動作すること' do
    log_in_as(@user)
    visit post_path(@post.id)
    fill_in 'comment_content', with: '美味しそうだね'
    click_button 'コメントする'
    expect(page).to have_content '美味しそうだね'
  end
end

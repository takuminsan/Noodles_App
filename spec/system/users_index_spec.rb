require 'rails_helper'

describe '利用者一覧', type: :system do
  before do
    @admin = FactoryBot.create(:user, name: "admin", email: "admin@example.com")
    @non_admin = FactoryBot.create(:user, name: "non_admin",
                                          email: "non_admin@example.com",
                                          admin: false)
  end

  it '管理者権限のあるユーザーはユーザーを削除できること' do
    log_in_as(@admin)
    visit users_path
    expect {
      click_on '削除'
      page.accept_confirm "本当に削除しますか？" # ブラウザのダイアログ表示内容の確認と、自動でOKを押してくれる
      expect(page).to have_content "アカウントが削除されました。" # この行を入れてあげないとダイアログのOKが実行される前にユーザー数を評価してしまう
    }.to change { User.count }.by(-1)
  end

  it '管理者権限のないユーザーにはユーザー削除リンクが表示されないこと' do
    log_in_as(@non_admin)
    visit users_path
    expect(page).not_to have_content "削除"
  end
end

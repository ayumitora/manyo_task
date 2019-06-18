require 'rails_helper'

RSpec.feature "ユーザー機能", type: :feature do

  background do
    FactoryBot.create(:user)
    # user_b_admin = FactoryBot.create(:admin_user)
  end

  scenario "ログインテスト" do

    visit login_path
    fill_in 'session[email]', with: 'test@example.com'
    fill_in 'session[password]', with: 'password'
    click_button I18n.t('login')
    save_and_open_page
    expect(page).to have_content 'テストユーザー'
  end
end
require 'rails_helper'

RSpec.feature "ユーザー機能", type: :feature do

  background do
    @user_a = FactoryBot.create(:user)
    @user_b_admin = FactoryBot.create(:admin_user)

    #user_b_adminのタスク
    FactoryBot.create(:task4, id: 8, status: "着手中", user: @user_b_admin)
    FactoryBot.create(:task5, id: 9, user: @user_b_admin)
    FactoryBot.create(:task6, id: 10, user: @user_b_admin)
  end

  scenario "ログインテスト" do
    visit login_path
    fill_in 'session[email]', with: 'test@example.com'
    fill_in 'session[password]', with: 'password'
    click_button I18n.t('login')
    expect(page).to have_content 'テストユーザー'
  end

  scenario "ログアウトテスト" do
    visit login_path
    fill_in 'session[email]', with: 'test@example.com'
    fill_in 'session[password]', with: 'password'
    click_button I18n.t('login')
    expect(page).to have_content 'テストユーザー'
    click_link I18n.t('logout')
    expect(page).to have_content I18n.t('sigin_up')
  end

  scenario "ログインしていない場合タスク一覧へは行けずログインページへ遷移" do
    visit tasks_path
    expect(page).to have_content I18n.t('sigin_up')
    expect(page).to have_content I18n.t('email')
    expect(page).to have_content I18n.t('password')
  end

  scenario "自分が作成したタスクだけを表示" do
    #user_b_adminでログイン
    visit login_path
    fill_in I18n.t('email'), with: 'admin_test@example.com'
    fill_in I18n.t('password'), with: 'password'
    click_button I18n.t('login')
    visit tasks_path
    expect(page).to have_content '管理テストユーザー'
    expect(page).to have_content 'Factoryデフォルトのタイトル４'
    expect(page).not_to have_content 'Factoryデフォルトのタイトル３'
  end

  scenario "ユーザー詳細のテスト(ユーザが作成したタスクの一覧を詳細画面で見られる)" do
    #user_b_adminでログイン
    visit login_path
    fill_in I18n.t('email'), with: 'admin_test@example.com'
    fill_in I18n.t('password'), with: 'password'
    click_button I18n.t('login')
    click_link '管理テストユーザー'
    expect(page).to have_content 'Factoryデフォルトのタイトル４'
    expect(page).to have_content 'Factoryデフォルトのタイトル５'
    expect(page).to have_content 'Factoryデフォルトのタイトル６'
    expect(page).not_to have_content 'Factoryデフォルトのタイトル１'
  end

  scenario "ユーザー登録と同時にログイン" do
    visit new_admin_user_path
    fill_in 'user[user_name]', with: 'ユーザー作成テスト'
    fill_in 'user[email]', with: 'create_user_test@example.com'
    check 'user[admin]'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button I18n.t('create')
    save_and_open_page
    expect(page).to have_content 'ユーザー作成テスト'
  end
  #
  # scenario "ユーザー登録と同時にログイン" do
  #
  # end
  #
  # scenario "ログインしている時は、ユーザー登録画面（new画面）に行かせない" do
  #
  # end
  #
  # scenario "自分（current_user）以外のユーザのマイページ（userのshow画面）に行かせない" do
  #
  # end
  #
  # scenario "管理画面でユーザ一覧・作成・更新・削除ができる" do
  #
  # end
  #
  # scenario "ユーザを削除したら、そのユーザが抱えているタスクを削除" do
  #
  # end
  #
  # scenario "ユーザの一覧画面で、ユーザが持っているタスクの数を表示" do
  #
  # end



end
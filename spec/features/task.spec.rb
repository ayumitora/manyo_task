# このrequireで、Capybaraなどの、Feature Specに必要な機能を使用可能な状態にしています
require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do

  background do
    @user_a = FactoryBot.create(:user)
    @user_b_admin = FactoryBot.create(:admin_user)
    # binding.pry

    #user_aのタスク
    FactoryBot.create(:task, id: 5, status: "保留中", user: @user_a)
    FactoryBot.create(:second_task, id: 6, status: "保留中", created_at: Time.current + 1.days, user: @user_a)
    FactoryBot.create(:third_task, id: 7, status: "保留中", created_at: Time.current + 2.days, user: @user_a)

    # user_aでログイン
    visit login_path
    fill_in I18n.t('email'), with: 'test@example.com'
    fill_in I18n.t('password'), with: 'password'
    click_button I18n.t('login')

    #ラベルの作成
    FactoryBot.create(:label)
  end

  scenario 'ログインユーザーのタスク一覧の確認' do
    visit tasks_path
    expect(page).to have_content 'Factoryデフォルトのタイトル１'
    expect(page).to have_content 'Factoryデフォルトのコンテント１'
    expect(page).not_to have_content 'Factoryデフォルトのコンテント2'
  end

  scenario "タスク作成のテスト" do
    visit new_task_path
    fill_in 'task[task_name]', with: 'あけましておめでとうございます。'
    fill_in 'task[note]', with: '今年もよろしくお願いします'
    click_button I18n.t('create')
    expect(page).to have_content 'あけましておめでとうございます'
    expect(page).to have_content '今年もよろしくお願いします'
  end

  scenario "タスク詳細のテスト" do
    visit tasks_path(id: 7)
    expect(page).to have_content 'Factoryデフォルトのコンテント３'
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    visit tasks_path
    expect(User.find(@user_a.id).tasks.order("created_at DESC").map(&:id)).to eq [7, 6, 5]
  end

  scenario "viewにてタスクが絞り込めるかのテスト" do
    visit tasks_path
    fill_in I18n.t('sarch_task_name'), with: 'タイトル２'
    select '保留中', from: I18n.t('sarch_status')
    click_button I18n.t('search')
    expect(page).to have_content 'タイトル２'
    expect(page).to have_content '保留中'
  end

  scenario "優先度が登録できているか" do
    visit tasks_path(id: 7)
    expect(page).to have_content '低'
  end

  scenario "優先度順にソートできているか" do
    visit tasks_path
    click_on '優先度でソートする'
    expect(User.find(@user_a.id).tasks.order("priority ASC").map(&:id)).to eq [5, 7, 6]
  end

  scenario "タスクにラベルをつけられる" do
    visit new_task_path
    fill_in 'task[task_name]', with: '書類提出'
    fill_in 'task[note]', with: '内容が揃っているか確認'
    # save_and_open_page
    check "task_which_label_ids_8"
    click_button I18n.t('create')
    visit task_path(id: 2)
    expect(page).to have_content '書類提出'
    expect(page).to have_content '内容が揃っているか確認'
    expect(page).to have_content '赤'
  end

  scenario "つけたラベルで検索できる" do
    visit new_task_path
    fill_in 'task[task_name]', with: '書類提出'
    fill_in 'task[note]', with: '内容が揃っているか確認'
    check "task_which_label_ids_9"
    click_button I18n.t('create')
    select '赤', from: I18n.t('sarch_label')
    click_button I18n.t('search')

    expect(page).to have_content '書類提出'
    expect(page).to have_content '内容が揃っているか確認'
    # save_and_open_page
  end

end
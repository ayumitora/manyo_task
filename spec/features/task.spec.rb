# このrequireで、Capybaraなどの、Feature Specに必要な機能を使用可能な状態にしています
require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do

  background do
    FactoryBot.create(:task, id:5)
    FactoryBot.create(:second_task, id:6, created_at: Time.current + 1.days)
    FactoryBot.create(:third_task, id:7, created_at: Time.current + 2.days)
  end

  scenario "タスク一覧のテスト" do
    visit tasks_path
    expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
    expect(page).to have_content 'Factoryで作ったデフォルトのコンテント１'
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
    visit tasks_path(id:7)
    expect(page).to have_content'Factoryデフォルトコンテント３'
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    visit tasks_path
    expect(Task.order("created_at DESC").map(&:id)).to eq [7,6,5]
  end

  scenario "viewにてタスクが絞り込めるかのテスト" do
    FactoryBot.create(:task, status: "保留中")
    FactoryBot.create(:second_task, status: "保留中")
    FactoryBot.create(:third_task, status: "保留中")
    visit tasks_path
    fill_in I18n.t('sarch_task_name'), with: 'タイトル２'
    select '保留中', from: I18n.t('sarch_status')
    click_button I18n.t('search')
    save_and_open_page
    expect(page).to have_content 'タイトル２'
    expect(page).to have_content '保留中'
  end
end
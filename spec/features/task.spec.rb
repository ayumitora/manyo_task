# このrequireで、Capybaraなどの、Feature Specに必要な機能を使用可能な状態にしています
require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do

  background do
    # あらかじめタスク一覧のテストで使用するためのタスクを二つ作成する
    FactoryBot.create(:task, id:5)
    FactoryBot.create(:second_task, id:6, created_at: Time.current + 1.days)
    FactoryBot.create(:third_task, id:7, created_at: Time.current + 2.days)
  end

  scenario "タスク一覧のテスト" do
    # Task.create!(task_name: 'test_task_01', note: 'testtesttest')
    # Task.create!(task_name: 'test_task_02', note: 'samplesample')
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
    task = Task.create!(task_name: 'たすたすてす', note: 'さんぷるさんぷる')
    # save_and_open_page
    visit tasks_path(id: task.id)
    expect(page).to have_content'さんぷるさんぷる'
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    visit tasks_path
    expect(Task.order("created_at DESC").map(&:id)).to eq [7,6,5]
    # タスクが作成日時の降順に並んでいるかのテスト
  end
end
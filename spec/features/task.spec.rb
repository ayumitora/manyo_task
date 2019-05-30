# このrequireで、Capybaraなどの、Feature Specに必要な機能を使用可能な状態にしています
require 'rails_helper'

# このRSpec.featureの右側に、「タスク管理機能」のように、テスト項目の名称を書きます（do ~ endでグループ化されています）
RSpec.feature "タスク管理機能", type: :feature do
  # scenario（itのalias）の中に、確認したい各項目のテストの処理を書きます。
  scenario "タスク一覧のテスト" do
    Task.create!(task_name: 'test_task_01', note: 'testtesttest')
    Task.create!(task_name: 'test_task_02', note: 'samplesample')
    visit tasks_path
    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'
  end

  scenario "タスク作成のテスト" do
    visit new_task_path
    fill_in 'task[task_name]', with: 'あけましておめでとうございます。'
    fill_in 'task[note]', with: '今年もよろしくお願いします'
    click_button '保存'
    expect(page).to have_content 'あけましておめでとうございます'
    expect(page).to have_content '今年もよろしくお願いします'
  end

  scenario "タスク詳細のテスト" do
    task = Task.create!(task_name: 'たすたすてす', note: 'さんぷるさんぷる')
    # save_and_open_page
    visit tasks_path(id: task.id)
    expect(page).to have_content'さんぷるさんぷる'
  end
end
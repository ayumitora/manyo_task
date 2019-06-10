require 'rails_helper'

RSpec.describe Task, type: :model do

  it "titleが空ならバリデーションが通らない" do
    task = Task.new(task_name: '', note: '失敗テスト')
    expect(task).not_to be_valid
  end

  it "contentが空でもバリデーションが通る" do
    task = Task.new(task_name: '失敗しないテスト', note: '失敗テスト')
    expect(task).to be_valid
  end

  it "titleとcontentに内容が記載されていればバリデーションが通る" do
    task = Task.new(task_name: '失敗しないテスト', note: '失敗しないテスト')
    expect(task).to be_valid
  end

  it "modelにてタスクが絞り込めるかのテスト" do
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
    FactoryBot.create(:third_task)
    FactoryBot.create(:task, status: "保留中")
    FactoryBot.create(:second_task, status: "保留中")
    expect_task = FactoryBot.create(:third_task, status: "保留中")
    result = Task.search(task: {task_name_key: "タイトル３", status_key: "保留中"})
    # binding.pry

    expect(result[0].id).to be expect_task.id
    expect(result.size).to eq 1
  end
end
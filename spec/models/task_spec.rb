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
end
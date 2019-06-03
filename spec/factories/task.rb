FactoryBot.define do

  # 作成するテストデータの名前を「task」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :task do
    task_name { 'Factoryで作ったデフォルトのタイトル１' }
    note { 'Factoryで作ったデフォルトのコンテント１' }
    # deadline { Time.zone.now }
  end

  # 作成するテストデータの名前を「second_task」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :second_task, class: Task do
    task_name { 'Factoryで作ったデフォルトのタイトル２' }
    note { 'Factoryで作ったデフォルトのコンテント２' }
    # deadline { Time.zone.now }
  end

  factory :third_task, class: Task do
    task_name { 'Factoryデフォルトタイトル３' }
    note { 'Factoryデフォルトコンテント３' }
    # deadline { Time.zone.now }
  end
end
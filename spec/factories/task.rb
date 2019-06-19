FactoryBot.define do

  # 作成するテストデータの名前を「task」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :task do
    task_name {'Factoryデフォルトのタイトル１'}
    note {'Factoryデフォルトのコンテント１'}
    deadline {Time.now}
    status {"未着手"}
    priority {'high'}
    association :user, factory: :admin_user
  end

  # 作成するテストデータの名前を「second_task」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :second_task, class: Task do
    task_name {'Factoryデフォルトのタイトル２'}
    note {'Factoryデフォルトのコンテント２'}
    deadline {Time.now}
    status {"着手中"}
    priority {'low'}
    association :user, factory: :user
    user
  end

  factory :third_task, class: Task do
    task_name {'Factoryデフォルトのタイトル３'}
    note {'Factoryデフォルトのコンテント３'}
    deadline {Time.now}
    status {"完了"}
    priority {'medium'}
    user
  end

  factory :task4, class: Task do
    task_name {'Factoryデフォルトのタイトル４'}
    note {'Factoryデフォルトのコンテント４'}
    deadline {Time.now}
    status {"未着手"}
    priority {'high'}
    association :user, factory: :admin_user
  end

  factory :task5, class: Task do
    task_name {'Factoryデフォルトのタイトル５'}
    note {'Factoryデフォルトのコンテント５'}
    deadline {Time.now}
    status {"着手中"}
    priority {'low'}
    association :user, factory: :admin_user
  end

  factory :task6, class: Task do
    task_name {'Factoryデフォルトのタイトル６'}
    note {'Factoryデフォルトのコンテント６'}
    deadline {Time.now}
    status {"完了"}
    priority {'medium'}
    association :user, factory: :admin_user
  end

end

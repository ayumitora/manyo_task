FactoryBot.define do
  factory :admin_user, class: User do
    user_name { "管理テストユーザー" }
    email { "admin_test@example.com" }
    password { "password" }
    admin { true }
  end

  factory :user do
    user_name { "テストユーザー" }
    email { "test@example.com" }
    password { "password" }
    admin { false }
  end
end

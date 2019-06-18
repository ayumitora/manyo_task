FactoryBot.define do
  factory :admin_user do
    user_name { "管理テストユーザー" }
    email { "admin_test@example.com" }
    password_digest { "password" }
    admin { true }
  end

  factory :user do
    user_name { "管理テストユーザー" }
    email { "test@example.com" }
    password_digest { "password" }
    admin { false }
  end
end

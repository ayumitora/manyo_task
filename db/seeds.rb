
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
      user_name: 'admin',
      email: 'admin@admin.com',
      admin: true,
      password: 'password',
      password_confirmation: 'password'
)
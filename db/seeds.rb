
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
      user_name: 'admin',
      email: 'admin@admin.com',
      admin: true,
      password: 'password',
      password_confirmation: 'password'
)

Label.create!(
  label_name: 'children'
)

Label.create!(
  label_name: 'mother'
)

Label.create!(
  label_name: 'father'
)

Label.create!(
  label_name: 'friend'
)

Label.create!(
  label_name: 'housework'
)

Label.create!(
  label_name: 'work'
)

Label.create!(
  label_name: 'play'
)

Label.create!(
  label_name: 'other'
)
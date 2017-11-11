# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

topic_data = File.read(Rails.root.join('data', 'topic_queries')).split('##')
topic_data.each do |topic|
  data = topic.split("||")
  name = data[0]
  code = data[1]

  Topic.create name: name, code: code
end

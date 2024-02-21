require 'faker'

i = 1

2000.times do
	puts "Creating Post - #{i}"
    Post.create(author_name: Faker::Name.name,
    	title: Faker::Lorem.sentence,
    	description: Faker::Lorem.paragraph
    )
    i += 1
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


c1 = Comic.create!(title: "Supermouse", description: "A comic about Supermouse and his cheesey adventures", comic_type: "oneshot",
 cover: {io: File.open(Rails.root.join('app','assets','images','Supermouse.jpg')), filename:'Supermouse.jpg'})

p1 = Page.create!(comic_id:1,page_number:1,
image:{io: File.open(Rails.root.join('app','assets','images','SuperMouse','page1.jpg')), filename:'page1.jpg'})

p2 = Page.create!(comic_id:1,page_number:2,
image:{io: File.open(Rails.root.join('app','assets','images','SuperMouse','page2.jpg')), filename:'page2.jpg'})

p3 = Page.create!(comic_id:1,page_number:3,
image:{io: File.open(Rails.root.join('app','assets','images','SuperMouse','page3.jpg')), filename:'page3.jpg'})

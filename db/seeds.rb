# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create!(email:'scott@mail.com', password:'password',first_name:'Scott',last_name:'Johnson')
u2 = User.create!(email:'john@mail.com', password:'password',first_name:'John',last_name:'Doe')

c1 = Comic.create!(author: u2, title: "Supermouse", description: "A comic about Supermouse and his cheesey adventures", comic_type: "oneshot",
 cover: {io: File.open(Rails.root.join('app','assets','images','Supermouse.jpg')), filename:'Supermouse.jpg'})
c1.pages.create!(page_number:1,
image:{io: File.open(Rails.root.join('app','assets','images','SuperMouse','page1.jpg')), filename:'page1.jpg'})
c1.pages.create!(page_number:2,
image:{io: File.open(Rails.root.join('app','assets','images','SuperMouse','page2.jpg')), filename:'page2.jpg'})
c1.pages.create!(page_number:3,
image:{io: File.open(Rails.root.join('app','assets','images','SuperMouse','page3.jpg')), filename:'page3.jpg'})

Series.create!(author: u2, title: "Sniffy The Pup", description: "Sniff the Pup is a comic series about, guess who. Sniffy the Pup who is whacky dog that goes on many adventures and meets alot people join Sniffy and the crew as they explore Sniffy's world",
cover: {io: File.open(Rails.root.join('app','assets','images','Sniffy The Pup', "Sniffy The Pup.jpg")), filename:'Sniffy The Pup.jpg'})

c2 = Comic.create!(author: u2, title: "Sniffy The Pup #6", description: "Sniff the Pup Issue #6", issue_number: 6, comic_type: 'series', series_id: 1,
cover: {io: File.open(Rails.root.join('app','assets','images','Sniffy The Pup', "Sniffy The Pup #6",'0.jpg' )), filename:'0.jpg'})
c2.pages.create!(page_number:1,
image:{io: File.open(Rails.root.join('app','assets','images','Sniffy The Pup',"Sniffy The Pup #6",'0.jpg')), filename:'0.jpg'})
c2.pages.create!(page_number:2,
image:{io: File.open(Rails.root.join('app','assets','images','Sniffy The Pup',"Sniffy The Pup #6",'1.jpg')), filename:'1.jpg'})
c2.pages.create!(page_number:3,
image:{io: File.open(Rails.root.join('app','assets','images','Sniffy The Pup',"Sniffy The Pup #6",'2.jpg')), filename:'2.jpg'})
c2.pages.create!(page_number:4,
image:{io: File.open(Rails.root.join('app','assets','images','Sniffy The Pup',"Sniffy The Pup #6",'3.jpg')), filename:'3.jpg'})
c2.pages.create!(page_number:5,
image:{io: File.open(Rails.root.join('app','assets','images','Sniffy The Pup',"Sniffy The Pup #6",'4.jpg')), filename:'4.jpg'})


Review.create!(critic: u1, comic_id: 1, title:"A Review of Supermouse",body:"Supermouse just seems to be an old ripoff of Mightymouse, not very enjoyable", rating:2)
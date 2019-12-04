# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create!(email:'scott@mail.com', password:'password',first_name:'Scott',last_name:'Johnson',role:"Critic")
u2 = User.create!(email:'john@mail.com', password:'password',first_name:'John',last_name:'Doe',role:"Creator")
u3 = User.create!(email:'julie@mail.com',password:'password',first_name:'Julie',last_name:'Smith',role:"Creator")
u4 = User.create!(email:'adam@mail.com', password:'password',first_name:'Adam',last_name:'Smit',role:"Critic")
u5 = User.create!(email:'christy@mail.com', password:'password',first_name:'Christy',last_name:'Crystal',role:"Critic")
u6 = User.create!(email:'steve@mail.com', password:'password',first_name:'Steve',last_name:'Moe',role:"Critic")
u7 = User.create!(email:'olivia@mail.com', password:'password',first_name:'Olivia',last_name:'Lue',role:"Critic")


c1 = Comic.create!(author: u2, title: "Supermouse", description: "A comic about Supermouse and his cheesey adventures", comic_type: "oneshot",
 cover: {io: File.open(Rails.root.join('app','assets','images','Supermouse','0.jpg')), filename:'0.jpg'})
 for i in 1..11
    c1.pages.create!(page_number:i,image:{io: File.open(Rails.root.join('app','assets','images','Supermouse',"#{i}.jpg")), filename:"#{i}.jpg"})
 end

Series.create!(author: u3, title: "Sniffy The Pup", description: "Sniff the Pup is a comic series about, guess who. Sniffy the Pup who is whacky dog that goes on many adventures and meets alot people join Sniffy and the crew as they explore Sniffy's world",
cover: {io: File.open(Rails.root.join('app','assets','images','Sniffy The Pup', "Sniffy The Pup.jpg")), filename:'Sniffy The Pup.jpg'})

c2 = Comic.create!(author: u3, title: "Sniffy The Pup #6", description: "Sniff the Pup Issue #6", issue_number: 6, comic_type: 'series', series_id: 1,
cover: {io: File.open(Rails.root.join('app','assets','images','Sniffy The Pup', "Sniffy The Pup #6",'0.jpg' )), filename:'0.jpg'})
for i in 1..15
    c2.pages.create!(page_number:i,image:{io: File.open(Rails.root.join('app','assets','images','Sniffy The Pup',"Sniffy The Pup #6","#{i}.jpg")), filename:"#{i}.jpg"})
 end

 c3 = Comic.create!(author: u3, title: "Sniffy The Pup #14", description: "Sniff the Pup Issue #14", issue_number: 14, comic_type: 'series', series_id: 1,
cover: {io: File.open(Rails.root.join('app','assets','images','Sniffy The Pup', "Sniffy The Pup #14",'0.jpg' )), filename:'0.jpg'})
for i in 1..16
    c3.pages.create!(page_number:i,image:{io: File.open(Rails.root.join('app','assets','images',"Sniffy The Pup",'Sniffy The Pup #14',"#{i}.jpg")), filename:"#{i}.jpg"})
 end

 c4 = Comic.create!(author: u2, title: "Judy of The Jungle", description: "A comic about Judy who is the woman of the Jungle", comic_type: "oneshot",
 cover: {io: File.open(Rails.root.join('app','assets','images','Judy of The Jungle','0.jpg')), filename:'0.jpg'})
 for i in 1..8
    c4.pages.create!(page_number:i,image:{io: File.open(Rails.root.join('app','assets','images','Judy of The Jungle',"#{i}.jpg")), filename:"#{i}.jpg"})
 end



u1.reviews.create!(comic_id: 1, title:"A Review of Supermouse",body:"Supermouse just seems to be an old ripoff of Mightymouse, not very enjoyable", rating:2)
u4.reviews.create!(comic_id: 1, title:"My Thoughts on the Mouse",body:"I read through the entire comic and really enjoyed it. At first it seems to just be a copy of Mightymouse but after getting inot the story it start to seperate it self and is very enjoyable.", rating:4)
u5.reviews.create!(comic_id: 1, title:"The good,The bad,The mouse",body:"At first Supermouse was very enjoyable with its silly humor, but after a while of reading its starts just repeating jokes or reallying onl slap stick humor which I personally don't enjoy. While its not a bad comic its also not the best.", rating:3)
u6.reviews.create!(comic_id: 1, title:"A Supermouse?",body:"The entire time I was reading this I was just thinking that I would rather read Mighty mouse than this comic. and I don't even enjoy Mightymouse either so that says a lot.", rating:1)
u7.reviews.create!(comic_id: 1, title:"Squeak Squeak",body:"I thought this was a super cute and funny little adventure of a little silly mouse overall its just a fun and silly ride about a mouse and some friends trying to save the day where ever they go. I enjoyed it alot.", rating:5)

u1.reviews.create!(series_id: 1, title:"The Best Puppy",body:"This Sereis is great. Every issues is very enjoyable and always provides an good laugh. I highly reccomend this series", rating:5)
u4.reviews.create!(series_id: 1, title:"If only I had a Dog like Sniffy",body:"I just love Sniffy the Pup. The Author has done just such an amazing job and creating an enjoyable series that speaks to everyone.", rating:5)
u5.reviews.create!(series_id: 1, title:"Sniffy is Great",body:"Sniffy the Pup is a very wamr hearted comic just about a adorable puppy going on his very fun adventures. I will always reccomend this comic as long as it is around.", rating:5)
u6.reviews.create!(series_id: 1, title:"Adorable ride",body:"An adorable pup going on adorable adventures and just causing trouble where ever he goes whats not to love about this series?", rating:5)
u7.reviews.create!(series_id: 1, title:"The Greatest Creation",body:"I honestly have no words for how just amazing this series is its just jaw dropping how good it is. Everyone should read this.", rating:5)



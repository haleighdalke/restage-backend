# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'date'

# User.destroy_all
# Artist.destroy_all
# Admin.destroy_all
# Piece.destroy_all
# Festival.destroy_all

10.times do
    User.create(
        name: Faker::Name.first_name,
        username: Faker::Name.first_name + Faker::Name.last_name,
        password_digest: "asdlf124"
    )
end

5.times do
    Artist.create(
        user: User.all.sample,
        company_title: Faker::Movies::StarWars.vehicle,
        bio: Faker::Movies::StarWars.quote,
        photo: Faker::Avatar.image
    )
end

User.create(name: "Haleigh Dalke", username: "haleighdalke123")
Admin.create(
    user: User.all.last,
    authorization_code: "dockingbay94",
    title: "director"
)

videos = ['vRXZj0DzXIA', 'epKhvHMjAvs', '8cfL6UbItDk', 'V0TMHRijVDw', 'Fcl30mWtJQU']

def generate_random_video(videos)
    newArr = []
    3.times do
        newArr.push(videos.sample)
    end
    newArr.join(',')
end

5.times do
    Festival.create(
        admin: Admin.all.first,
        title: Faker::Movies::StarWars.planet,
        description: Faker::Hipster.paragraph,
        cover_photo: Faker::Avatar.image,
        application_start_date: Faker::Date.between(Date.new(2020,3,15), Date.new(2020,6,15)),
        application_end_date: Faker::Date.between(Date.new(2020,6,16), Date.new(2020,9,1)),
        release_date: Faker::Date.between(Date.new(2020,9,2), Date.new(2020,10,15)),
        video_list: generate_random_video(videos)
    )
end

15.times do
    Piece.create(
        artist: Artist.all.sample,
        festival: Festival.all.sample,
        title: Faker::Movies::StarWars.specie,
        cover_photo: Faker::Avatar.image,
        description: Faker::Hipster.sentence,
        trailer_id: videos.sample,
        full_video_id: videos.sample
    )
end
require 'faker'
require 'date'
require_relative('../quickstart.rb')
require 'byebug'

# User.destroy_all
# Artist.destroy_all
# Admin.destroy_all
# Piece.destroy_all
# Festival.destroy_all

headshots = [
    'https://images.unsplash.com/photo-1587747412506-24faaf4f52c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
    'https://images.unsplash.com/photo-1598886221109-b2b3d7699c16?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=935&q=80',
    'https://images.unsplash.com/photo-1598971861589-489425aab447?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=935&q=80',
    'https://images.unsplash.com/photo-1598651108996-186a1121a47d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=933&q=80',
    'https://images.unsplash.com/photo-1595621853511-e111057d93b2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
    'https://images.unsplash.com/photo-1598978709756-1187006a3410?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
    'https://images.unsplash.com/photo-1598270502345-e45e2d400a96?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
    'https://images.unsplash.com/photo-1597968051638-64d26319ca65?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80',
    'https://images.unsplash.com/photo-1598649733535-ae15aaf8cecc?ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
    'https://images.unsplash.com/photo-1575222162066-b8b0eabbea75?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=975&q=80'
]

videos = videos_by_playlist(getService(), 'id,snippet', {playlist_id: 'PL9-LcCgTIujKGIMXaWpTWVi6CBUUyYVjR', page_token: ''})

cover_photos = [
    'https://images.unsplash.com/photo-1511715282680-fbf93a50e721?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1550026593-cb89847b168d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1504647164485-1d91e1d0a112?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1478604659451-3424450de009?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1474308371634-c715850e8d8b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1560088292-a9aa45f41714?ixlib=rb-1.2.1&auto=format&fit=crop&w=2754&q=80',
    'https://images.unsplash.com/photo-1499720843949-d9e6f318dca0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=1950&q=80'
]

piece_cover_photos = [
    'https://images.unsplash.com/photo-1534767864847-5f2b053932f8?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1534184715960-8a3b49beb4e0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1533106958148-daaeab8b83fe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1531318701087-32c11653dd77?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1530880099622-d585490bef2c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1530108296775-2dd6081eb33d?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1529229504105-4ea795dcbf59?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1525426250015-4e6473cdbf17?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1511715282680-fbf93a50e721?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1550026593-cb89847b168d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1535161531861-4a5d0a14bf40?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1542892770-3e6a09c7a7da?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1558&q=80',
    'https://images.unsplash.com/photo-1551712485-546d3d414701?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523950704592-ee4866469b4c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2717&q=80',
    'https://images.unsplash.com/photo-1533106958148-daaeab8b83fe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1951&q=80'
]

def generate_random_video(videos)
    newArr = []
    5.times do
        newArr.push(videos.sample[:video_id])
    end
    newArr.join(',')
end

15.times do
    User.create(
        name: Faker::Name.first_name,
        username: Faker::Name.first_name + Faker::Name.last_name,
        password_digest: "asdlf124"
    )
end

10.times do
    Artist.create(
        user_id: User.all.sample.id,
        company_title: Faker::Movies::StarWars.vehicle,
        bio: Faker::Movies::StarWars.quote,
        photo: headshots.sample
    )
end

Admin.create(
    user_id: User.all.last.id,
    authorization_code: "dockingbay94",
    title: "director"
)

5.times do
    Festival.create(
        admin_id: Admin.all.first.id,
        title: Faker::Movies::StarWars.planet,
        description: Faker::Hipster.paragraph,
        cover_photo: cover_photos.sample,
        application_start_date: Faker::Date.between(Date.new(2020,3,15), Date.new(2020,6,15)),
        application_end_date: Faker::Date.between(Date.new(2020,6,16), Date.new(2020,9,1)),
        release_date: Faker::Date.between(Date.new(2020,9,2), Date.new(2020,10,15)),
        video_list: ""
    )
end

20.times do
    video = videos.sample
    Piece.create(
        artist_id: Artist.all.sample.id,
        festival_id: Festival.all.sample.id,
        title: video[:title],
        cover_photo: video[:cover_photo],
        description: video[:description],
        trailer_id: video[:video_id],
        full_video_id: video[:video_id]
    )
end
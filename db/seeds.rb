require 'faker'
require 'date'
require_relative('../quickstart.rb')
require_relative('../flickraw.rb')
require 'byebug'

# User.destroy_all
# Artist.destroy_all
# Admin.destroy_all
# Piece.destroy_all
# Festival.destroy_all

# return format:
# {     :url=>"https://live.staticflickr.com/65535/50797468676_e2fe305179_o.png", 
#       :title=>"(C)ARBON", 
#       :description=>"Gallim's Artistic Director Andrea Miller (currently the Met Artist-in-Residence), presents (C)arbon, a three-gallery performance installation of dance, film, sculpture and soundscape on the phenomenon of the body. Performed by six dancers, this anthropological study of the body dedicates each gallery to a state of the body's experience (individual, duel relations, and en masse). (C)arbon will be exhibited in conjunction with The Met Breuer's exhibition, Like Life: Sculpture, Color, and the Body, examining 700 years of sculpture of the human body."}

# playlists = ['PL9-LcCgTIujLZVu-x_Oc1LbNiONKY--Hz', 'PL9-LcCgTIujK9EQTBJxAd963D7YxrXQiH', 'PL9-LcCgTIujJd3rvDu5-p9w7foi6oCtlV', 'PLDH-IuxbMOftkzriSYNQ6mXtry9rYO-XP', 'PLO3MEeCjYca8gehkLykvVrFry809-DLQt']

# all_videos = playlists.map do |playlist| 
#     videos_by_playlist(getService(), 'id,snippet', {playlist_id: playlist, page_token: ''})
# end


festival_cover_photos = get_flickr_photos('72157717711904157')
piece_cover_photos = get_flickr_photos('72157717707882863')
headshots = get_flickr_photos('72157717707858908')

videos = videos_by_playlist(getService(), 'id,snippet', {playlist_id: 'PL9-LcCgTIujKGIMXaWpTWVi6CBUUyYVjR', page_token: ''})

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

# byebug

for artist in headshots do
    Artist.create(
        user_id: User.all.sample.id,
        company_title: artist[:title],
        bio: artist[:description],
        photo: artist[:url]
    )
end

Admin.create(
    user_id: User.all.last.id,
    authorization_code: "dockingbay94",
    title: "director"
)


for piece in festival_cover_photos do
    Festival.create(
        admin_id: Admin.all.first.id,
        title: piece[:title],
        description: piece[:description],
        cover_photo: piece[:url],
        application_start_date: Faker::Date.between(Date.new(2021,3,15), Date.new(2021,6,15)),
        application_end_date: Faker::Date.between(Date.new(2021,6,16), Date.new(2021,9,1)),
        release_date: Faker::Date.between(Date.new(2021,9,2), Date.new(2021,10,15)),
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
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'faker'
# require 'date'

# YOUTUBE API ----------------------

# Sample Ruby code for user authorization

# require 'rest-client'

# require 'rubygems'
# gem 'google-api-client', '>0.7'
# require 'google/apis'
# require 'google/apis/youtube_v3'
# require 'googleauth'
# require 'googleauth/stores/file_token_store'

# require 'fileutils'
# require 'json'

# # REPLACE WITH VALID REDIRECT_URI FOR YOUR CLIENT
# REDIRECT_URI = 'http://localhost'
# APPLICATION_NAME = 'YouTube Data API Ruby Tests'

# # REPLACE WITH NAME/LOCATION OF YOUR client_secrets.json FILE
# CLIENT_SECRETS_PATH = './client_secret.json'

# # REPLACE FINAL ARGUMENT WITH FILE WHERE CREDENTIALS WILL BE STORED
# CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
#                              "youtube-quickstart-ruby-credentials.yaml")

# # SCOPE FOR WHICH THIS SCRIPT REQUESTS AUTHORIZATION
# SCOPE = Google::Apis::YoutubeV3::AUTH_YOUTUBE_READONLY

# def authorize
#   FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

#   client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
#   token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
#   authorizer = Google::Auth::UserAuthorizer.new(
#     client_id, SCOPE, token_store)
#   user_id = 'default'
#   credentials = authorizer.get_credentials(user_id)
#   if credentials.nil?
#     url = authorizer.get_authorization_url(base_url: REDIRECT_URI)
#     puts "Open the following URL in the browser and enter the " +
#          "resulting code after authorization"
#     puts url
#     code = gets
#     credentials = authorizer.get_and_store_credentials_from_code(
#       user_id: user_id, code: code, base_url: REDIRECT_URI)
#   end
#   credentials
# end

# # Initialize the API
# service = Google::Apis::YoutubeV3::YouTubeService.new
# service.client_options.application_name = APPLICATION_NAME
# service.authorization = authorize

# # Sample ruby code for channels.list

# def channels_list_by_username(service, part, **params)
#   response = service.list_channels(part, params).to_json
#   item = JSON.parse(response).fetch("items")[0]

#   puts ("This channel's ID is #{item.fetch("id")}. " +
#         "Its title is '#{item.fetch("snippet").fetch("title")}', and it has " +
#         "#{item.fetch("statistics").fetch("viewCount")} views.")
# end

# channels_list_by_username(service, 'snippet,contentDetails,statistics', for_username: 'GoogleDevelopers')




# GET https://www.googleapis.com/youtube/v3/playlistItems?part=id%2C%20snippet&playlistId=PL9-LcCgTIujKGIMXaWpTWVi6CBUUyYVjR&key=[YOUR_API_KEY] HTTP/1.1

# Authorization: Bearer [YOUR_ACCESS_TOKEN]
# Accept: application/json


# ----------------------------------

require '../quickstart.rb'

# User.destroy_all
# Artist.destroy_all
# Admin.destroy_all
# Piece.destroy_all
# Festival.destroy_all

# 15.times do
#     User.create(
#         name: Faker::Name.first_name,
#         username: Faker::Name.first_name + Faker::Name.last_name,
#         password_digest: "asdlf124"
#     )
# end

# headshots = [
#     'https://images.unsplash.com/photo-1587747412506-24faaf4f52c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
#     'https://images.unsplash.com/photo-1598886221109-b2b3d7699c16?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=935&q=80',
#     'https://images.unsplash.com/photo-1598971861589-489425aab447?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=935&q=80',
#     'https://images.unsplash.com/photo-1598651108996-186a1121a47d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=933&q=80',
#     'https://images.unsplash.com/photo-1595621853511-e111057d93b2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
#     'https://images.unsplash.com/photo-1598978709756-1187006a3410?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
#     'https://images.unsplash.com/photo-1598270502345-e45e2d400a96?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80',
#     'https://images.unsplash.com/photo-1597968051638-64d26319ca65?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80',
#     'https://images.unsplash.com/photo-1598649733535-ae15aaf8cecc?ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
#     'https://images.unsplash.com/photo-1575222162066-b8b0eabbea75?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=975&q=80'
# ]

# 10.times do
#     Artist.create(
#         user: User.all.sample,
#         company_title: Faker::Movies::StarWars.vehicle,
#         bio: Faker::Movies::StarWars.quote,
#         photo: headshots.sample
#     )
# end

# User.create(name: "Haleigh Dalke", username: "haleighdalke123")
# Admin.create(
#     user: User.all.last,
#     authorization_code: "dockingbay94",
#     title: "director"
# )

# videos = ['vRXZj0DzXIA', 'epKhvHMjAvs', '8cfL6UbItDk', 'V0TMHRijVDw', 'Fcl30mWtJQU']

# def generate_random_video(videos)
#     newArr = []
#     3.times do
#         newArr.push(videos.sample)
#     end
#     newArr.join(',')
# end

# cover_photos = [
#     'https://images.unsplash.com/photo-1511715282680-fbf93a50e721?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
#     'https://images.unsplash.com/photo-1550026593-cb89847b168d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
#     'https://images.unsplash.com/photo-1504647164485-1d91e1d0a112?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
#     'https://images.unsplash.com/photo-1478604659451-3424450de009?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80',
#     'https://images.unsplash.com/photo-1474308371634-c715850e8d8b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
#     'https://images.unsplash.com/photo-1560088292-a9aa45f41714?ixlib=rb-1.2.1&auto=format&fit=crop&w=2754&q=80',
#     'https://images.unsplash.com/photo-1499720843949-d9e6f318dca0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=1950&q=80'
# ]

# 5.times do
#     Festival.create(
#         admin: Admin.all.first,
#         title: Faker::Movies::StarWars.planet,
#         description: Faker::Hipster.paragraph,
#         cover_photo: cover_photos.sample,
#         application_start_date: Faker::Date.between(Date.new(2020,3,15), Date.new(2020,6,15)),
#         application_end_date: Faker::Date.between(Date.new(2020,6,16), Date.new(2020,9,1)),
#         release_date: Faker::Date.between(Date.new(2020,9,2), Date.new(2020,10,15)),
#         video_list: generate_random_video(videos)
#     )
# end

# piece_cover_photos = [
#     'https://images.unsplash.com/photo-1534767864847-5f2b053932f8?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80',
#     'https://images.unsplash.com/photo-1534184715960-8a3b49beb4e0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
#     'https://images.unsplash.com/photo-1533106958148-daaeab8b83fe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1951&q=80',
#     'https://images.unsplash.com/photo-1531318701087-32c11653dd77?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80',
#     'https://images.unsplash.com/photo-1530880099622-d585490bef2c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
#     'https://images.unsplash.com/photo-1530108296775-2dd6081eb33d?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80',
#     'https://images.unsplash.com/photo-1529229504105-4ea795dcbf59?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
#     'https://images.unsplash.com/photo-1525426250015-4e6473cdbf17?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80',
#     'https://images.unsplash.com/photo-1511715282680-fbf93a50e721?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
#     'https://images.unsplash.com/photo-1550026593-cb89847b168d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
#     'https://images.unsplash.com/photo-1535161531861-4a5d0a14bf40?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80',
#     'https://images.unsplash.com/photo-1542892770-3e6a09c7a7da?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1558&q=80',
#     'https://images.unsplash.com/photo-1551712485-546d3d414701?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80',
#     'https://images.unsplash.com/photo-1523950704592-ee4866469b4c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2717&q=80',
#     'https://images.unsplash.com/photo-1533106958148-daaeab8b83fe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1951&q=80'
# ]
# 15.times do
#     Piece.create(
#         artist: Artist.all.sample,
#         festival: Festival.all.sample,
#         title: Faker::Movies::StarWars.specie,
#         cover_photo: piece_cover_photos.sample,
#         description: Faker::Hipster.sentence,
#         trailer_id: videos.sample,
#         full_video_id: videos.sample
#     )
# end
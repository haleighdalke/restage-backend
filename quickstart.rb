# Sample Ruby code for user authorization

require 'byebug'
require 'rubygems'
gem 'google-api-client', '>0.7'
require 'google/apis'
require 'google/apis/youtube_v3'
require 'googleauth'
require 'googleauth/stores/file_token_store'

require 'google/api_client'
require 'google/api_client/client_secrets'
require 'google/api_client/auth/file_storage'
require 'google/api_client/auth/installed_app'
require 'trollop'

require 'fileutils'
require 'json'

# REPLACE WITH VALID REDIRECT_URI FOR YOUR CLIENT
REDIRECT_URI = 'http://localhost'
APPLICATION_NAME = 'YouTube Data API Ruby Tests'

# REPLACE WITH NAME/LOCATION OF YOUR client_secrets.json FILE
CLIENT_SECRETS_PATH = 'client_secret.json'

# REPLACE FINAL ARGUMENT WITH FILE WHERE CREDENTIALS WILL BE STORED
CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
                             "youtube-quickstart-ruby-credentials.yaml")

# SCOPE FOR WHICH THIS SCRIPT REQUESTS AUTHORIZATION
SCOPE = Google::Apis::YoutubeV3::AUTH_YOUTUBE_READONLY

def authorize
  FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

  client_id = Google::Auth::ClientId.from_file(CLIENT_SECRETS_PATH)
  token_store = Google::Auth::Stores::FileTokenStore.new(file: CREDENTIALS_PATH)
  authorizer = Google::Auth::UserAuthorizer.new(
    client_id, SCOPE, token_store)
  user_id = 'default'
  credentials = authorizer.get_credentials(user_id)
  if credentials.nil?
    url = authorizer.get_authorization_url(base_url: REDIRECT_URI)
    puts "Open the following URL in the browser and enter the " +
         "resulting code after authorization"
    puts url
    code = gets
    credentials = authorizer.get_and_store_credentials_from_code(
      user_id: user_id, code: code, base_url: REDIRECT_URI)
  end
  credentials
end

# Initialize the API (moved to method below)

# service = Google::Apis::YoutubeV3::YouTubeService.new
# service.client_options.application_name = APPLICATION_NAME
# service.authorization = authorize

def getService
  service = Google::Apis::YoutubeV3::YouTubeService.new
  service.client_options.application_name = APPLICATION_NAME
  service.authorization = authorize
  service
end

# Sample ruby code for channels.list

# def channels_list_by_username(service, part, **params)
#   response = service.list_channels(part, params).to_json
#   item = JSON.parse(response).fetch("items")[0]

#   puts ("This channel's ID is #{item.fetch("id")}. " +
#         "Its title is '#{item.fetch("snippet").fetch("title")}', and it has " +
#         "#{item.fetch("statistics").fetch("viewCount")} views.")

# end

# channels_list_by_username(getService(), 'snippet,contentDetails,statistics', for_username: 'GoogleDevelopers')

# Following format above, create a method to retrieve playlist video id's
def videos_by_playlist(service, part, params)
  videos = []
  next_page = ""

  # while next pages, get all data
  loop do
    params[:page_token] = next_page
    response = service.list_playlist_items(part, params).to_json
    next_page = JSON.parse(response)["nextPageToken"]
    raw_videos = JSON.parse(response).fetch("items")
    videos = videos.concat(raw_videos.collect{ |item| 
      { title: item["snippet"]["title"], 
        video_id: item["snippet"]["resourceId"]["videoId"], 
        description: item["snippet"]["description"],
        cover_photo: item["snippet"]["thumbnails"]["high"]["url"]
    }})
  break if !next_page
  end

  videos
end

# upload a video


# A limited OAuth 2 access scope that allows for uploading files, but not other
# types of account access.
YOUTUBE_UPLOAD_SCOPE = 'https://www.googleapis.com/auth/youtube.upload'
YOUTUBE_API_SERVICE_NAME = 'youtube'
YOUTUBE_API_VERSION = 'v3'

def get_authenticated_service
  client = Google::APIClient.new(
    :application_name => $PROGRAM_NAME,
    :application_version => '1.0.0'
  )
  youtube = client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)

  file_storage = Google::APIClient::FileStorage.new("#{$PROGRAM_NAME}-oauth2.json")
  if file_storage.authorization.nil?
    client_secrets = Google::APIClient::ClientSecrets.load
    flow = Google::APIClient::InstalledAppFlow.new(
      :client_id => client_secrets.client_id,
      :client_secret => client_secrets.client_secret,
      :scope => [YOUTUBE_UPLOAD_SCOPE]
    )
    client.authorization = flow.authorize(file_storage)
  else
    client.authorization = file_storage.authorization
  end

  return client, youtube
end

def main
  opts = Trollop::options do
    opt :file, 'Video file to upload', :type => String
    opt :title, 'Video title', :default => 'Test Title', :type => String
    opt :description, 'Video description',
          :default => 'Test Description', :type => String
    opt :category_id, 'Numeric video category. See https://developers.google.com/youtube/v3/docs/videoCategories/list',
          :default => 22, :type => :int
    opt :keywords, 'Video keywords, comma-separated',
          :default => '', :type => String
    opt :privacy_status, 'Video privacy status: public, private, or unlisted',
          :default => 'public', :type => String
  end

  if opts[:file].nil? or not File.file?(opts[:file])
    Trollop::die :file, 'does not exist'
  end

  client, youtube = get_authenticated_service

  begin
    body = {
      :snippet => {
        :title => opts[:title],
        :description => opts[:description],
        :tags => opts[:keywords].split(','),
        :categoryId => opts[:category_id],
      },
      :status => {
        :privacyStatus => opts[:privacy_status]
      }
    }

    videos_insert_response = client.execute!(
      :api_method => youtube.videos.insert,
      :body_object => body,
      :media => Google::APIClient::UploadIO.new(opts[:file], 'video/*'),
      :parameters => {
        :uploadType => 'resumable',
        :part => body.keys.join(',')
      }
    )

    videos_insert_response.resumable_upload.send_all(client)

    puts "Video id '#{videos_insert_response.data.id}' was successfully uploaded."
  rescue Google::APIClient::TransmissionError => e
    puts e.result.body
  end
end

main




def upload_video(service, video, title, description)
  byebug
end

upload_video(getService(), "null", "null", "null")
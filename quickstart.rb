# Sample Ruby code for user authorization

require 'byebug'
require 'rubygems'
gem 'google-api-client', '>0.7'
require 'google/apis'
require 'google/apis/youtube_v3'
require 'googleauth'
require 'googleauth/stores/file_token_store'

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
SCOPE = Google::Apis::YoutubeV3::AUTH_YOUTUBE_UPLOAD

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

# Initialize the API
def getService
  service = Google::Apis::YoutubeV3::YouTubeService.new
  service.client_options.application_name = APPLICATION_NAME
  service.authorization = authorize
  service
end

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


# UPLOAD A VIDEO METHOD (not working)
# def upload_video(service, video, title, description)
#   byebug

#   # body = {snippet_title: title, snippet_description: description}
#   # result = service.insert_video('id,snippet,status', body, video)

#   opts = {keywords: ['dance', 'art']}

#   body = {
#     snippet: {
#       title: title,
#       description: description,
#       tags: opts[:keywords].split(',')
#     }
#   }

#   service.insert_video('snippet', body, upload_source:video,content_type:'video/*')

#   byebug
# end

# ERROR MESSAGE FOR ABOVE:
  # Completed 500 Internal Server Error in 4314ms (ActiveRecord: 4.1ms | Allocations: 128001)


  # [ActiveJob] [ActiveStorage::AnalyzeJob] [c31617d7-eea9-4a4e-a1be-50c4c32a0bd1] Performing ActiveStorage::AnalyzeJob (Job ID: c31617d7-eea9-4a4e-a1be-50c4c32a0bd1) from Async(active_storage_analysis) enqueued at 2020-09-10T20:56:34Z with arguments: #<GlobalID:0x00007f82b1340f68 @uri=#<URI::GID gid://restage-backend/ActiveStorage::Blob/29>>
    
  # NoMethodError (undefined method `new' for :DriveService:Symbol
  # Did you mean?  next):
    
  # app/models/piece.rb:19:in `upload_trailer'
  # app/controllers/pieces_controller.rb:21:in `create'
### Initial Setup ###
# require 'flickraw'

# FlickRaw.api_key="32e7f4723ea0a76638453cb8ec4deb86"
# FlickRaw.shared_secret="1c2d7fc93d8d5028"

# token = flickr.get_request_token
# auth_url = flickr.get_authorize_url(token['oauth_token'], :perms => 'delete')

# puts "Open this url in your process to complete the authication process : #{auth_url}"
# puts "Copy here the number given when you complete the process."
# verify = gets.strip

# begin
#   flickr.get_access_token(token['oauth_token'], token['oauth_token_secret'], verify)
#   login = flickr.test.login
#   puts "You are now authenticated as #{login.username} with token #{flickr.access_token} and secret #{flickr.access_secret}"
# rescue FlickRaw::FailedResponse => e
#   puts "Authentication failed : #{e.msg}"
# end


### Setup with Token and Secret ###
# require 'flickraw'

FlickRaw.api_key="32e7f4723ea0a76638453cb8ec4deb86"
FlickRaw.shared_secret="1c2d7fc93d8d5028"

flickr.access_token = "72157717712164697-1bdb5e3adab11047"
flickr.access_secret = "78785adc012b4a92"

# From here you are logged:
login = flickr.test.login
puts "You are now authenticated as #{login.username}"

def get_flickr_photos(album_id)
    flickr_object_arr = flickr.photosets.getPhotos(:photoset_id => album_id,:extras => 'url_o').photo
    flickr_object_arr.map{ |photo| 
        image_info = flickr.photos.getInfo :photo_id => photo.id, :secret => photo.secret
        {url: photo.url_o, title: image_info.title, description: image_info.description}
    }
end

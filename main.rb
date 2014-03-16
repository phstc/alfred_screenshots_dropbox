require 'net/http'
require 'json'

def wait_dropbox_sync(url, tolerance = 10)
  url = URI.parse(url)
  req = Net::HTTP.new(url.host, url.port)
  req.use_ssl = true
  tolerance.times do
    return true if req.request_head(url.path).code != '404'
    sleep 1
  end
  false
end

def bitly(url, user, key)
  return url if user.to_s.empty? || key.to_s.empty?

  url = URI.parse("https://api-ssl.bitly.com/v3/shorten?login=#{user}&apiKey=#{key}&longUrl=#{url}&format=txt")
  response = Net::HTTP.get_response(url)
  response.body
end

def generate_screenshot_filename
  # OSX Screenshot format: Screen Shot 2014-03-14 at 3.56.55 PM
  osx_screenshot_format = Time.now.strftime('Screen Shot %Y-%m-%d at %I.%M.%S %p')

  "#{osx_screenshot_format}.png"
end

config = JSON.parse(File.read('./config.json'))

DROPBOX_FOLDER      = config['dropbox_folder']
DROPBOX_USER        = config['dropbox_user']
SCREENSHOT_FILENAME = generate_screenshot_filename
DROPBOX_URL         = "https://dl.dropboxusercontent.com/u/#{DROPBOX_USER}/Screenshots/#{URI.escape(SCREENSHOT_FILENAME)}"
BITLY_USER          = config['bitly_user']
BITLY_KEY           = config['bitly_key']

Dir.mkdir(DROPBOX_FOLDER) unless Dir.exist?(DROPBOX_FOLDER)

`screencapture -i "#{DROPBOX_FOLDER}/#{SCREENSHOT_FILENAME}"`

wait_dropbox_sync(DROPBOX_URL)

puts bitly(DROPBOX_URL, BITLY_USER, BITLY_KEY)

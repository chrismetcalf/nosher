require "sinatra"
require "nokogiri"
require "open-uri"
require "youtube_it"
require "haml"

class Nosher < Sinatra::Base
  before do
    @youtube_client = YouTubeIt::Client.new(:username => ENV["YOUTUBE_USERNAME"],
                                            :password => ENV["YOUTUBE_PASSWORD"],
                                            :dev_key  => ENV["YOUTUBE_DEV_KEY"])
  end

  get "/" do
    redirect "http://github.com/chrismetcalf/nosher"
  end

  get "/add" do
    doc = Nokogiri::HTML(open(params[:url]))

    embeds = []
    doc.css("iframe").each do |iframe|
      matches = iframe.attr("src").match(/youtube\.com\/embed\/([A-Za-z0-9-]+)/)

      if !matches.nil?
        embeds << matches[1]
      end
    end

    @results = []
    embeds.each do |id|
      # Try and submit it to YouTube, and catch if it fails
      begin
        result = @youtube_client.add_video_to_watchlater(id)
        if result[:code] == 201
          @results << "Added #{id} to your YouTube queue"
        end
      rescue YouTubeIt::UploadError
        @results << "Video #{id} was already in your YouTube queue."
      end
    end

    if embeds.empty?
      @results << "No YouTube embeds were discovered"
    end

    haml :add
  end
end

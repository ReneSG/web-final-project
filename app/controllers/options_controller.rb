class OptionsController < ApplicationController
  def answer
    @option = Option.find(params[:id])
    @client = GooglePlaces::Client.new("AIzaSyBewVg-2JE4BAunjrxdhKU8ao8qnOLvuAc")
    @option_info = @client.spot(@option.place_id)
    min_photos = [5, @option_info.photos.count].min
    @photos = []
    (0..min_photos).each do |i|
      @photos << @option_info.photos[i].fetch_url(800)
    end
  end
end

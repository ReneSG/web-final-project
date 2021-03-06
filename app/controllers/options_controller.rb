class OptionsController < ApplicationController
  def answer
    @option = Option.find(params[:id])
    @client = GooglePlaces::Client.new("AIzaSyBewVg-2JE4BAunjrxdhKU8ao8qnOLvuAc")
    @option_info = @client.spot(@option.place_id)
    min_photos = [5, @option_info.photos.count].min
    @photos = []
    return if min_photos == 0
    (0..min_photos).each do |i|
      next if @option_info.photos[i].nil?
      @photos << @option_info.photos[i].fetch_url(800)
    end
  end

  def register_response
    @option = Option.find(params[:id])
    if params[:vote_yes] == "true"
      @option.positive_votes += 1
    else
      @option.positive_votes -= 1
    end

    if @option.save
      respond_to do |format|
        if Poll.has_next_option(@option)
          format.html { redirect_to option_answer_path(@option.poll.getNextOption(@option.id)) }
        else
          format.html { redirect_to root_path }
        end
      end
    else
      respond_to do |format|
        format.html { render root }
      end
    end
  end
end

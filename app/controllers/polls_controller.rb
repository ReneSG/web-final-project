class PollsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_poll, only: [:edit, :update, :destroy]

  # GET /polls
  # GET /polls.json
  def index
    @pending_polls = current_user.polls.where(status: "pending")
    @done_polls = current_user.polls.where(status: "done")
  end

  def my_polls
    @pending_polls = current_user.created_polls.where(status: "pending")
    @done_polls = current_user.created_polls.where(status: "done")
  end

  # GET /polls/1
  # GET /polls/1.json
  def show
    @poll = Poll.find(params[:id])
    @option = @poll.compute_winner
    @client = GooglePlaces::Client.new("AIzaSyBewVg-2JE4BAunjrxdhKU8ao8qnOLvuAc")
    @option_info = @client.spot(@option.place_id)
    min_photos = [5, @option_info.photos.count].min
    @photos = []
    return if min_photos == 0
    (0..min_photos).each do |i|
      @photos << @option_info.photos[i].fetch_url(800)
    end
  end

  # GET /polls/new
  def new
    @poll = current_user.polls.new
  end

  # GET /polls/1/edit
  def edit
  end

  # POST /polls
  # POST /polls.json
  def create
    @poll = Poll.new(poll_params)
    @poll.owner_id = current_user.id
    @poll.answer_count = 0
    @poll.status = "pending"
    @client = GooglePlaces::Client.new("AIzaSyBewVg-2JE4BAunjrxdhKU8ao8qnOLvuAc")
    params[:poll][:respondees].tr(' ', '').split(",").each do |email|
      user = User.find_by(email: email)
      if user
        @poll.users << user
      end
    end
    options = @client.spots_by_query(@poll.address, types: ['restaurant', 'food']).slice(0, 10)
    respond_to do |format|
      if @poll.save
        options.each do |option|
          @poll.options.create(name: option.name, positive_votes: 0, negative_votes: 0, place_id: option.reference)
        end
        format.html { redirect_to root_path, notice: 'Poll was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /polls/1
  # PATCH/PUT /polls/1.json
  def update
    respond_to do |format|
      if @poll.update(poll_params)
        format.html { redirect_to @poll, notice: 'Poll was successfully updated.' }
        format.json { render :show, status: :ok, location: @poll }
      else
        format.html { render :edit }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polls/1
  # DELETE /polls/1.json
  def destroy
    @poll.destroy
    respond_to do |format|
      format.html { redirect_to polls_url, notice: 'Poll was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def start
    @poll = Poll.find(params[:id])
    @poll.answer_count += 1
    @poll.save
    redirect_to option_answer_path(@poll.getNextOption)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_poll
    @poll = current_user.created_polls.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def poll_params
    params.require(:poll).permit(:name, :event_date, :address, :user_id)
  end
end

class OptionsController < ApplicationController
  def answer
    @option = Option.find(params[:id])
  end
end

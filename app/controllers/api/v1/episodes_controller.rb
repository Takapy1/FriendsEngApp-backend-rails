class Api::V1::EpisodesController < ApplicationController
  def index
    season_id = params[:season_id].to_i
    season = Season.find(season_id)
    @episodes = season.episodes.order(:id)
    render json: { status: "SUCCESS", data: @episode }
  end
  
  def show
    # @phrase = Phrase.new
    # @episode = Episode.find(params[:id])
    # @dialogues = @episode.dialogues
    # @phrases_json = get_phrases_json(@dialogues)
  end

  private

  def get_phrases_json(dialogues)
    phrases_list = {}
    dialogues.each do |dialogue|
      phrases_list[dialogue.id.to_s] = dialogue.phrases.to_a
    end
    phrases_list.to_json
  end
end

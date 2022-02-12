class Api::V1::WordsController < ApplicationController
  def show
    word = Word.find_by(line_id: params[:line_id], index_of_line: params[:index])
    if !word.nil?
      render json: word
    else
      render json: [], status:422
    end
  end

  def create
    word = Word.new(word_params)
    if word.save
      render json: word
    else
      render json: word.errors, status: 422
    end
  end

  def destroy

  end

  private
  def word_params
    params.require(:word).permit(:line_id, :index_of_line, :content, :meaning)
  end
end

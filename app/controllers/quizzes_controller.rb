class QuizzesController < ApplicationController
  def index
    @question = Question.first
  end
end
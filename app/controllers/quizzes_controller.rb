class QuizzesController < ApplicationController
  def index
    @question = Question.first
  end

  def new
    @question = Question.order('RANDOM()').first
  end
end
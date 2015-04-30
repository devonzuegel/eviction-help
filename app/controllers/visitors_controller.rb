class VisitorsController < ApplicationController
  def index
  end

  def start
    gon.questions = @questions = Question.all
  end
end
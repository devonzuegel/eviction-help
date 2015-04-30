class VisitorsController < ApplicationController
  steps :confirm_password, :confirm_profile, :find_friends

  def index
  end

  def start
    gon.questions = @questions = Question.all
  end
end
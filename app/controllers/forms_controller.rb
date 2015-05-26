class FormsController < ApplicationController
  before_filter :authenticate_user!
  require 'prawn'
  require 'pdf/toolkit'

  def answer
    if current_user.client
      answer_form = AnswerForm.new current_user
      output_file = answer_form.to_pdf
      send_file output_file, filename: answer_form.filename, 
                             type: "application/pdf", disposition: 'inline', target: '_blank'
    else
      redirect_to root_path
    end
  end

  private

end

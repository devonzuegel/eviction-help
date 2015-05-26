class FormsController < ApplicationController
  before_filter :authenticate_user!
  require 'prawn'
  require 'pdf/toolkit'

  def answer

    template_file = Rails.root.join('app', 'assets', 'pdfs', 'templates', 'ud105-blank.pdf').to_s
    prawn_file    = Rails.root.join('app', 'assets', 'pdfs', 'temp', 'temp.pdf').to_s
    output_file   = Rails.root.join('app', 'assets', 'pdfs', 'output', "ud105-#{current_user.email}.pdf").to_s

    Prawn::Document.generate(prawn_file) do
      # Generate whatever you want here.
      text_box "THIS IS SOME NEW TEXT!!!!!!!!!!!!", :at => [100, 600]
    end

    PDF::Toolkit.pdftk(prawn_file, "background", template_file, "output", output_file)

    send_file output_file, filename: 'output.pdf', :type => "application/pdf", disposition: 'inline'
  end
end

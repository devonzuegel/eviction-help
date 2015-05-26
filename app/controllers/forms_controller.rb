class FormsController < ApplicationController
  before_filter :authenticate_user!
  require 'prawn'
  require 'pdf/toolkit'
  include ActionView::Helpers::NumberHelper

  def answer
    if current_user.client
      template_file = Rails.root.join('app', 'assets', 'pdfs', 'templates', 'ud105-blank.pdf').to_s
      prawn_file    = Rails.root.join('app', 'assets', 'pdfs', 'temp', 'temp.pdf').to_s
      output_file   = Rails.root.join('app', 'assets', 'pdfs', 'output', "ud105-#{current_user.email}.pdf").to_s

      Prawn::Document.generate prawn_file do |p|
        p.font "Courier"
        p.text_box attorney_info, at: [4, 696], size: 9
        p.text_box attorney_fax_number, at: [228, 652], size: 9
        p.text_box attorney_email, at: [59, 643], size: 9
        p.text_box current_user.name, at: [76, 634], size: 9
      end

      PDF::Toolkit.pdftk(prawn_file, "background", template_file, "output", output_file)
      send_file output_file, filename: 'output.pdf', :type => "application/pdf", disposition: 'inline', target: '_blank'
    else
      redirect_to root_path
    end
  end

  private
    def attorney
      current_user.client.attorney
    end

    def attorney_info
      "#{attorney.user.name} (State Bar No. #{attorney.bar_number})\n" +
      "#{attorney.office_address}"
    end

    def attorney_fax_number
      number_to_phone(attorney.fax_number, area_code: true)
    end

    def attorney_email
      attorney.user.email
    end
end

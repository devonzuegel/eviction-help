class AnswerForm
  include ActionView::Helpers::NumberHelper
  attr_reader :template_01, :template_02, :prawn_file, :output_file

  delegate :attorney, to: :'@user.client'

  def initialize user
    @user = user
    @template_01 = pdf 'templates', 'ud105-blank-01.png'
    @template_02 = pdf 'templates', 'ud105-blank-02.png'
    @prawn_file    = pdf 'temp', 'temp.pdf'
    @output_file   = pdf 'output', filename
    @x_coord       = 35
    @y_coord       = 88
  end

  def to_pdf
    pdf = Prawn::Document.new(margin: 0, page_size: 'A4', skip_page_creation: true)

    first_page pdf
    pdf.start_new_page
      pdf.image @template_02, width: pdf.bounds.width + 15

    pdf.render_file(@output_file)
    return output_file
  end

  def filename
    name = @user.name.parameterize
    date = DateTime.now.getutc
    "ud105-#{name}-#{date}.pdf"
  end

  private
    def first_page pdf
      pdf.start_new_page
      pdf.image template_01, width: pdf.bounds.width + 15
      pdf.font "Courier"
      attorney_box pdf
      court_box pdf
      plaintiff_defendant_box pdf
      part_2 pdf
      part_3 pdf
    end

    def attorney_box pdf
      pdf.fill_color "0000cc"
      pdf.text_box attorney_info, at: [4 + @x_coord, 696 + @y_coord], size: 9
      pdf.text_box 'n/a', at: [60 + @x_coord, 653 + @y_coord], size: 9
      pdf.text_box number_to_phone(attorney.fax_number, area_code: true), at: [228 + @x_coord, 653 + @y_coord], size: 9
      pdf.text_box attorney.user.email, at: [60 + @x_coord, 643 + @y_coord], size: 9
      pdf.text_box @user.name, at: [78 + @x_coord, 634 + @y_coord], size: 9
    end

    def attorney_info
      "#{attorney.user.name} (State Bar No. #{attorney.bar_number})\n" +
      "#{attorney.office_address}"
    end

    def court_box pdf
      court = Court.first
      pdf.text_box court.county, at: [200 + @x_coord, 619 + @y_coord], size: 9
      pdf.text_box court.street_address, at: [66 + @x_coord, 608 + @y_coord], size: 9
      pdf.text_box court.mailing_address, at: [66 + @x_coord, 598 + @y_coord], size: 9
      pdf.text_box "#{court.city}, CA #{court.zip_code}", at: [66 + @x_coord, 588 + @y_coord], size: 9
      pdf.text_box court.branch_name, at: [66 + @x_coord, 578 + @y_coord], size: 9
    end

    def plaintiff_defendant_box pdf
      pdf.text_box @user.client.landlord, at: [66 + @x_coord, 559 + @y_coord], size: 9
      pdf.text_box @user.name, at: [66 + @x_coord, 549 + @y_coord], size: 9
    end

    def part_2 pdf
      pdf.text_box 'X', at: [36 + @x_coord, 402 + @y_coord], size: 11
      defense_ids = @user.defenses.map { |d| d.id }.join(', ')
      pdf.text_box defense_ids.to_s, at: [80 + @x_coord, 362 + @y_coord], size: 11
    end

    def part_3 pdf
      pdf.text_box 'X', at: [36 + @x_coord, 247 + @y_coord], size: 11 unless @user.defenses.empty?
      pdf.text_box 'X', at: [36 + @x_coord, 210 + @y_coord], size: 11 if @user.client[:offered_rent_before_deadline]
    end

    def pdf *args
      pdf_directory.join(*args).to_s
    end

    def pdf_directory
      Rails.root.join('app', 'assets', 'pdfs')
    end
end
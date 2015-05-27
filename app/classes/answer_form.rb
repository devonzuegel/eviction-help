class AnswerForm
  include ActionView::Helpers::NumberHelper
  attr_reader :template_file
  attr_reader :prawn_file
  attr_reader :output_file

  delegate :attorney, to: :'@user.client'

  def initialize(user)
    @user = user
    @template_file = pdf 'templates', 'ud105-blank.pdf'
    @prawn_file    = pdf 'temp', 'temp.pdf'
    @output_file   = pdf 'output', filename
  end

  def to_pdf
    Prawn::Document.generate prawn_file do |pdf|
      pdf.font "Courier"
      attorney_box pdf
      court_box pdf
      plaintiff_defendant_box pdf
      part_2 pdf
      part_3 pdf
    end

    PDF::Toolkit.pdftk(prawn_file, "background", template_file, "output", output_file)
    
    output_file
  end

  def filename
    name = @user.name.parameterize
    date = DateTime.now.getutc
    "ud105-#{name}-#{date}.pdf"
  end

  private
    def attorney_box(pdf)
       pdf.fill_color "0000cc"
      pdf.text_box attorney_info, at: [4, 696], size: 9
      pdf.text_box 'n/a', at: [60, 653], size: 9
      pdf.text_box number_to_phone(attorney.fax_number, area_code: true), at: [228, 653], size: 9
      pdf.text_box attorney.user.email, at: [60, 643], size: 9
      pdf.text_box @user.name, at: [78, 634], size: 9
    end

    def attorney_info
      "#{attorney.user.name} (State Bar No. #{attorney.bar_number})\n" +
      "#{attorney.office_address}"
    end

    def court_box(pdf)
      court = Court.first
      pdf.text_box court.county, at: [200, 619], size: 9
      pdf.text_box court.street_address, at: [66, 608], size: 9
      pdf.text_box court.mailing_address, at: [66, 598], size: 9
      pdf.text_box "#{court.city}, CA #{court.zip_code}", at: [66, 588], size: 9
      pdf.text_box court.branch_name, at: [66, 578], size: 9
    end

    def plaintiff_defendant_box(pdf)
      pdf.text_box @user.client.landlord, at: [66, 559], size: 9
      pdf.text_box @user.name, at: [66, 549], size: 9
    end

    def part_2(pdf)
      pdf.text_box 'X', at: [36, 402], size: 11
      defense_ids = @user.defenses.map { |d| d.id }.join(', ')
      pdf.text_box defense_ids.to_s, at: [80, 362], size: 11
    end

    def part_3(pdf)
      pdf.text_box 'X', at: [36, 247], size: 11 unless @user.defenses.empty?
      pdf.text_box 'X', at: [36, 210], size: 11 if @user.client[:offered_rent_before_deadline]
    end

    def pdf(*args)
      pdf_directory.join(*args).to_s
    end

    def pdf_directory
      Rails.root.join('app', 'assets', 'pdfs')
    end
end
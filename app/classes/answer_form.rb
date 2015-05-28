class AnswerForm
  include ActionView::Helpers::NumberHelper
  attr_reader :output_file, :pages, :coords
  delegate :attorney, to: :'@user.client'

  def initialize user
    @user = user
    @pages = [ { template:  pdf_file('templates', 'ud105-blank-01.png'), },
               { template:  pdf_file('templates', 'ud105-blank-02.png'), },
               { template:  pdf_file('templates', 'mc025.png'), } ]
    @output_file   = pdf_file 'output', filename
    @coords = { x: 35, y: 88 }
  end

  def to_pdf
    pdf = Prawn::Document.new(margin: 0, page_size: 'A4', skip_page_creation: true)

    page_0 pdf
    page_1 pdf
    page_2 pdf

    pdf.render_file(@output_file)
    return output_file
  end

  def filename
    name = @user.name.parameterize
    date = Time.now.to_i
    "ud105-#{name}-#{date}.pdf"
  end

  private
    def page_0 pdf
      pdf.start_new_page
      pdf.image pages[0][:template], width: pdf.bounds.width + 15
      pdf.font "Courier"
      pdf.fill_color "0000cc"
      attorney_box pdf
      court_box pdf
      plaintiff_defendant_box pdf
      part_2 pdf
      part_3 pdf
    end

    def attorney_box pdf
      pdf.text_box attorney_info, at: [4 + coords[:x], 696 + coords[:y]], size: 9
      pdf.text_box 'n/a', at: [60 + coords[:x], 653 + coords[:y]], size: 9
      pdf.text_box number_to_phone(attorney.fax_number, area_code: true), at: [228 + coords[:x], 653 + coords[:y]], size: 9
      pdf.text_box attorney.user.email, at: [60 + coords[:x], 643 + coords[:y]], size: 9
      pdf.text_box @user.name, at: [78 + coords[:x], 634 + coords[:y]], size: 9
    end

    def attorney_info
      "#{attorney.user.name} (State Bar No. #{attorney.bar_number})\n" +
      "#{attorney.office_address}"
    end

    def court_box pdf
      court = Court.first
      pdf.text_box court.county, at: [200 + coords[:x], 619 + coords[:y]], size: 9
      pdf.text_box court.street_address, at: [66 + coords[:x], 608 + coords[:y]], size: 9
      pdf.text_box court.mailing_address, at: [66 + coords[:x], 598 + coords[:y]], size: 9
      pdf.text_box "#{court.city}, CA #{court.zip_code}", at: [66 + coords[:x], 588 + coords[:y]], size: 9
      pdf.text_box court.branch_name, at: [66 + coords[:x], 578 + coords[:y]], size: 9
    end

    def plaintiff_defendant_box pdf
      pdf.text_box @user.client.landlord, at: [66 + coords[:x], 559 + coords[:y]], size: 9
      pdf.text_box @user.name, at: [66 + coords[:x], 549 + coords[:y]], size: 9
    end

    def part_2 pdf
      pdf.text_box 'X', at: [36 + coords[:x], 402 + coords[:y]], size: 11
      defense_ids = @user.defenses.map { |d| d.id }.join(', ')
      pdf.text_box defense_ids.to_s, at: [80 + coords[:x], 362 + coords[:y]], size: 11
    end

    def part_3 pdf
      pdf.text_box 'X', at: [36 + coords[:x], 247 + coords[:y]], size: 11 unless @user.defenses.empty?
      pdf.text_box 'X', at: [36 + coords[:x], 210 + coords[:y]], size: 11 if @user.client[:offered_rent_before_deadline]
    end

    def page_1 pdf
      pdf.start_new_page
      pdf.image pages[1][:template], width: pdf.bounds.width + 15
      pdf.text_box "X", at: [36 + coords[:x], 628 + coords[:y]], size: 9
      pdf.text_box @user.name, at: [5 + coords[:x], 164 + coords[:y]], size: 12
    end

    def page_2 pdf
      pdf.start_new_page
      pdf.image pages[2][:template], width: pdf.bounds.width + 15
    end

    def pdf_file *args
      pdf_directory.join(*args).to_s
    end

    def pdf_directory
      Rails.root.join('app', 'assets', 'pdfs')
    end
end
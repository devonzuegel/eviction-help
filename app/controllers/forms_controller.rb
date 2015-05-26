class FormsController < ApplicationController
  before_filter :authenticate_user!
  require 'prawn'
  require 'pdf/toolkit'

  def answer

    template_file = 'app/assets/pdfs/templates/ud105-blank.pdf'
    prawn_file = 'app/assets/pdfs/temp/temp.pdf'
    output_file = 'app/assets/pdfs/output/output.pdf'

    Prawn::Document.generate(prawn_file) do
      # Generate whatever you want here.
      text_box "This is some new text!", :at => [100, 300]
    end

    PDF::Toolkit.pdftk(prawn_file, "background", template_file, "output", output_file)


    # filename = "#{Prawn::DATADIR}/pdfs/multipage_template.pdf"
    # Prawn::Document.generate("full_template.pdf", :template => filename) do
    #   text "THis content is written on the first page of the template", :align => :center
    # end

    # # adjust the pdftk path to suit your pdftk installation
    # # add :data_format => 'XFdf' option to generate XFDF instead of FDF when
    # # filling a form (XFDF is supposed to have better support for non-western
    # # encodings)
    # # add :utf8_fields => true in order to get UTF8 encoded field metadata (this
    # # will use dump_data_fields_utf8 instead of dump_data_fields in the call to
    # # pdftk)
    # pdftk = PdfForms.new('/usr/local/bin/pdftk')

    # # find out the field names that are present in form.pdf
    # @field_names = pdftk.get_field_names 'app/assets/pdfs/test.pdf'

    # # take form.pdf, set the 'foo' field to 'bar' and save the document to myform.pdf
    # pdftk.fill_form '/path/to/form.pdf', 'myform.pdf', :foo => 'bar'

    # # optionally, add the :flatten option to prevent editing of a filled out form
    # pdftk.fill_form '/path/to/form.pdf', 'myform.pdf', {:foo => 'bar'}, :flatten => true

  end
end

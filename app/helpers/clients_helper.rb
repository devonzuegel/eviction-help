module ClientsHelper
  CLIENT_FIELDS = {
      telephone:                    { type: 'text_field',   name: '' },
      street_address:               { type: 'text_field',   name: 'Home address' },
      mailing_address:              { type: 'text_field',   name: '', details: 'Possibly the same as your home address' },
      landlord:                     { type: 'text_field',   name: 'Your landlord' },
      other_people:                 { type: 'text_field',   name: 'Other people living in the house' },
      asked_for_repairs:            { type: 'check_box',    name: 'Have you asked your landlord to make repairs to fix this issue?' },
      repairs_made:                 { type: 'check_box',    name: 'Has your landlord made the repairs you requested?' },
      further_information:          { type: 'text_area',    name: 'Include any further details here.' },
      offered_rent_before_deadline: { type: 'check_box',    name: 'Did you offer to pay your rent before the deadline?' },
      offered_rent_date:            { type: 'date_field',   name: 'If so, when did you offer to pay the rent?' },
      offered_rent_amount:          { type: 'number_field', name: 'If so, how much did you offer to pay?' },
      offered_rent_method:          { type: 'text_field',   name: 'If so, how did you offer the rent?', details: '(In writing, by email, oral statement, etc.)' },
      defenses:                     { },
      other_problems:               { type: 'text_area',    name: 'Other problems with the house' },
    }


  def client_fields
    @client_fields ||= CLIENT_FIELDS.map do |key, values|
      field = OpenStruct.new values.reverse_merge(type:'text_field', name: '', details: '')
      [key, field]
    end.to_h
  end


  def client_field_name(field, &blk)
    # client_fields.fetch(:telephone).fetch(:name, &blk) || field.humanize
  end


  def name_for(field)
    client_field_for(field).name
  end

  def attorney_id(client)
    if client.attorney != nil
      client.attorney.id
    else
      nil
    end
  end
end

module ClientsHelper
  CLIENT_FIELDS = {
      telephone:                    { type: 'text_field',   name: '' },
      street_address:               { type: 'text_field',   name: 'Home address' },
      mailing_address:              { type: 'text_field',   name: '', details: 'Possibly the same as your home address' },
      attorney:                     { },
      landlord:                     { type: 'text_field',   name: 'Your landlord' },
      other_people:                 { type: 'text_field',   name: 'Please list anybody else who lives with you in the property.' },
      # ---------------------------------------------------------------------------------
      condition_of_property:        { type: :header,        name: 'Condition of Property' },
      defenses:                     { },
      asked_for_repairs:            { type: 'check_box',    name: 'Did you ask the landlord or building attendant to make repairs?' },
      repairs_made:                 { type: 'check_box',    name: 'Were repairs made?' },
      further_information:          { type: 'text_area',    name: 'Include any further details here.' },
      # ---------------------------------------------------------------------------------
      payment_of_rent:              { type: :header,        name: 'Payment of Rent' },
      offered_rent_before_deadline: { type: 'check_box',    name: 'Did you offer to pay rent before the due date provided by the landlord?' },
      offered_rent_date:            { type: 'date_field',   name: 'When did you offer?' },
      offered_rent_amount:          { type: 'number_field', name: 'How much did you offer?' },
      offered_rent_method:          { type: 'text_field',   name: 'If so, how did you offer the rent?', details: '(In writing, by email, oral statement, etc.)' },
      # ---------------------------------------------------------------------------------
      other:                        { type: :header,        name: 'Other' },
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

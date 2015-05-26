class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create

    super do |resource|
      if params['user_type'] == "client"
        client = Client.create(user_id: resource.id)
      elsif params['user_type'] == "attorney"
        attorney = Attorney.create(user_id: resource.id)
      end      
    end

  end

  # GET /resource/edit
  def edit
    @all_defenses = Defense.all
    @attorneys = Attorney.all
    super
  end

  # PUT /resource
  def update
    super do |resource|
      defense_ids = params.fetch(:defense_ids, [])
      resource.defenses = Defense.where(id: defense_ids)
      puts "\n\n\n-----------------"
      pp params
      puts "-----------------\n\n\n"
      # resource.client.attorney = Attorney.find(params[:attorney].to_i)
      # resource.client.save
    end

  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

    # You can put the params you want to permit in the empty array.
    # def configure_sign_up_params
    #   devise_parameter_sanitizer.for(:sign_up) << :attribute
    # end

    # You can put the params you want to permit in the empty array.
    # def configure_account_update_params
    #   devise_parameter_sanitizer.for(:account_update) << :attribute
    # end

    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end

    def update_resource(resource, params)
      resource.update_without_password(params)
    end


    # The path used after sign up.
    def after_sign_up_path_for(resource)
      edit_registration_path(resource)
    end

    def after_update_path_for(resource)
      user_path(resource)
    end

  private

    def sign_up_params
      params.require(:user).permit( :name, :email, :password,  
                                    :password_confirmation )
    end

    def account_update_params
      params.require(:user)
            .permit( :name, :email, :password, 
                     :password_confirmation, :current_password,
                     client_attributes: [ 
                         :telephone, :street_address,
                         :mailing_address, :landlord,
                         :other_people, :other_problems, 
                         :asked_for_repairs, :repairs_made, 
                         :further_information, :offered_rent_before_deadline, 
                         :offered_rent_date, :offered_rent_amount, 
                         :offered_rent_method,
                         :attorney_id
                     ], attorney_attributes: [
                         :office_address, :fax_number,
                         :bar_number
                     ],
                     defenses_attributes: [:description, :id]
                     )
    end
end

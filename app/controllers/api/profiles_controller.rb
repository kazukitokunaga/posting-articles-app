class Api::ProfilesController < ApplicationController
  def index
    @profile = Profile.where(user_id: current_user.id).last

    unless @profile
      @profile          = Profile.new
      @profile.address  = Address.new
      @profile.domicile = Address.new
    end
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    unless @profile.save
      @profile.errors.full_messages

      render "api/shared/error", format: [:json], handler: [:jbuilder]
    end
  end

  def update
    @profile = Profile.find(params[:id])
    unless @profile.update(profile_params)
      @errors = @profile.errors.full_messages

      render "api/shared/error", format: [:json], handler: [:jbuilder]
    end
  end

  def profile_params
    params.require(:profile).permit(
      :family_name,
      :family_name_kana,
      :first_name,
      :first_name_kana,
      :birth_date,
      :gender,
      :phone,
      :blood_type,
      addresses_attributes: [
        :id,
        :profile_ie,
        :postal_code,
        :address_kana,
        :address,
        :building,
      ],
      domiciles_attributes: [
        :id,
        :profile_id,
        :postal_code,
        :address_kana,
        :address,
        :building,
      ],
    )
  end
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @restaurants = policy_scope(Restaurant).geocoded
    @gyms = policy_scope(Gym).geocoded
    @mixed = @gyms + @restaurants
    @markers = @mixed.map do |mix|
      {
        lat: mix.latitude,
        lng: mix.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { mix: mix }),
        image_url:
        if @gyms.include? mix
          helpers.asset_url('logofinal_colour_marker.png')
        else
          helpers.asset_url('fork&knife_colour.png')
        end
      }
    end
  end

  def user_dashboard
  end

  def dietary_requirements
    if current_user.owner
      redirect_to :root
    end
  end

  def create_dietary
    current_user.dietary_requirements = params[:user][:dietary_requirements]
    current_user.save!
    redirect_to :root
  end

end

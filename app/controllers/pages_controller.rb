class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
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

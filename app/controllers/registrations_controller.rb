class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if resource.owner == false
      '/dietary_requirements'
    else
      :root
    end
  end
end

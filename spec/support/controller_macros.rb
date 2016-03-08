module ControllerMacros
  def login_as(user)
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in(user)
  end
end

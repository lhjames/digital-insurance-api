module ControllerHelpers
  def login_as(user)
    user = FactoryBot.create(:user)
    login_as(user)
  end
end
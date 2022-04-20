# frozen_string_literal: true

module ControllerHelpers
  def login_as(user)
    user = FactoryBot.create(:user)
    login_as(user)
  end
end

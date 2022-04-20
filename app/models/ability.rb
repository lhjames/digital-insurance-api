# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    @user ||= User.new
    admin_autorisations if @user.role == "admin"
    customer_autorisations if @user.role == "customer"
  end

  private

  def admin_autorisations
    can :manage, Customer
    can :manage, Contract
  end

  def customer_autorisations
    can :read, Contract
    can :edit, Contract
    can :update, Contract
    can :delete, Contract
  end
end
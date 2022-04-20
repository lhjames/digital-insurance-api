# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(_user)
    @user = User.new
    admin_autorisations if @user.role == 'admin'
    customer_autorisations if @user.role == 'customer'
  end

  private

  def admin_autorisations
    can :manage, Customer
    can :create, Contract
    can :delete, Contract
  end

  def customer_autorisations
    can :read, Contract
    can :edit, Contract
    can :update, Contract
    can :delete, Contract
  end
end

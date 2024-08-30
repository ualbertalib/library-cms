# frozen_string_literal: true

class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :registerable, :timeoutable, and :omniauthable
  devise :invitable, :database_authenticatable,
    :recoverable, :rememberable, :trackable, :validatable
end

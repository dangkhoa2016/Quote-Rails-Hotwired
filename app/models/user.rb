class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable,
         :database_authenticatable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :company, presence: true
  belongs_to :company
  validates :password, presence: true, length: { minimum: 6 }, if: :should_validate_password?

  def should_validate_password?
    new_record? || password.present?
  end

  def user_name
    email.split('@').first.capitalize
  end

  def full_name
    [first_name, last_name].compact.join(' ').capitalize
  end
end

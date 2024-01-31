class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable,
         :database_authenticatable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :company, presence: true
  belongs_to :company

  def user_name
    email.split('@').first.capitalize
  end

  def full_name
    [first_name, last_name].compact.join(' ').capitalize
  end
end

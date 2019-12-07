class User < ApplicationRecord
  # Direct associations

  has_many   :sessions,
             :foreign_key => "therapist_id",
             :dependent => :destroy

  has_many   :patients,
             :foreign_key => "therapist_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

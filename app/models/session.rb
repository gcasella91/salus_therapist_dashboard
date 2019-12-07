class Session < ApplicationRecord
  # Direct associations

  belongs_to :patient

  belongs_to :therapist,
             :class_name => "User"

  # Indirect associations

  # Validations

end

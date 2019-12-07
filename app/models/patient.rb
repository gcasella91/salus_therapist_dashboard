class Patient < ApplicationRecord
  # Direct associations

  belongs_to :therapist,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end

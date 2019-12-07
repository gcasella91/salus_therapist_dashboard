class Patient < ApplicationRecord
  # Direct associations

  has_many   :sessions,
             :dependent => :destroy

  belongs_to :therapist,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end

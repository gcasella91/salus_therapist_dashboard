require 'rails_helper'

RSpec.describe Patient, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:therapist) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end

class PatientsController < ApplicationController
  before_action :current_user_must_be_patient_therapist, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_patient_therapist
    patient = Patient.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == patient.therapist
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @patients = Patient.all

    render("patient_templates/index.html.erb")
  end

  def show
    @session = Session.new
    @patient = Patient.find(params.fetch("id_to_display"))

    render("patient_templates/show.html.erb")
  end

  def new_form
    @patient = Patient.new

    render("patient_templates/new_form.html.erb")
  end

  def create_row
    @patient = Patient.new

    @patient.patient_name = params.fetch("patient_name")
    @patient.patient_email = params.fetch("patient_email")
    @patient.therapist_id = params.fetch("therapist_id")

    if @patient.valid?
      @patient.save

      redirect_back(:fallback_location => "/patients", :notice => "Patient created successfully.")
    else
      render("patient_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @patient = Patient.find(params.fetch("prefill_with_id"))

    render("patient_templates/edit_form.html.erb")
  end

  def update_row
    @patient = Patient.find(params.fetch("id_to_modify"))

    @patient.patient_name = params.fetch("patient_name")
    @patient.patient_email = params.fetch("patient_email")
    

    if @patient.valid?
      @patient.save

      redirect_to("/patients/#{@patient.id}", :notice => "Patient updated successfully.")
    else
      render("patient_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_therapist
    @patient = Patient.find(params.fetch("id_to_remove"))

    @patient.destroy

    redirect_to("/users/#{@patient.therapist_id}", notice: "Patient deleted successfully.")
  end

  def destroy_row
    @patient = Patient.find(params.fetch("id_to_remove"))

    @patient.destroy

    redirect_to("/patients", :notice => "Patient deleted successfully.")
  end
end

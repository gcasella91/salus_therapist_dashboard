class SessionsController < ApplicationController
  def index
    @sessions = Session.all

    render("session_templates/index.html.erb")
  end

  def show
    @session = Session.find(params.fetch("id_to_display"))

    render("session_templates/show.html.erb")
  end

  def new_form
    @session = Session.new

    render("session_templates/new_form.html.erb")
  end

  def create_row
    @session = Session.new

    @session.therapist_id = params.fetch("therapist_id")
    @session.patient_id = params.fetch("patient_id")
    @session.date = params.fetch("date")
    @session.notes = params.fetch("notes")
    @session.price = params.fetch("price")

    if @session.valid?
      @session.save

      redirect_back(:fallback_location => "/sessions", :notice => "Session created successfully.")
    else
      render("session_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_patient
    @session = Session.new

    @session.therapist_id = params.fetch("therapist_id")
    @session.patient_id = params.fetch("patient_id")
    @session.date = params.fetch("date")
    @session.notes = params.fetch("notes")
    @session.price = params.fetch("price")

    if @session.valid?
      @session.save

      redirect_to("/patients/#{@session.patient_id}", notice: "Session created successfully.")
    else
      render("session_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @session = Session.find(params.fetch("prefill_with_id"))

    render("session_templates/edit_form.html.erb")
  end

  def update_row
    @session = Session.find(params.fetch("id_to_modify"))

    
    @session.patient_id = params.fetch("patient_id")
    @session.date = params.fetch("date")
    @session.notes = params.fetch("notes")
    @session.price = params.fetch("price")

    if @session.valid?
      @session.save

      redirect_to("/sessions/#{@session.id}", :notice => "Session updated successfully.")
    else
      render("session_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_therapist
    @session = Session.find(params.fetch("id_to_remove"))

    @session.destroy

    redirect_to("/users/#{@session.therapist_id}", notice: "Session deleted successfully.")
  end

  def destroy_row_from_patient
    @session = Session.find(params.fetch("id_to_remove"))

    @session.destroy

    redirect_to("/patients/#{@session.patient_id}", notice: "Session deleted successfully.")
  end

  def destroy_row
    @session = Session.find(params.fetch("id_to_remove"))

    @session.destroy

    redirect_to("/sessions", :notice => "Session deleted successfully.")
  end
end

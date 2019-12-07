Rails.application.routes.draw do
  root :to => "patients#index"
  # Routes for the Session resource:

  # CREATE
  get("/sessions/new", { :controller => "sessions", :action => "new_form" })
  post("/create_session", { :controller => "sessions", :action => "create_row" })

  # READ
  get("/sessions", { :controller => "sessions", :action => "index" })
  get("/sessions/:id_to_display", { :controller => "sessions", :action => "show" })

  # UPDATE
  get("/sessions/:prefill_with_id/edit", { :controller => "sessions", :action => "edit_form" })
  post("/update_session/:id_to_modify", { :controller => "sessions", :action => "update_row" })

  # DELETE
  get("/delete_session/:id_to_remove", { :controller => "sessions", :action => "destroy_row" })

  #------------------------------

  # Routes for the Patient resource:

  # CREATE
  get("/patients/new", { :controller => "patients", :action => "new_form" })
  post("/create_patient", { :controller => "patients", :action => "create_row" })

  # READ
  get("/patients", { :controller => "patients", :action => "index" })
  get("/patients/:id_to_display", { :controller => "patients", :action => "show" })

  # UPDATE
  get("/patients/:prefill_with_id/edit", { :controller => "patients", :action => "edit_form" })
  post("/update_patient/:id_to_modify", { :controller => "patients", :action => "update_row" })

  # DELETE
  get("/delete_patient/:id_to_remove", { :controller => "patients", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

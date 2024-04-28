Rails.application.routes.draw do
  root 'courses#index'  # Simplified root route

  #------------------------------
  # Department routes

  get '/departments', to: 'departments#index'
  get '/departments/:id', to: 'departments#show'
  post '/insert_department', to: 'departments#create'
  post '/modify_department/:id', to: 'departments#update', as: 'modify_department'
  get '/delete_department/:id', to: 'departments#delete', as: 'delete_department'

  #------------------------------
  # Course routes

  get '/courses', to: 'courses#index'
  get '/courses/:id', to: 'courses#show', as: 'course'
  post '/insert_course', to: 'courses#create'  # Handling the creation after form submission
  post '/modify_course/:id', to: 'courses#update'
  get '/delete_course/:id', to: 'courses#delete'

  #------------------------------
  # Student routes

  get '/students', to: 'students#index'
  get '/students/:id', to: 'students#show'
  post '/insert_student', to: 'students#create'
  post '/modify_student/:id', to: 'students#update'
  get '/delete_student/:id', to: 'students#delete'

  #------------------------------
  # Enrollment routes

  post '/insert_enrollment', to: 'enrollments#create'

end

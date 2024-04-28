class CoursesController < ApplicationController
  def index
    @courses = Course.order(created_at: :desc)
    render template: "courses/index"
  end

  def show
    the_id = params[:id]  # Corrected parameter name to match the routing
    @course = Course.find_by(id: the_id)  # Simplified query method

    render template: "courses/show"
  end

  def create
   
      c = Course.new
      c.title = params.fetch("query_title")
      
      c.term_offered = params.fetch("query_term_offered")
     
    
  
      c.save
  
      redirect_to("/courses")
  
      # Retrieve the user's inputs from params
      # Create a record in the movie table
      # Populate each column with the user input
      # Save
  
      
  end
   
 

  def update
    
      the_id = params.fetch("id")
      course = Course.find_by({ :id => the_id })
      update_params = {
        title: params[:query_title],
        term: params[:query_term],
        department: params[:query_department]
      }.compact_blank
      course.update(update_params)
      redirect_to("/courses/#{the_id}")
  end 
     
     
 
    

  def delete
    the_id = params[:id]  # Corrected parameter name to match the routing
    course = Course.find_by(id: the_id)

    course.destroy
    redirect_to("/courses")
  end
end 

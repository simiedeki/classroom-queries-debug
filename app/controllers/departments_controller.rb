class DepartmentsController < ApplicationController
  def index
    @departments = Department.all.order({ :created_at => :desc })

    render({ :template => "departments/index" })
  end

  def show
    the_id = params.fetch("id")
    @department=Department.find_by(id: the_id)
    render template: "departments/show"
    
  


  end

  def create
  
    d = Department.new
    d.name = params.fetch("query_name")
   
  

    d.save
   
  end

  def update
    the_id = params.fetch("id")
    department = @Department.where({ :id => the_id }).at(0)

    department.name = params.fetch("query_name")

    if @department.valid?
      @department.save
      redirect_to("/departments/#{department.id}", { :notice => "Department updated successfully."} )
    else
      redirect_to("/departments/#{department.id}", { :alert => "Department failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id")
    @department = Department.where({ :id => the_id }).at(0)

    @department.destroy

    redirect_to("/departments", { :notice => "Department deleted successfully."} )
  end
end

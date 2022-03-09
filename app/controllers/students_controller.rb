class StudentsController < ApplicationController
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
  end

  def create
    @student = Student.new
    @student.first_name = params[:first_name]
    @student.last_name = params[:last_name]
    @student.save
    
    # @student = Student.create(
    #   {  
    #   first_name: params[:first_name],
    #   last_name: params[:last_name]}

    # )
    redirect_to student_path(@student)
  end

end

#lab tests want the form field entries to be collected as a top level params hash (no nesting)
#alternate solution FORM without nesting:
# 1.
# e.g. FORM name="student[first_name]" requires CONTROLLER Student.create(first_name: params[:student][:first_name], last_name: params[:student][:last_name])

# <h3>Student Form</h3>
# <%= form_tag students_path do %>
#   <label>Student First Name:</label><br>
#   <input type="text" id="student_first_name" name="student[first_name]"><br>

#   <label>Student Last Name:</label><br>
#   <input type="text" id="student_last_name" name="student[last_name]"><br>

#   <%= hidden_field_tag :authenticity_token, form_authenticity_token %>
#   <input type="submit" value="Submit Student">
# <% end %>

# WITH nesting
# 2.
# <%= form_tag students_path do %>
#   <label>First Name:</label><br>
#   <%= text_field_tag :first_name %><br>

#   <label>Last Name:</label><br>
#   <%= text_field_tag :last_name %><br>

#   <%= hidden_field_tag :authenticity_token, form_authenticity_token %>
#   <%= submit_tag "Submit Student" %>
# <% end %>
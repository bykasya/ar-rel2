  require "sinatra"
  require "sinatra/reloader"
  require "sinatra/activerecord"
  set :database, { adapter: "sqlite3", database: "mydb.db" }
  require "./models/student"
  require "./models/college_class"
  require "./models/student_class"

  get "/" do
   @students=Student.all
   erb :student_list
  end

  get "/details/:id" do
   @student=Student.find(params[:id])
   erb :student_details
  end

  # post "/details/:id" do
  #  @student=Student.find(params[:id])
  #  erb :student_details
  # end

  get "/which_class" do
   @classes=CollegeClass.all
   erb :find_class
  end

  post "/this_class" do
   @class=CollegeClass.find_by(name: params[:name])
   @students=StudentClass.where(college_class_id: @class.id)
   erb :class_details
  end

  get "/this_class/:name" do
   @class=CollegeClass.find_by(name: params[:name])
   @students=StudentClass.where(college_class_id: @class.id)
   erb :class_details
  end

  
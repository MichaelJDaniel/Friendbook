class PeopleController < ApplicationController
  before_action :set_person, except: [:index, :new, :create]
  
  def index
    @people = Person.all
  end

  def show
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to people_path
    else
      render :new
    end 
  end

  def edit
  end

  def update
    if @person.update(person_params)
      redirect_to people_path
    else
      render :edit
    end
  end

  def destroy
    @person.destroy
    redirect_to people_path
  end


private 
  def person_params
    params.require(:person).permit(:first_name, :last_name, :avatar, :phone, :email)
  end

  def set_person
    @person = Person.find(params[:id])
  end



end



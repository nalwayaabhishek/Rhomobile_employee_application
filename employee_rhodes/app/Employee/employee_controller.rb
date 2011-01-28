require 'rho/rhocontroller'
require 'helpers/browser_helper'

class EmployeeController < Rho::RhoController
  include BrowserHelper

  #GET /Employee
  def index
    @employees = Employee.find(:all)
    render
  end

  # GET /Employee/{1}
  def show
    @employee = Employee.find(@params['id'])
    if @employee
      render :action => :show
    else
      redirect :action => :index
    end
  end

  # GET /Employee/new
  def new
    @employee = Employee.new
    render :action => :new
  end

  # GET /Employee/{1}/edit
  def edit
    @employee = Employee.find(@params['id'])
    if @employee
      render :action => :edit
    else
      redirect :action => :index
    end
  end

  # POST /Employee/create
  def create
    @employee = Employee.create(@params['employee'])
    redirect :action => :index
  end

  # POST /Employee/{1}/update
  def update
    @employee = Employee.find(@params['id'])
    @employee.update_attributes(@params['employee']) if @employee
    redirect :action => :index
  end

  # POST /Employee/{1}/delete
  def delete
    @employee = Employee.find(@params['id'])
    @employee.destroy if @employee
    redirect :action => :index
  end
end

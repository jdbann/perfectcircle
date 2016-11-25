class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @projects = []
    @past_projects = []

    Project.all.order(expiry_date: :desc).each do |project|
      if project.expiry_date >= DateTime.now
        @projects << project
      else
        @past_projects << project
      end
    end
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: "Project was successfully created."
    else
      render action: "new"
    end
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Project was successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(
      :title, :body, :location, :project_date, :expiry_date, :extended
    )
  end
end

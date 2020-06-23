class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find params[:id]
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find params[:id]
  end

  def create
    @project = Project.new project_params

    if @project.save
      redirect_to project_path(@project),
                  notice: 'Project was successfully created.'
    else
      flash[:alert] = @project.errors.full_messages
      render :new
    end
  end

  def update
    @project = Project.find params[:id]
    if @project.update project_params
      redirect_to project_path(@project),
                  notice: 'Project was successfully updated.'
    else
      flash[:alert] = @project.errors.full_messages
      render :edit
    end
  end

  def destroy
    @project = Project.find params[:id]
    if @project.destroy
      flash[:notice] = 'Project was successfully destroyed.'
      redirect_to projects_path
    end
  end

  private

  def project_params
    params.require(:project).permit(:title)
  end
end

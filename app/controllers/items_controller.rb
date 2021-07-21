class ItemsController < ApplicationController
  before_action :get_project

  def new
    @item = @project.items.build
  end

  def create
    @item = @project.items.build(item_params)

    if @item.save
      redirect_to project_path(@project),
                  notice: 'Item was successfully created.'
    else
      flash[:alert] = @item.errors.full_messages
      render :new
    end
  end

  def edit
    @item = @project.items.find_by("id=#{params[:id]}")
  end

  def update
    @item = @project.items.find_by("id=#{params[:id]}")

    if @item.update(item_params)
      redirect_to project_path(@project),
                  notice: 'Item was successfully updated.'
    else
      flash[:alert] = @item.errors.full_messages
      render :action => 'edit'
    end
  end

  private

  def get_project
    @project = Project.find(params[:project_id])
  end

  def item_params
    params.require(:item).permit(:action, :done)
  end
end

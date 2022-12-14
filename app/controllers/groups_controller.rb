class GroupsController < ApplicationController
  def index
    @groups = Group.all
    @book = Book.new
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    @group.save
    redirect_to groups_path
  end

  def show
    @group = Group.find(params[:id])
    @book = Book.new
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.owner_id = current_user.id
    @group.update(group_params)
    redirect_to group_path(@group)
  end


  private
  def group_params
    params.require(:group).permit(:name, :introduction, :group_image)
  end
end

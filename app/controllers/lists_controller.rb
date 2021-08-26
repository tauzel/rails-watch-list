class ListsController < ApplicationController
  before_action :fetch_list, only: [:show, :destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save!

    redirect_to lists_path
  end

  def show
  end

  def destroy
  end

  private

  def fetch_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end

class WidgetsController < ApplicationController
  before_action :set_widget, :except => [:index, :new, :create]


  def index
    @widgets = Widget.all
  end


  def show
  end



  private
  def set_widget
    @widget = Widget.find_by_id(params[:id])
    unless @widget
      flash[:error] = 'Widget not found'
      redirect_back
    end
  end


  def widget_params
    params.require(:widget).permit(
      :name
    )
  end
end

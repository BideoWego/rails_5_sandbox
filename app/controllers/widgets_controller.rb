class WidgetsController < ApplicationController
  per_form_csrf_tokens = true


  def index
    @message = helpers.foobar_helper_method
  end


  def create
    if value = params.dig(:widget, :foo, :bar)
      flash[:success] = value
    else
      flash[:error] = 'Oops!'
    end
    redirect_to widgets_path
  end
end

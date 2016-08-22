class SandboxesController < ApplicationController
  per_form_csrf_tokens = true


  def index
    @message = helpers.foobar_helper_method
  end


  def create
    if value = params.dig(:sandbox, :foo, :bar)
      flash[:success] = value
    else
      flash[:error] = 'Oops!'
    end
    redirect_to sandboxes_path
  end
end

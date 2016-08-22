class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  private
  def redirect_back(options={})
    options[:fallback_location] ||= root_path
    super(options)
  end
end

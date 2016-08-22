# ActionPack

1. Add ActionController#helpers to get access to the view context at the controller level.
1. Add ActionController::Parameters#dig on Ruby 2.3 and greater, which behaves the same as Hash#dig.
1. Add option for per-form CSRF tokens. [Blog post](http://blog.bigbinary.com/2016/01/11/per-form-csrf-token-in-rails-5.html)
1. Fix ActionController::Parameters#convert_parameters_to_hashes to return filtered or unfiltered values based on from where it is called, to_h or to_unsafe_h respectively.
1. Add ActionController::Parameters#include?
1. Add redirect_back method to ActionController::Redirecting to provide a way to safely redirect to the HTTP_REFERER if it is present, falling back to a provided redirect otherwise.
1. Change the protect_from_forgery prepend default to false.
    - Per this comment https://github.com/rails/rails/pull/18334#issuecomment-69234050 we want protect_from_forgery to default to prepend: false.
    - protect_from_forgery will now be inserted into the callback chain at the point it is called in your application. This is useful for cases where you want to protect_from_forgery after you perform required authentication callbacks or other callbacks that are required to run after forgery protection.
    - If you want protect_from_forgery callbacks to always run first, regardless of position they are called in your application then you can add prepend: true to your protect_from_forgery call.
1. Allow multiple root routes in same scope level. Example:
    ```
    root 'blog#show', constraints: ->(req) { Hostname.blog_site?(req.host) }
    root 'landing#show'
    ```
1. ActionController::Parameters no longer inherits from HashWithIndifferentAccess
    - Inheriting from HashWithIndifferentAccess allowed users to call any enumerable methods on Parameters object, resulting in a risk of losing the permitted? status or even getting back a pure Hash object instead of a Parameters object with proper sanitization.
    - By not inheriting from HashWithIndifferentAccess, we are able to make sure that all methods that are defined in Parameters object will return a proper Parameters object with a correct permitted? flag.
1. Add ability to filter parameters based on parent keys.
    ```
    # matches {credit_card: {code: "xxxx"}}
    # doesn't match {file: { code: "xxxx"}}
    config.filter_parameters += [ "credit_card.code" ]
    ```
1. Add support for API only apps. ActionController::API is added as a replacement of ActionController::Base for this kind of applications.
1. Remove assigns and assert_template. Both methods have been extracted into a [gem](https://github.com/rails/rails-controller-testing).
1. Deprecate :nothing option for render method.
1. Add ability to override default form builder for a controller.
    ```
    class AdminController < ApplicationController
      default_form_builder AdminFormBuilder
    end
    ```
1. For actions with no corresponding templates, render head :no_content instead of raising an error. This allows for slimmer API controller methods that simply work, without needing further instructions.
1. Fallback to ENV['RAILS_RELATIVE_URL_ROOT'] in url_for.
    - Fixed an issue where the RAILS_RELATIVE_URL_ROOT environment variable is not prepended to the path when url_for is called. If SCRIPT_NAME (used by Rack) is set, it takes precedence.
1. Add http_cache_forever to Action Controller, so we can cache a response that never gets expired.
1. Discarded flash messages get removed before storing into session.
1. Preserve default url options when generating URLs.
    - Fixes an issue that would cause default_url_options to be lost when generating URLs with fewer positional arguments than parameters in the route definition.
1. Add ActionController::Renderer to render arbitrary templates outside controller actions.
    - Its functionality is accessible through class methods render and renderer of ActionController::Base.
1. Allow you to pass prepend: false to protect_from_forgery to have the verification callback appended instead of prepended to the chain. This allows you to let the verification step depend on prior callbacks. Example:
    ```
    class ApplicationController < ActionController::Base
      before_action :authenticate
      protect_from_forgery prepend: false, unless: -> { @authenticated_by.oauth? }

      private
        def authenticate
          if oauth_request?
            # authenticate with oauth
            @authenticated_by = 'oauth'.inquiry
          else
            # authenticate with cookies
            @authenticated_by = 'cookie'.inquiry
          end
        end
    end
    ```
1. Remove deprecated support to define routes with :to option that doesn't contain #.
1. Stop converting empty arrays in params to nil.
    - This behavior was introduced in response to CVE-2012-2660, CVE-2012-2694 and CVE-2013-0155
    - ActiveRecord now issues a safe query when passing an empty array into a where clause, so there is no longer a need to defend against this type of input (any nils are still stripped from the array).






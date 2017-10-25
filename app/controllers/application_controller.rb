class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_action :request_path
  # before_filter :set_request_from

  def request_path
    @path = controller_path + '#' + action_name
    def @path.is(*str)
        str.map{|s| self.include?(s)}.include?(true)
    end
  end

  # def set_request_from
  #   if session[:request_from]
  #     @request_from = session[:request_from]
  #   end
  #   # 現在のURLを保存しておく
  #   session[:request_from] = request.original_url
  # end

  # def return_back
  #   if request.referer
  #     redirect_to :back and return true
  #   elsif @request_from
  #     redirect_to @request_from and return true
  #   end
  # end

end

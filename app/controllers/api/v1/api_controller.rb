module Api
  module V1
    class ApiController < ActionController::Base

      respond_to :json

      before_action :authenticate_user_from_token!, except: [:create, :destroy]

      def create
        @user = User.find_by email: params[:email]

        if @user && @user.valid_password?(params[:password])
          @user.save
          render :json => { :authentication_token => @user.authentication_token, :user_id => @user.id }, :status => :created
        else
          invalid_attempt
        end
      end

      def destroy
        authenticate_or_request_with_http_token do |token, options|
          @user = User.find_by authentication_token: token
    
          if @user
            @user.reset_authentication_token!
            render :json => { :message => ["Authentication token deleted."] },  :success => true, :status => :ok
          else
            invalid_attempt
          end
        end
      end
    
      private
    
      def authenticate_user_from_token!
        authenticate_or_request_with_http_token do |token, options|
          @user = User.find_by authentication_token: token
    
          if @user
            sign_in user, store: false
          end
        end
      end

      def invalid_attempt
        warden.custom_failure!
        render :json => { :errors => ["Invalid parameters."] },  :success => false, :status => :unauthorized
      end
    end
  end
end

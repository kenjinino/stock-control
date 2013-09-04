module Api
  module V1
    class ClientsController < ApplicationController
      respond_to :json
      before_action :set_client, only: [:show, :update, :destroy]
    
      # GET /clients
      def index
        respond_with Client.all
      end
    
      # GET /clients/1
      def show
        respond_with @client
      end

      # POST /clients
      def create
        @client = Client.new(client_params)
        if @client.save
          respond_with @client, status: :created
        else
          respond_with  @client.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /clients/1
      def update
        if @client.update(client_params)
          respond_with @client
        else
          respond_with @client.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /clients/1
      def destroy
        @client.destroy
        respond_with @client
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_client
          @client = Client.find(params[:id])

          rescue ActiveRecord::RecordNotFound
            error = { :error => "The client you were looking for could not be found."}
            respond_with(error, :status => 404)
        end
    
        # Never trust parameters from the scary internet, only allow the white list through.
        def client_params
          params.require(:client).permit(:name, :price)
        end
    end
  end
end

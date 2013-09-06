module Api
  module V1
    class OrdersController < ApiController
      before_action :set_order, only: [:show, :update, :destroy]
    
      # GET /orders
      def index
        respond_with Order.all
      end
    
      # GET /orders/1
      def show
        respond_with @order
      end

      # POST /orders
      def create
        @order = Order.new(order_params)
        if @order.save
          respond_with @order, status: :created
        else
          respond_with  @order.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /orders/1
      def update
        if @order.update(order_params)
          respond_with @order
        else
          respond_with @order.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /orders/1
      def destroy
        @order.destroy
        respond_with @order
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_order
          @order = Order.find(params[:id])

          rescue ActiveRecord::RecordNotFound
            error = { :error => "The order you were looking for could not be found."}
            respond_with(error, :status => 404)
        end
    
        # Never trust parameters from the scary internet, only allow the white list through.
        def order_params
          params.require(:order).permit(:name, :price)
        end
    end
  end
end

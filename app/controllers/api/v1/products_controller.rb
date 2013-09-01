module Api
  module V1
    class ProductsController < ApplicationController
      respond_to :json
      before_action :set_product, only: [:show, :update, :destroy]
    
      # GET /products
      def index
        respond_with Product.all
      end
    
      # GET /products/1
      def show
        respond_with @product
      end

      # POST /products
      def create
        @product = Product.new(product_params)
        if @product.save
          respond_with @product, status: :created
        else
          respond_with  @product.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /products/1
      def update
        if @product.update(product_params)
          respond_with @product
        else
          respond_with @product.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /products/1
      def destroy
        @product.destroy
        respond_with @product
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_product
          @product = Product.find(params[:id])

          rescue ActiveRecord::RecordNotFound
            error = { :error => "The product you were looking for could not be found."}
            respond_with(error, :status => 404)
        end
    
        # Never trust parameters from the scary internet, only allow the white list through.
        def product_params
          params.require(:product).permit(:name, :price)
        end
    end
  end
end

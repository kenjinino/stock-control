class OrderLinesController < ApplicationController
  before_action :set_order_line, only: [:show, :edit, :update, :destroy]

  def create
    @order = Order.find(params[:order_id])
    @order_line = @order.order_lines.build(order_line_params)
    #authorize! :create, @order_line

    respond_to do |format|
      if @order_line.save
        flash.now[:notice] = "Order line was successfully created."
        format.html { redirect_to @order }
        format.json { render action: 'show', status: :created, location: @client }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @client.errors, status: :unprocessable_entity }
        format.js { render 'order_lines/order_line_form_reload', order: @order, order_line: @order_line }
      end
    end
  end

  def destroy
    #authorize! :destroy, @order_line
    @order_line.destroy

    respond_to do |format|
      format.html { redirect_to order_path(params[:order_id]) }
      format.json { head :no_content }
    end
  end

  def edit
    #authorize! :update, @order_line
  end

  def update
    #authorize! :update, @order_line

    respond_to do |format|
      if @order_line.update(order_line_params)
        format.html { redirect_to order_path(@order_line.order), notice: 'Order line was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order_line.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    #authorize! :read, @order_line
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_line
      @order_line = OrderLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_line_params
      params.require(:order_line).permit(:product_id, :quantity)
    end

end

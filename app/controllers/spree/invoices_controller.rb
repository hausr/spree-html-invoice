module Spree
  class InvoicesController < Spree::Admin::BaseController
    layout :false

    def show
      @order = Order.find_by_number!(params[:id], :include => :adjustments) if params[:id]
      authorize! :show, @order

      template = params[:template] || 'invoice'

      respond_to do |format|
        format.pdf { render :pdf => @order.number, :template => "spree/invoices/#{template}", :disposition => 'attachment' }
        format.html { render template }
      end
    end
  end
end

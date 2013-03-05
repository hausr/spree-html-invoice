module Spree
  module Admin
    class InvoiceController < Spree::BaseController
      rescue_from CanCan::AccessDenied, :with => :render_404
      
      def lasku
        template = params[:template]
        eval "@#{template} = true"
        @order = Spree::Order.find_by_number(params[:id])
        if current_user && current_user.has_role?("admin")
          render  template, :layout => false
        else
          raise CanCan::AccessDenied 
        end 
      end
    end
  end
end

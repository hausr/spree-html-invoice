Spree::Admin::OrdersController.class_eval do
  def invoice
    load_order
    prepend_view_path "invoice"
    render 'invoice', :layout => false
  end
end
Deface::Override.new(:virtual_path => "spree/orders/show",
                     :name => "add_customer_invoice_buttons",
                     :insert_before => "p[data-hook='links']",
                     :partial => 'spree/orders/invoice_buttons',
                     :disabled => false)

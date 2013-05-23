class AddInvoiceToOrder < ActiveRecord::Migration
  def change
    add_column :spree_orders, :invoice, :integer
  end
end

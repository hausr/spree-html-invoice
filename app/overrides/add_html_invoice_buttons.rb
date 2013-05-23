Deface::Override.new(:virtual_path => "spree/admin/orders/edit",
                     :name => "add_html_invoice_buttons",
                     :insert_top => "[data-hook='admin_order_edit_buttons']",
                     :partial => "spree/admin/orders/html_buttons",
                     :disabled => false)

Deface::Override.new(
  :virtual_path  => "spree/admin/orders/_form",
  :insert_before => '#line-items',
  :text          => '
  <tbody id="invoice-number">
    <tr>
      <th colspan="3"><b><%= t("invoice.invoice_number") %>:</b></th>
      <th valign="top" class="total"><%= f.number_field :invoice, :min => 0, :style => "width:50px; text-align:right;" %></th>
      <th></th>
    </tr>
    <tr><td></td><td></td><td></td></tr>
  </tbody>
  ',
  :name => "Aggiungi il numero della fattura"
)
Deface::Override.new(
  :virtual_path  => "spree/admin/shared/_order_details",
  :insert_before => '#line-items',
  :text          => '
  <tbody id="invoice-number">
    <tr>
      <th colspan="3"><b><%= t("invoice.invoice_number") %>:</b></th>
      <th valign="top" class="total"><%= @order.invoice || @order.id %></th>
    </tr>
    <tr><td></td><td></td><td></td></tr>
  </tbody>
  ',
  :name => "Aggiungi il numero della fattura sul riepilogo"
)

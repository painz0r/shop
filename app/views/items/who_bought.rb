atom_feed do |feed|
  feed.title "Who bought #{@item.title}"
  latest_order = @item.orders.sort_by(&:updated_at).last
  feed.updated(latest_order && latest_order.updated_at)
  @item.orders.each do |order|
    feed.entry(order) do |entry|
      entry.title "Order #{order.id}"
      entry.summary :type => 'xhtml' do |xhtml|
        xhtml.p "Shipped to #{order.address}"
        xhtml.table do
          xhtml.tr do
            xhtml.th 'Item'
            xhtml.th 'Quantity'
            xhtml.th 'Total Price'
          end
          for item in order.line_items
            xhtml.tr do
              xhtml.td item.product.title
              xhtml.td item.quantity
              xhtml.td number_to_currency item.total_price
            end
          end
          xhtml.tr do
            xhtml.th 'total', :colspan => 2
            xhtml.th number_to_currency \
order.line_items.map(&:total_price).sum
          end
        end
        xhtml.p "Paid by #{order.pay_type}"
      end
      entry.author do |author|
        entry.name order.name
        entry.email order.email
      end
    end
  end
end
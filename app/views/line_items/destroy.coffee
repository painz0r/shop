$('#cart').html '<%= j render (@cart) %>'

<% unless @cart.total_items > 0 %>
$('#mycheckout').foundation 'reveal', 'close'
$('.blink').css("color", "#fffff")
<% end %>

$('#checkout').html "<%= j render :partial => 'items/checkout_button' %>"






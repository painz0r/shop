$('#cart').html '<%= j render (@cart) %>'

$('#checkout').html "<%= j render :partial => 'items/checkout_button' %>"

$('#cart').html '<%= j render(@cart) %>'

$('#checkout').html "<%= j render :partial => 'items/checkout_button' %>"

$('.blink').css("color", "#fffff")

$('#mycheckout').foundation('reveal', 'close') '<% j unless @cart.line_items.count.zero? %>'

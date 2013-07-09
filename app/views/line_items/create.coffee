$('#cart').html '<%= j render(@cart) %>'

$('#checkout').html "<%= j render :partial => 'items/checkout_button' %>"

$('#current_item').css({'background-color':'#ffffff'}).
animate({'background-color':'#cbffff'}, 1000);


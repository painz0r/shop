$('#cart').html '<%= j render(@cart) %>'

$('#checkout').html "<%= j render :partial => 'items/checkout_button' %>"

$('#current_item').css({'background-color':'#ffffff'}).
animate({'background-color':'#cbffff'}, 1000);

blink = ->
  $(".blink").animate
    opacity: 0
  , 200, "linear", ->
    $(this).animate
      opacity: 1
    , 200

blink()

$('.blink').css("color", "#7cf404")

$.gritter.add
  title: "<%= j @addMessage %>"
  text: " "
  image: "assets/shopping-cart-icon.png"
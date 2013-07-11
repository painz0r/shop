$ ->
  $("#notice, #error, #alert").on("click", (event)->
    $(event.target).hide("slow")
  )

closeHelpDiv = ->
  $("#alert, #notice").click()
window.setTimeout closeHelpDiv, 15000



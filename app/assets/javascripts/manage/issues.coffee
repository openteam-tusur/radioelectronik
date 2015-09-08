$ ->
  $('.js-toggle-inner-list').click ->
    $(this).toggleClass('opened closed')
    $(this).find('ul').toggleClass('hidden show')
    $(this).find('.glyphicon').toggleClass('glyphicon-plus glyphicon-minus')

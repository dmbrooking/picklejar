(($) ->
  jQuery(window).ready ->
    jQuery('#preloader').delay(100).fadeOut 'slow'
    jQuery('#load').delay(100).fadeOut 'slow'
    return
  #jQuery to collapse the navbar on scroll
  $(window).scroll ->
    if $('.navbar').offset().top > 50
      $('.navbar-fixed-top').addClass 'top-nav-collapse'
    else
      $('.navbar-fixed-top').removeClass 'top-nav-collapse'
    return
  return
) jQuery

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


$(document).ready ($) ->
  goToByScroll = (dataslide) ->
    htmlbody.animate { scrollTop: $('.slide[data-slide="' + dataslide + '"]').offset().top }, 1500, 'easeInOutQuint'
    i = 0
    while i < links.length
      if links[i].getAttribute('data-slide') == dataslide
        links[i].parentElement.className += ' active'
      else
        links[i].parentElement.className = links[i].parentElement.className.split(/\s+/).map((val) ->
          if val == 'active' then '' else val
        ).join(' ')
      i++
    return

  onScroll = (event) ->
    scrollPosition = $(document).scrollTop()
    i = 0
    while i < links.length
      if (links[i].getAttribute('data-slide'))
        refElement = $('.slide[data-slide="' + links[i].getAttribute('data-slide') + '"]')
        if refElement.offset().top <= scrollPosition and refElement.position().top + refElement.height() > scrollPosition
          links[i].parentElement.className += ' active'
        else
          links[i].parentElement.className = links[i].parentElement.className.split(/\s+/).map((val) ->
            if val == 'active' then '' else val
          ).join(' ')
      i++
    return

  # Cache some variables
  links = $('ul.nav').find('li>a')
  htmlbody = $('html,body')
  brand = $('.navbar-brand')
  arrows = $('a.btn.btn-circle')

  htmlbody.animate { scrollTop: $('.slide[data-slide="1"]').offset().top }, 1500, 'easeInOutQuint'
  $(document).on 'scroll', onScroll

  scrollOnClick = (e) ->
    $('body').removeClass 'stop-scrolling'
    e.preventDefault()
    dataslide = $(this).attr('data-slide')
    goToByScroll dataslide
    return

  brand.click scrollOnClick
  links.click scrollOnClick
  arrows.click scrollOnClick
  return

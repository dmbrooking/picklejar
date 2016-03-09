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

  $('.about').find('#bookmarklet').hide();
  $('.about').find('#extension').hide();
  $('.about').find('#save_mobile').hide();
  $('.about').find('#view_apple').hide();
  $('.about').find('#view_android').hide();
  $('.about').find('#view_computer').hide();

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
  about_icons = $('.about').find('i')

  htmlbody.animate { scrollTop: $('.slide[data-slide="1"]').offset().top }, 1500, 'easeInOutQuint'
  $(document).on 'scroll', onScroll

  scrollOnClick = (e) ->
    e.preventDefault()
    dataslide = $(this).attr('data-slide')
    if (dataslide)
      goToByScroll dataslide
    return

  showToolTip = (e) ->
    new_id = this.id.substring(0, this.id.length - 4)
    if (this.style.color == 'rgb(122, 201, 67)')
      this.style.color = 'white'
      $('.about').find('#' + new_id).hide();
    else
      this.style.color = '#7AC943'
      $('.about').find('#' + new_id).show();
    return

  brand.click scrollOnClick
  links.click scrollOnClick
  arrows.click scrollOnClick

  about_icons.hover showToolTip

  return

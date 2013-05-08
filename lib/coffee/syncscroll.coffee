###
syncScroll.js (v0.4)
https://github.com/pxwrk/syncscroll.pxwrk.de
###

(($) ->
  contentHeight = (el) ->
    el.get(0).scrollHeight
  viewHeight = (el) ->
    el.outerHeight()
  scrollTop = (el) ->
    el.scrollTop()
  percentage = (el) ->
    scrollTop(el)/(contentHeight(el)-viewHeight(el))*100
  $.fn.syncScroll = (selector) ->
    el1 = jQuery(this)
    el2 = jQuery(selector)
    setNewPosition = (source, target) ->
      newScrollTop = percentage(source)/100*(contentHeight(target)-viewHeight(target))
      target.scrollTop(newScrollTop)
    setEvents = (source, target) ->
      source
        .on 'mouseenter', ->
          jQuery(this).on 'scroll', ->
            setNewPosition(source, target)
        .on 'mouseleave', ->
          jQuery(this).off 'scroll'

    setEvents(el1, el2)
    setEvents(el2, el1)

  )(jQuery)

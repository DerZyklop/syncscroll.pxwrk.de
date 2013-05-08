###
syncScroll.js (v0.1)
syncScroll.pxwrk.de
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

    el1
      .on 'mouseenter', ->
        jQuery(this).on 'scroll', ->
          setNewPosition(el1, el2)
      .on 'mouseleave', ->
        jQuery(this).off 'scroll'

    el2
      .on 'mouseenter', ->
        jQuery(this).on 'scroll', ->
          setNewPosition(el2, el1)
      .on 'mouseleave', ->
        jQuery(this).off 'scroll'

  )(jQuery)

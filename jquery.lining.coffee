#
# Injector function from Lettering.JS 0.6.1 by Dave Rupert http://daverupert.com
# 

do (  $ = jQuery  ) ->

  injector = ( t, splitter, klass, after ) ->
    a = t.html().split( splitter )
    inject = ""
    if a.length
      $( a ).each ( i, item ) ->
        inject += "<span class=\"" + klass + ( i + 1 ) + "\">" + item + "</span>" + after
      t.empty().append( inject )

  methods =
    # This works but is extraordinarily ugly...
    # and probably highly inefficient.
    line : ->
      this.each ->
        injector( $( this ), " ", "word", " " )
        words = $( this ).find( "span[class^='word']" )
        collection = []
        lastY = 0
        inject = ""
        counter = 1
        words.each (i) ->
          y = $( this ).offset().top
          if ( y isnt lastY and i isnt 0 )
            inject += "<span class='text-line#{counter}'>#{collection.join('')}</span>"
            collection = []
            counter++
          collection.push( $( this ).html() + " " )
          if i is words.length - 1
            inject += "<span class='text-line#{counter}'>#{collection.join('')}</span>"
          lastY = y
        $( this ).empty().append( inject )

    unline : ->
      this.each ->
        lines = $( this ).find( "span[class^='text-line']" )
        if lines.length
          inject = ""
          lines.each ->
            inject += $( this ).html()
          $( this ).empty().append( inject )
      return this

  $.fn.lining = ( method ) ->
    # Method calling logic
    if method and methods[method]
      return methods[method].apply( this, [].slice.call( arguments, 1 ) )
    else if method is "line" or not method # always pass an array
      return methods.wrapLines.apply( this, [].slice.call( arguments, 0 ) ) 
    $.error "Method " + method + " does not exist on jQuery.lining"
    return this

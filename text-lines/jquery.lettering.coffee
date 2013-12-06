#global jQuery 

#!	
#* Lettering.JS 0.6.1
#*
#* Copyright 2010, Dave Rupert http://daverupert.com
#* Released under the WTFPL license 
#* http://sam.zoy.org/wtfpl/
#*
#* Thanks to Paul Irish - http://paulirish.com - for the feedback.
#*
#* Date: Mon Sep 20 17:14:00 2010 -0600
#
do (  $ = jQuery  ) ->
  injector = ( t, splitter, klass, after ) ->
    a = t.text().split( splitter )
    inject = ""
    if a.length
      $( a ).each ( i, item ) ->
        inject += "<span class=\"" + klass + ( i + 1 ) + "\">" + item + "</span>" + after

      t.empty().append inject
  methods =
    init : ->
      this.each ->
        injector( $( this ), "", "char", "" )


    words : ->
      this.each ->
        injector( $( this ), " ", "word", " " )


    lines : ->
      this.each ->
        r = "eefec303079ad17405c889e092e105b0"
        
        # Because it's hard to split a <br/> tag consistently across browsers,
        # ( *ahem* IE *ahem* ), we replace all <br/> instances with an md5 hash 
        # ( of the word "split" ).  If you're trying to use this plugin on that 
        # md5 hash string, it will fail because you're being ridiculous.
        injector( $( this ).children( "br" ).replaceWith( r ).end(), r, "line", "" )

  $.fn.lettering = ( method ) ->
    
    # Method calling logic
    if method and methods[method]
      return methods[method].apply( this, [].slice.call( arguments, 1 ) )
    else if method is "letters" or not method # always pass an array
      return methods.init.apply( this, [].slice.call( arguments, 0 ) ) 
    $.error "Method " + method + " does not exist on jQuery.lettering"
    return this
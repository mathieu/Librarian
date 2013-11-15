$ ->
  # Add autocomplete on authors name for choosing book's authors
  $('.with_autocomplete')
  # don't navigate away from the field on tab when selecting an item
  .bind "keydown", ( event ) ->
      if event.keyCode is $.ui.keyCode.TAB && $( this ).data( "ui-autocomplete" ).menu.active
        event.preventDefault()

  .autocomplete
    source: (request, response) ->
      $.ajax
        url: $('.with_autocomplete').data('autocompleteurl')
        dataType: "json"
        data:
          name: extractLast(request.term)
        success: (data) ->
          response(data)

    search: ->
      # custom minLength
      term = extractLast( this.value )
      if term.length < 2
        false

    focus: ->
      # prevent value inserted on focus
      false

    select: (event, ui) ->
      terms = split( this.value )
      # remove the current input
      terms.pop()
      # add the selected item
      terms.push( ui.item.value )
      # add placeholder to get the comma-and-space at the end
      terms.push( "" )
      this.value = terms.join( ", " )
      false





split = (val) ->
  val.split( /,\s*/ )


extractLast = (term) ->
  split( term ).pop()

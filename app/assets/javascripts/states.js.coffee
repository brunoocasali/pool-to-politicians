$ ->
  $(document).on 'change', '#states_select', (evt) ->
    $.getJSON 'deliveries/find_cities.json', {
      state_id: $("#states_select option:selected").val()
    }, (data) ->
      $('#cities_select').empty().append $('<option></option>')

      data.forEach (item) ->
        $('#cities_select').append $('<option></option>').attr('value', item.id).text(item.name)


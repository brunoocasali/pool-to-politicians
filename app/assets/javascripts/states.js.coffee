$ ->
  $(document).on 'change', '#states_select', (evt) ->
    $.getJSON '/deliveries/find_cities.json', {
      state_id: $("#states_select option:selected").val()
    }, (data) ->
      $('#cities_select').empty().append $('<option></option>')

      data.forEach (item) ->
        $('#cities_select').append $('<option></option>').attr('value', item.id).text(item.name)


  $(document).on 'change', '#delivery_delivery_content', (evt) ->
    $("#states_select").prop("disabled", false)
    $("#cities_select").prop("disabled", false)

  $(document).on 'change', '#cities_select', (evt) ->
    $.ajax
      type: 'POST'
      dataType: 'script'
      url: '/deliveries/preview'
      data: $('#new_delivery').serializeArray()
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
        console.log($('#new_delivery').serializeArray())
      success: (data, textStatus, jqXHR) ->
        $("#buton_submit").prop("disabled", false)
        console.log("Dynamic country select OK!")


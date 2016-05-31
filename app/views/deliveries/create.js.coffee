$('.export .well').show()
var interval
interval = setInterval((->
  $.ajax
    url: '/progress-job/' + "<%= @job.id %>"
    success: (job) ->
      stage = undefined
      progress = undefined

      if job.last_error !== null
        $('.progress-status').addClass('text-danger').text job.progress_stage
        $('.progress-bar').addClass 'progress-bar-danger'
        $('.progress').removeClass 'active'
        clearInterval interval
      progress = job.progress_current / job.progress_max * 100

      if progress.toString() != 'NaN'
        $('.progress-status').text job.progress_current + '/' + job.progress_max
        $('.progress-bar').css('width', progress + '%').text progress + '%'
      return
    error: ->

      $('.progress').removeClass 'active'
      $('.progress-bar').css('width', '100%').text '100%'
      $('.progress-status').text 'Successfully exported!'
      $('.export-link').show()
      clearInterval interval
      return
  return
), 100)

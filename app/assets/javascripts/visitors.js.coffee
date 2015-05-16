class QuestionFlowchart
  constructor: (@questions) ->
    @update_curr(1)

  update_curr: (id) ->
    if @curr and @curr.$div
      @curr.$div.removeClass 'current'

    @curr = @questions[id - 1]  # Adjust for 0-indexing
    @curr.$div = $("#question_#{@curr.id}")
    @curr.$form = @curr.$div.find('form')

    @curr.$div.addClass 'current'

    @curr.$form.submit (e) =>
      e.preventDefault()
      btn = $(document.activeElement).val().toLowerCase()
      console.log btn
      if btn is 'next'
        if ($response = @curr.$form.find(':input[name="response"]').serializeArray()[0])
          next_id = $response.value
          @update_curr(next_id)
        # else
          # alert "You must pick one"
      else if btn is 'previous'
        prev_id = @curr.$form.find(':input[name="prev"]').serializeArray()[0].value
        @update_curr(prev_id)

$ ->
  if gon.action == 'start'
    question_flowchart = new QuestionFlowchart(gon.questions)
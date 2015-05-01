class QuestionFlowchart
  constructor: (@questions) ->
    @update_curr(1)

  update_curr: (id) ->
    if @curr and @curr.$div
      @curr.$div.removeClass 'current'
      @curr.$div.addClass 'completed'

    @curr = @questions[id - 1]  # Adjust for 0-indexing
    @curr.$div = $("#question_#{@curr.id}")
    @curr.$form = @curr.$div.find('form')

    @curr.$div.addClass 'current'

    @curr.$form.submit (e) =>
      e.preventDefault()
      if ($response = @curr.$form.find(':input[name="response"]').serializeArray()[0])
        next_id = $response.value
        console.log "curr_id = #{@curr.id} \nnext_id = #{next_id}"
        @update_curr(next_id)
      else
        alert "You must pick one"


$ ->
  if gon.action == 'start'
    question_flowchart = new QuestionFlowchart(gon.questions)
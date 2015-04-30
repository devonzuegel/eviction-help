class QuestionFlowchart
  constructor: (@questions) ->
    @update_curr(0)
    @submit()

  submit: () ->

  update_curr: (id) ->
    if @curr and @curr.$div
      @curr.$div.removeClass 'current'
      @curr.$div.addClass 'completed'

    @curr = @questions[id]
    @curr.$div = $("#question_#{@curr.id}")
    @curr.$form = @curr.$div.find('form')

    @curr.$div.addClass 'current'

    console.log "curr_id = #{@curr.id}"
    @curr.$form.submit (e) =>
      e.preventDefault()
      if ($response = @curr.$form.find(':input[name="response"]').serializeArray()[0])
        next_id = $response.value
        @update_curr(next_id)
        @submit
      else
        alert "You must pick one"


$ ->
  if gon.action == 'start'
    question_flowchart = new QuestionFlowchart(gon.questions)
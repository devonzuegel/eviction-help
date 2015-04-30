class QuestionFlowchart
  constructor: (@questions) ->
    @curr = if @questions then @questions[0] else null
    @curr.$form = $("#question_#{@curr.id}")
    @curr.$form.addClass "current"
    @helper()

  helper: ->
    console.log "I'm a helper!"

$ ->
  if gon.action == 'start'
    question_flowchart = new QuestionFlowchart(gon.questions)
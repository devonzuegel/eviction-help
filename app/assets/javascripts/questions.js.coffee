class Question
  constructor: (@text, @description, @required, @next) ->,

questions = [
  {
    type: "question",
    text: "Has your landlord given you a 60-day notice terminating your tenancy?",
    description: null,
    responses: [
      {
        text: "Yes",
        next: null,
      }, {
        text: "No",
        next: null,
      }
    ]
  },

  {
    type: "question",
    text: "Has your landlord served you a 3-day notice to cure or quit?",
    description: null,
    responses: [
      {
        text: "Yes",
        next: null,
      }, {
        text: "No",
        next: null,
      }
    ]
  },

  {
    type: "question",
    text: "Have more than 3 days passed since your landlord served you the notice?",
    description: null,
    responses: [
      {
        text: "Yes",
        next: null,
      }, {
        text: "No",
        next: null,
      }
    ]
  },

  {
    type: "advice",
    text: "Good news!",
    description: "Since fewer than 3 days have passed since your landlord served you the notice, you still have a chance to resolve this dispute outside of the courts. {more info...}"
  },

  {
    type: "question",
    text: "Has your landlord filed an Unlawful Detainer lawsuit at the Court?",
    description: null,
    responses: [
      {
        text: "Yes",
        next: null,
      }, {
        text: "No",
        next: null,
      }
    ],
  },

  {
    type: "question",
    text: "Did (s)he file the lawsuit within the past 5 days?",
    description: null,
    responses: [
      {
        text: "Yes",
        next: null,
      }, {
        text: "No",
        next: null,
      }
    ],
  },

  {
    type: "advice",
    text: "Default Judgement",
    description: "Unfortunately, tenants automatically lose Unlawful Detainer lawsuits if they don't respond within 5 days. You should expect a Sheriff's Notice within the next 1-5 days, and if you do not move within 6-8 days the Sheriff will evict you in person."
  },

  {

    type: "question",
    text: "Have you filed an answer to the lawsuit?",
    description: null,
    responses: [
      {
        text: "Yes",
        next: null,
      }, {
        text: "No",
        next: null,
      }
    ],
  },

  {
    type: "advice",
    text: "Here is information about further legal resources.",
    description: null,
    responses: [
      {
        text: "Yes",
        next: null,
      }, {
        text: "No",
        next: null,
      }
    ],
  },

  {

    type: "question",
    text: "Do you live in San Mateo County?",
    description: null,
    responses: [
      {
        text: "Yes",
        next: null,
      }, {
        text: "No",
        next: null,
      }
    ],
  },

  {

    type: "advice",
    text: "Good news! We can help you file your answer to the lawsuit.",
    description: null,
    responses: null,
  },

  {

    type: "advice",
    text: "We don't serve your county quite yet, but here are some further legal resources.",
    description: null,
  }
]
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

Question.create([
  {
    title:        "Has your landlord given you a 60-day notice terminating your tenancy?",
    description:  nil,
    required:     true,
    kind:         "question",
    prev:         nil,
    response1:    "Yes",
    next1:        nil,
    response2:    "No",
    next2:        nil,
  },

  {
    title:        "Has your landlord served you a 3-day notice to cure or quit?",
    description:  nil,
    required:     true,
    kind:         "question",
    prev:         nil,
    response1:    "Yes",
    next1:        nil,
    response2:    "No",
    next2:        nil,
  },

  {
    title:        "Have more than 3 days passed since your landlord served you the notice?",
    description:  nil,
    required:     true,
    kind:         "question",
    prev:         nil,
    response1:    "Yes",
    next1:        nil,
    response2:    "No",
    next2:        nil,
  },

  {
    title:        "Good news!",
    description:  "Since fewer than 3 days have passed since your landlord served you the notice, you still have a chance to resolve this dispute outside of the courts. {more info...}",
    required:     true,
    kind:         "advice",
    prev:         nil,
    response1:    nil,
    next1:        nil,
    response2:    nil,
    next2:        nil,
  },

  {
    title:        "Has your landlord filed an Unlawful Detainer lawsuit at the Court?",
    description:  nil,
    required:     true,
    kind:         "question",
    prev:         nil,
    response1:    "Yes",
    next1:        nil,
    response2:    "No",
    next2:        nil,
  },

  {
    title:        "Did (s)he file the lawsuit within the past 5 days?",
    description:  nil,
    required:     true,
    kind:         "question",
    prev:         nil,
    response1:    "Yes",
    next1:        nil,
    response2:    "No",
    next2:        nil,
  },

  {
    title:        "Default Judgement",
    description:  "Unfortunately, tenants automatically lose Unlawful Detainer lawsuits if they don't respond within 5 days. You should expect a Sheriff's Notice within the next 1-5 days, and if you do not move within 6-8 days the Sheriff will evict you in person.",
    required:     true,
    kind:         "advice",
    prev:         nil,
    response1:    nil,
    next1:        nil,
    response2:    nil,
    next2:        nil,
  },

  {
    title:        "Have you filed an answer to the lawsuit?",
    description:  nil,
    required:     true,
    kind:         "question",
    prev:         nil,
    response1:    "Yes",
    next1:        nil,
    response2:    "No",
    next2:        nil,
  },

  {
    title:        "Here is information about further legal resources.",
    description:  nil,
    required:     true,
    kind:         "advice",
    prev:         nil,
    response1:    nil,
    next1:        nil,
    response2:    nil,
    next2:        nil,
  },

  {
    title:        "Do you live in San Mateo County?",
    description:  nil,
    required:     true,
    kind:         "question",
    prev:         nil,
    response1:    "Yes",
    next1:        nil,
    response2:    "No",
    next2:        nil,
  },

  {
    title:        "Good news!",
    description:  "We can help you file your answer to the lawsuit.",
    required:     true,
    kind:         "advice",
    prev:         nil,
    response1:    nil,
    next1:        nil,
    response2:    nil,
    next2:        nil,
  },

  {
    title:        "We don't serve your county quite yet, but here is information about further legal resources.",
    description:  nil,
    required:     true,
    kind:         "advice",
    prev:         nil,
    response1:    nil,
    next1:        nil,
    response2:    nil,
    next2:        nil,
  },

])

Defense.create([
    {
        description: "Infestation of rodents/cockroaches/insects"
    }, {
        description: "Defective plumbing"
    }, {
        description: "Roof leaks"
    }, {
        description: "Damp walls"
    }, {
        description: "Falling plaster/sheet rock"
    }, {
        description: "Peeling paint"
    }, {
        description: "Cracks"
    }, {
        description: "Missing or defective smoke detectors"
    }, {
        description: "Unsafe stairways/railings"
    }, {
        description: "Defective electrical system"
    }, {
        description: "Inadequate heat"
    }, {
        description: "Inadequate security"
    }, {
        description: "Defective CO detectors"
    }, {
        description: "Mold"
    }, {
        description: "Holes in walls"
    }, {
        description: "Floors in disrepair"
    }, {
        description: "Windows leak air/don't seal/don't open properly"
    }, {
        description: "Gaps around doors"
    }, {
        description: "Inadequate trash receptacles/collection"
    }, {
        description: "Common areas unclean"
    }, {
        description: "Defective appliances"
    }, {
        description: "No secure mail receptacle"
    }, {
        description: "Inadequate hot water"
    }
    ])
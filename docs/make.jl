using Documenter, TSML

makedocs(
  source = "src",
  build = "build",
  modules = [TSML],
  clean = true,
  sitename = "TSML Documentation",
  doctest = false,
  pages = Any[
    "HOME" => "index.md",
    "Tutorial" => Any[
       "tutorial/aggregators.md",
       "tutorial/pipeline.md",
       "tutorial/statistics.md",
       "tutorial/monotonic.md",
       "tutorial/tsclassifier.md"
    ],
    "Manual" => Any[
      "Value PreProcessing" => "man/valueproc.md",
      "Date PreProcessing" => "man/dateproc.md",
      "Aggregation" => "man/aggregation.md",
      "Imputation" => "man/imputation.md",
    ],
    "ML Library" => Any[
      "Decision Tree" => "lib/decisiontree.md"
      #"Scikit Learners" => "lib/sklearn.md",
      #"Caret Learners" => "lib/caretlearn.md"
    ]
  ],
  format = Documenter.HTML(
     prettyurls = get(ENV, "CI", nothing) == "true"
  )
)

deploydocs(
    repo   = "github.com/IBM/TSML.jl.git",
)

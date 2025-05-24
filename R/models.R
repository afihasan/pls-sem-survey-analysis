# Depending on how well established your measurement and structural model is you might want to run an Exploratory Factor Analysis (EFA) first to determine which item belongs to what construct
# Define your measurement models here

# Measurement Model: Reflective/Formative Measurement (Latent Variables/Constructs)
mm_full <- constructs(
  composite("attitude",  multi_items("attitude", 1:5)),
  composite("subnorm",   multi_items("subnorm",  1:5)),
  composite("pbcontrol", multi_items("pbcontrol", 1:5)),
  composite("intention", multi_items("intention", 1:5)),
  composite("behavior",  multi_items("behavior",  1:5))
)

# Structural/Path model
# This was based on Theory of Planned Behavior (Ajzen, 1991)
sm_full <- relationships(
  paths(from = c("attitude", "subnorm", "pbcontrol"), to = "intention"),
  paths(from = "attitude", to = "behavior"),
  paths(from = "subnorm", to = "behavior"),
  paths(from = "pbcontrol", to = "behavior"),
  paths(from = "intention", to = "behavior")
)

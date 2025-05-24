run_pls <- function(measurement_model, structural_model, data, label) {
  model <- seminrlocal::estimate_pls(
    data              = data,
    measurement_model = measurement_model,
    structural_model  = structural_model,
    inner_weights     = path_weighting
  )
  boot <- bootstrap_model(seminr_model = model, nboot = 10000, seed = 123)

  smry   <- summary(model)
  summary_boot <- summary(boot)

  list(
    model         = model,
    summary       = smry,
    boot          = boot,
    summary_boot  = summary_boot,
    vif           = smry$vif_antecedents,
    fSquare       = smry$fSquare,
    paths         = smry$paths,
    rSquared      = boot$rSquared
  )
}

# Run model
results <- list(
  full = run_pls(mm_full, sm_full, df_pre, "Full TPB") #run_pls(measurement_model, structural_model, dataset, "Model Name")
)

# Print summaries
print(results$full$vif)
print(results$full$summary_boot$bootstrapped_paths)
print(results$full$fSquare)
print(results$full$rSquared)
print(results$full$summary)
print(results$full$summary_boot)

# Reliability plot
par(mfrow = c(1,2))
plot(results$full$summary$reliability, main = "Composite Reliability")
browse_plot(results$full$boot)

# Predictive assessment
pred <- predict_pls(
  model    = results$full$model,
  technique = predict_DA,
  noFolds   = 10,
  reps      = 10
)
print(summary(pred))

# Mediation
print(results$full$summary$total_indirect_effects)
specific_effect_significance(results$full$boot, from = "attitude", through = "intention", to = "behavior")
specific_effect_significance(results$full$boot, from = "subnorm", through = "intention", to = "behavior")
specific_effect_significance(results$full$boot, from = "pbcontrol", through = "intention", to = "behavior")
print(results$full$summary$paths)
print(results$full$summary_boot$bootstrapped_total_paths)

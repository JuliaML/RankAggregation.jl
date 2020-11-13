# ------------------------------------------------------------------
# Licensed under the MIT License. See LICENCE in the project root.
# ------------------------------------------------------------------

"""
    TauModel()

Probabilistic rank aggregation with the Tau model.

## References

* Journel 2002. Combining Knowledge From Diverse Sources:
  An Alternative to Traditional Data Independence Hypotheses.
"""
struct TauModel <: AggregationMethod end

function rank_impl(objects, scores::NTuple{N,Symbol},
                   method::TauModel) where {N}
  # score columns
  cols = []
  for col in propertynames(objects)
    if col ∈ scores
      push!(cols, getproperty(objects, col))
    end
  end

  # conditional probabilities
  S = reduce(hcat, cols)
  P = S ./ sum(S, dims=1)
  n = size(P, 1)

  # uniform prior
  xₒ = (1 - 1/n) / (1/n)

  # odds with no redundancy
  X = (1 .- P) ./ P
  x = xₒ * prod(X/xₒ, dims=2)

  # posterior probabilities
  p = 1 ./ (1 .+ x)

  # final rank
  sortperm(vec(p), rev=true)
end

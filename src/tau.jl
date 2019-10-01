# ------------------------------------------------------------------
# Licensed under the ISC License. See LICENCE in the project root.
# ------------------------------------------------------------------

"""
    TauModel()

Probabilistic rank aggregation with the Tau model.

## References

* Journel 2002. Combining Knowledge From Diverse Sources:
  An Alternative to Traditional Data Independence Hypotheses.
"""
struct TauModel <: AggregationMethod
end

function rank(objects, scores::NTuple{N,Symbol},
              method::TauModel) where {N}
end

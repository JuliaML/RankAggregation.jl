# ------------------------------------------------------------------
# Licensed under the MIT License. See LICENCE in the project root.
# ------------------------------------------------------------------

module RankAggregation

using Tables

"""
    AggregationMethod

A rank aggregation method.
"""
abstract type AggregationMethod end

"""
    rank(objects, scores, method; rev=false)

Rank `objects` stored in a tabular format on the basis of
`scores` columns and with an aggregation `method`.
"""
function rank(objects, scores::NTuple{N,Symbol},
              method::AggregationMethod=TauModel();
              rev=false) where {N}
  r = rank_impl(objects, scores, method)
  rev ? length(r) .- r .+ 1 : r
end

rank(objects, score::Symbol, method::AggregationMethod=TauModel(); rev=false) =
  rank(objects, (score,), method, rev=rev)

rank_impl(::Any, ::NTuple{N,Symbol}, ::AggregationMethod) where {N} =
  @error "not implemented"

#------------------
# IMPLEMENTATIONS
#------------------
include("tau_model.jl")

export
  AggregationMethod,
  TauModel,
  rank

end # module

# ------------------------------------------------------------------
# Licensed under the ISC License. See LICENCE in the project root.
# ------------------------------------------------------------------

module RankAggregation

using Tables

"""
    AggregationMethod

A rank aggregation method.
"""
abstract type AggregationMethod end

"""
    rank(objects, scores, [method])

Rank `objects` stored in a tabular format on the basis of
`scores` columns and with an aggregation `method`.
"""
rank(::Any, ::NTuple{N,Symbol}, ::AggregationMethod) where {N} =
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

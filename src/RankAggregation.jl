# ------------------------------------------------------------------
# Licensed under the ISC License. See LICENCE in the project root.
# ------------------------------------------------------------------

module RankAggregation

"""
    AggregationMethod

A rank aggregation method.
"""
abstract type AggregationMethod end

"""
    rank(objects, scores, [method])

Rank `objects` stored in a tabular format according to
`scores` columns and aggregation `method`.
"""
rank(::Any, ::NTuple{N,Symbol}, ::AggregationMethod) where {N} =
  @error "not implemented"

#------------------
# IMPLEMENTATIONS
#------------------
include("tau.jl")

export
  rank,
  TauModel

end # module

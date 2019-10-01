<p align="center">
  <img src="docs/RankAggregation.png" height="200"><br>
  <a href="https://travis-ci.org/juliohm/RankAggregation.jl">
    <img src="https://travis-ci.org/juliohm/RankAggregation.jl.svg?branch=master">
  </a>
  <a href="https://codecov.io/gh/juliohm/RankAggregation.jl">
    <img src="https://codecov.io/gh/juliohm/RankAggregation.jl/branch/master/graph/badge.svg">
  </a>
  <a href="LICENSE">
    <img src="https://img.shields.io/badge/license-ISC-blue.svg">
  </a>
</p>

Given a set of objects (e.g. rows of a table) with scores given by different scoring methods (e.g. columns), how to rank the objects? This problem is known in the literature as the rank aggregation problem.

The problem is trivial when there is only one score for each object (one column), but ranking objects on the basis of multiple (conflicting) scores is challenging. This package provides algorithms to aggregate multiple scores stored in a tabular format (see [Tables.jl](https://github.com/JuliaData/Tables.jl)) into a final rank vector.

## Installation

Get the latest stable release with Julia's package manager:

```julia
] add RankAggregation
```

## Usage

Given a table with scores `score1` and `score2` for objects `a`, `b`, and `c`:

```julia
using DataFrames

scores = DataFrame(object=[:a,:b,:c], score1=[0.9, 0.7, 0.5], score2=[0.8, 0.9, 0.4])

3×3 DataFrame
│ Row │ object │ score1  │ score2  │
│     │ Symbol │ Float64 │ Float64 │
├─────┼────────┼─────────┼─────────┤
│ 1   │ a      │ 0.9     │ 0.8     │
│ 2   │ b      │ 0.7     │ 0.9     │
│ 3   │ c      │ 0.5     │ 0.4     │
```

rank the objects:

```julia
rank(scores, (:score1,:score2))
```

Alternatively, specify the rank aggregation method:

```julia
rank(scores, (:score1,:score2), TauModel())
```

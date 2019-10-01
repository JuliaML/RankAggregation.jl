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

Given a set of objects (e.g. rows of a table) with scores given by different scoring methods (e.g. columns), how to rank the objects? This problem is known in the literature as the rank aggregation problem. The problem is trivial when there is only one score for each object (one column), but with multiple scores the ranking becomes challenging.

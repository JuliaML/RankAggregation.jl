using RankAggregation
using DataFrames
using Test

@testset "RankAggregation.jl" begin
  objects = DataFrame(object=[:a,:b,:c],
                      score1=[0.9, 0.7, 0.5],
                      score2=[0.8, 0.9, 0.4])
  @test rank(objects, :score1) == [1,2,3]
  @test rank(objects, :score2) == [2,1,3]
  @test rank(objects, (:score1,:score2)) == [1,2,3]
  @test rank(objects, :score2, rev=true) == [2,3,1]
end

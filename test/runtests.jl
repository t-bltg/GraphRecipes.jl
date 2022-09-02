using GraphRecipes
using StableRNGs
using Random
using Graphs
using Plots
using Test

const RNG = StableRNG(1234)

ltol() = 1e-5  # local tolerance
ctol() = 1e-3  # ci tolerance
isci() = get(ENV, "CI", "false") == "true"

# FIXME: use a stable random number generator in `Graphs`
# @eval Graphs function getRNG(seed::Integer=-1)
#     @eval using Random
#     Random.seed!(RNG, seed)
#     RNG
# end

include("figures.jl")

@testset "utils.jl" begin

    @test GraphRecipes.directed_curve(0., 1., 0., 1.) == GraphRecipes.directed_curve(0, 1, 0, 1)

    @testset "Functions from Plots.jl" begin
        @test GraphRecipes.isnothing(nothing) == Plots.isnothing(nothing)
        @test GraphRecipes.isnothing(missing) == Plots.isnothing(missing)
        @test GraphRecipes.isnothing(NaN) == Plots.isnothing(NaN)
        @test GraphRecipes.isnothing(0) == Plots.isnothing(0)
        @test GraphRecipes.isnothing(1) == Plots.isnothing(1)
        @test GraphRecipes.isnothing(0.0) == Plots.isnothing(0.0)
        @test GraphRecipes.isnothing(1.0) == Plots.isnothing(1.0)

        for (s, e) in [(rand(RNG), rand(RNG)) for i in 1:100]
            @test GraphRecipes.partialcircle(s, e) == Plots.partialcircle(s, e)
        end

        @testset "nearest_intersection" begin
            @test GraphRecipes.nearest_intersection(0, 0, 3, 3, [(1,0), (0,1)]) == (0,0,0.5,0.5)
            @test GraphRecipes.nearest_intersection(1, 2, 1, 2, []) == (1, 2, 1, 2)
        end

        @testset "unoccupied_angle" begin
            @test GraphRecipes.unoccupied_angle(1, 1, [1, 1, 1, 1], [2, 0, 3, -1]) == 2pi
        end

        @testset "islabel" begin
            @test GraphRecipes.islabel("hi")
            @test GraphRecipes.islabel(1)
            @test !GraphRecipes.islabel(missing)
            @test !GraphRecipes.islabel(NaN)
            @test !GraphRecipes.islabel(false)
            @test !GraphRecipes.islabel("")
        end

        @testset "control_point" begin
            @test GraphRecipes.control_point(0, 0, 6, 0, 4) == (4,3)
        end

        # TODO: Actually test that the aliases produce the same plots, rather than just
        # checking that they don't error. Also, test all of the different aliases.
        @testset "Aliases" begin
            A = [1 0 1 0;0 0 1 1;1 1 1 1;0 0 1 1]
            graphplot(A, markercolor=:red, markershape=:rect, markersize=0.5)
            graphplot(A, nodeweights=1:4)
            graphplot(A, curvaturescalar=0)
            graphplot(A, el=Dict((1,2)=>""), elb=true)
            graphplot(A, ew=(s,d,w)->3)
            graphplot(A, ses=0.5)
        end
    end

end

# -----------------------------------------
# marginalhist

# using Distributions
# n = 1000
# x = rand(RNG, Gamma(2), n)
# y = -0.5x + randn(n)
# marginalhist(x, y)

# -----------------------------------------
# portfolio composition map

# # fake data
# tickers = ["IBM", "Google", "Apple", "Intel"]
# N = 10
# D = length(tickers)
# weights = rand(RNG, N,D)
# weights ./= sum(weights, 2)
# returns = sort!((1:N) + D*randn(N))

# # plot it
# portfoliocomposition(weights, returns, labels = tickers')

# -----------------------------------------
#

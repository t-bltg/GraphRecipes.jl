module GraphRecipes

using InteractiveUtils  # subtypes
using Interpolations
using LinearAlgebra
using GeometryTypes
using SparseArrays
using RecipesBase
using Statistics
using PlotUtils  # ColorGradient
using NaNMath
using Random
using Graphs

import NetworkLayout

include("utils.jl")
include("graph_layouts.jl")
include("graphs.jl")
include("misc.jl")
include("trees.jl")

end

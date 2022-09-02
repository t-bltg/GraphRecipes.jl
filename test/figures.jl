using Random
using VisualRegressionTests
using LinearAlgebra
using SparseArrays
using ImageMagick
using LightGraphs
using AbstractTrees
using Gtk  # 

cd(@__DIR__)
include("functions.jl")
include("parse_readme.jl")

const isci = "CI" ∈ keys(ENV)
const atol = 1e-5  # local

default(show=false, reuse=true)

cd("../assets")

@testset "FIGURES" begin
    @plottest random_labelled_graph() "random_labelled_graph.png" popup=!isci tol=(isci ? 0.03 : atol)

    @plottest random_3d_graph() "random_3d_graph.png" popup=!isci tol=(isci ? 0.02 : atol)

    @plottest light_graphs() "light_graphs.png" popup=!isci tol=(isci ? 0.02 : atol)

    @plottest directed() "directed.png" popup=!isci tol=(isci ? 0.02 : atol)

    @plottest marker_properties() "marker_properties.png" popup=!isci tol=(isci ? 0.04 : atol)

    @plottest edgelabel() "edgelabel.png" popup=!isci tol=(isci ? 0.1 : atol)

    @plottest selfedges() "selfedges.png" popup=!isci tol=(isci ? 0.02 : atol)

    @plottest multigraphs() "multigraphs.png" popup=!isci tol=(isci ? 0.1 : atol)

    @plottest arc_chord_diagrams() "arc_chord_diagrams.png" popup=!isci tol=(isci ? 0.02 : atol)

    @plottest ast_example() "ast_example.png" popup=!isci tol=(isci ? 0.02 : atol)

    @plottest julia_type_tree() "julia_type_tree.png" popup=!isci tol=(isci ? 0.2 : atol)

    @plottest julia_dict_tree() "julia_dict_tree.png" popup=!isci tol=(isci ? 0.2 : atol)

    @plottest funky_edge_and_marker_args() "funky_edge_and_marker_args.png" popup=!isci tol=(isci ? 0.2 : atol)

    @plottest custom_nodeshapes_single() "custom_nodeshapes_single.png" popup=!isci tol=(isci ? 0.2 : atol)

    @plottest custom_nodeshapes_various() "custom_nodeshapes_various.png" popup=!isci tol=(isci ? 0.2 : atol)
end

@testset "README" begin
    @plottest julia_logo_pun() "readme_julia_logo_pun.png" popup=!isci tol=(isci ? 0.2 : atol)
end

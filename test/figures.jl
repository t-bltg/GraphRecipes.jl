using Random
using VisualRegressionTests
using LinearAlgebra
using SparseArrays
using ImageMagick
using AbstractTrees
using Gtk  # for popup dialog

cd(@__DIR__)
include("functions.jl")
include("parse_readme.jl")

default(show=false, reuse=true)

cd("../assets")

@testset "FIGURES" begin
    @plottest random_labelled_graph() "random_labelled_graph.png" popup=!isci() tol=(isci() ? ctol() : ltol())

    @plottest random_3d_graph() "random_3d_graph.png" popup=!isci() tol=(isci() ? ctol() : ltol())

    @plottest light_graphs() "light_graphs.png" popup=!isci() tol=(isci() ? 0.02 : ltol())

    @plottest directed() "directed.png" popup=!isci() tol=(isci() ? 0.02 : ltol())

    @plottest marker_properties() "marker_properties.png" popup=!isci() tol=(isci() ? 0.04 : ltol())

    @plottest edgelabel() "edgelabel.png" popup=!isci() tol=(isci() ? 0.1 : ltol())

    @plottest selfedges() "selfedges.png" popup=!isci() tol=(isci() ? 0.02 : ltol())

    @plottest multigraphs() "multigraphs.png" popup=!isci() tol=(isci() ? 0.1 : ltol())

    @plottest arc_chord_diagrams() "arc_chord_diagrams.png" popup=!isci() tol=(isci() ? ctol() : ltol())

    @plottest ast_example() "ast_example.png" popup=!isci() tol=(isci() ? ctol() : ltol())

    @plottest julia_type_tree() "julia_type_tree.png" popup=!isci() tol=(isci() ? 0.2 : ltol())

    @plottest julia_dict_tree() "julia_dict_tree.png" popup=!isci() tol=(isci() ? 0.2 : ltol())

    @plottest funky_edge_and_marker_args() "funky_edge_and_marker_args.png" popup=!isci() tol=(isci() ? 0.2 : ltol())

    @plottest custom_nodeshapes_single() "custom_nodeshapes_single.png" popup=!isci() tol=(isci() ? 0.2 : ltol())

    @plottest custom_nodeshapes_various() "custom_nodeshapes_various.png" popup=!isci() tol=(isci() ? 0.2 : ltol())
end

@testset "README" begin
    @plottest julia_logo_pun() "readme_julia_logo_pun.png" popup=!isci() tol=(isci() ? 0.2 : ltol())
end

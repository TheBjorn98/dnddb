struct Enemy
    uq::String
    name::String
    hp::Int
    ac::Int
    abl::Vector{Int}
    att::Vector{String}
    loot::Vector{String}

    # Enemy(d::Dict{String, Any}) = new()
end

EnemyTypeVector = [String, String, Int, Int, Vector{Int}, Vector{String}, Vector{String}]

function dict2enemy(d::Dict{String, Any})
    return Enemy(
        d["unique"],
        d["name"],
        d["hp"],
        d["ac"],
        d["abl"],
        d["att"],
        d["loot"]
    )
end

function enemy2dict(e::Enemy)
    return Dict(
        "unique" => e.uq,
        "name" => e.name,
        "hp" => e.hp,
        "ac" => e.ac,
        "abl" => e.abl,
        "att" => e.att,
        "loot" => e.loot,
    )
end
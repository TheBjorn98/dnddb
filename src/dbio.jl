using JSON

struct Enemydatabase
    fname::String
    data::Vector{Enemy}

    Enemydatabase(s::String) = new(s, [])
    Enemydatabase(s::String, d::Vector{Enemy}) = new(s, d)
end

function readdb(fname::String)::Enemydatabase
    edb = Enemydatabase(fname)
    ds = Vector{Dict{String, Any}}()
    
    open(fname, "r") do f
        ds = JSON.parse(read(f, String));
    end

    for d in ds
        push!(edb.data, dict2enemy(d))
    end

    return edb
end

# function db2dict()

function writedb(database::Enemydatabase)

    earr = Vector{Dict{String, Any}}()

    for e in database.data
        push!(earr, enemy2dict(e))
    end

    try
        cp(database.fname, database.fname * ".backup"; force = true)
    catch
        println("Database didn't exist, creating one now.")
        open(database.fname, "w") do f 
            # Nothing
        end
    end

    try
        rm(database.fname)
        open(database.fname, "w") do f 
            write(f, JSON.json(earr))
        end
    catch
        println("Removal and rewriting of " * database.fname * " was unsuccessful.")
        println("Old database can be restored from " * database.fname * ".backup")
    end
end
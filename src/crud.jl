### CRUD ###

function Base.show(io::IO, e::Enemy)
    
    write(io, "Unique ID: ")
    show(io, e.uq)
    write(io, "\nName:      ")
    show(io, e.name)
    write(io, "\nHP, AC:    ")
    # write(io, "\nHP: ")
    show(io, e.hp)
    write(io, ", ")
    # write(io, ", AC: ")
    show(io, e.ac)
    write(io, "\nAbilities: ")
    show(io, e.abl)
    write(io, "\nAttacks:   ")
    show(io, e.att)
    write(io, "\nLoot:      ")
    show(io, e.loot)
    write(io, "\n")

end

function Base.show(io::IO, edb::Enemydatabase)

    write(io, "File name:")
    show(io, edb.fname)
    write(io, "\n")
    show(io, edb.data)

    # for i in 1:length(edb.data)
    #     write(io, "\nIndex #" * string(i) * ": \n")
    #     show(io, edb.data[i])
    # end
end

function Base.show(io::IO, evec::Vector{Enemy})
    for i in 1:length(evec)
        write(io, "\nIndex #" * string(i) * ": \n")
        show(io, evec[i])
    end
end    

function createenemy(prompt="")
    return dict2enemy(read2dict(["unique", "name", "hp", "ac", "abl", "att", "loot"], [String, String, Int, Int, Vector{Int}, Vector{String}, Vector{String}], prompt))
end

function findbyfield(edb::Enemydatabase, f::Function)
    res = Vector{Enemy}()

    for e in edb.data
        # if f(e)
        #     push!(res, e)
        # end
        f(e) ? push!(res, e) : nothing
    end

    return res

end
### CONSOLE IO ###

function parsevector(t::Type, input::String, delim::String = ",")
    invec = split(input, delim)
    outvec = Vector{t}()

    if t == String
        return string.(invec)
    else
        for i in invec
            push!(outvec, parse(t, i))
        end
        return outvec
    end

end

function readsingleline(t::Type = String, prompt::String = "")
    print(prompt)
    if t == String
        return readline()
    else
        return convert(t, readline())
    end
end

function read2dict(fields::Vector{String}, types::Vector{DataType}, prompt::String="")
    if length(fields) != length(types)
        println("f: " * string(length(fields)) * ", t: " * string(length(types)) * "; There must be as many types as fields!")
        return -1
    end

    println(prompt)

    d = Dict{String, Any}()

    for i in 1:length(fields)
        print(fields[i] * ": ")

        if types[i] <: Vector
            d[fields[i]] = parsevector(eltype(types[i]), readline())
        elseif types[i] == String
            d[fields[i]] = readline()
        else
            d[fields[i]] = parse(types[i], readline())
        end
    end
    
    return d

end
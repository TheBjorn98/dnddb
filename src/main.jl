### MAIN ###

# include("consoleio.jl")
include("cio.jl")
include("rpg.jl")
include("dbio.jl")
include("crud.jl")
include("dbservice.jl")

function main()

    # edb2 = readdb("test.json")
    # @show edb2

    e1 = Enemy("goblin", "Goblin", 10, 12, [12, 11, 10, 7, 8, 9], ["Shortsword"], ["Goblin Ear"])
    e2 = Enemy("elf", "Elf", 10, 16, [13, 12, 12, 12, 13, 12], ["Leaf-bladed Sword"], ["20 gp", "Wine"])
    e3 = Enemy("dwarf", "Dwarf", 15, 18, [18, 14, 16, 11, 12, 10], ["Axe"], ["15 gp", "Stone"])

    # d1 = enemy2dict(e1)
    # d2 = enemy2dict(e2)
    # d3 = enemy2dict(e3)

    edb1 = Enemydatabase("test.json", [e1, e2, e3])
    # @show edb1

    es1 = findbyfield(edb1, x -> x.hp == 10)
    @show es1
    es2 = findbyfield(edb1, x -> x.name == "Goblin")
    @show es2
    
    # d4 = read2dict(["unique", "name", "hp", "ac", "abl", "att", "loot"], [String, String, Int, Int, Vector{Int}, Vector{String}, Vector{String}])
    # @show d4
    # e4 = dict2enemy(d4)
    # @show e4
    
    # e5 = createenemy()
    # @show e5
    
    # createdb()

    # writedb(edb1)
    
end

main()
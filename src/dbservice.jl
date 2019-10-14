function createdb()
    print("Enter name of database-file (complete with extension): ")
    fname = readline()

    # edb = Enemydatabase(fname)

    edb = try
        readdb(fname)
    catch
        println("Given database name is a new database. Continuing: ")
        Enemydatabase(fname)
    end

    dbisreading = true

    while dbisreading

        println("Enter the number of monsters to add before the database saves")
        println("0: stop reading")
        println("-1: prompt to repeat after each addition, #: prompt to repeat after # additions")
        print("#: ")

        num = parse(Int, readline())

        println("Continuing with enemy creation:")

        if num == 0
            dbisreading = false
        elseif num == -1
            push!(edb.data, createenemy())
        else
            for i in 1:num
                push!(edb.data, createenemy())
            end
        end

    end

    writedb(edb)

end


function vyber_slovo()
    return slova[rand(1:length(slova))]
end

function vygeneruj_nezname()
    for i in 1:length(slovo)
        append!(zname, false)
    end
end

function vygeneruj()
    for i in 1:length(zname)
        print(zname[i] ? slovo[i]*" " : "_ ")
    end
    println("\n")
end

function overeni_obsahu(text::String, pismeno::Char)
    indexy = Int[]
    for i in 1:length(text)
        if isequal(text[i], pismeno) || isequal(text[i], pismeno-32)
            append!(indexy, i)
        end
    end
    return indexy
end


function zadani()
    print("Zadej písmeno: ")
    pismeno = read(stdin, Char)
    read(stdin, Char)
    indexy = overeni_obsahu(slovo, pismeno)

    for i in indexy
        zname[i] = true
    end
end

function overeni_vyhry()
    vyhra = true
    for i in zname
        if !i
            vyhra = false
            break
        end
    end
    return vyhra
end

function hra()
    while true
        Base.run(`clear`)
        vygeneruj()
        zadani()
        if overeni_vyhry()
            Base.run(`clear`)
            vygeneruj()
            println("Vyhrál jsi!")
            break
        end
    end
end

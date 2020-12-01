function read_data_24(inputfilepath, inputfilename)
    nb_dem=0
    nb_prod=0
    nb_mag=0
    nb_noeuds=0
    matrice_S=Array{Float64}[]
    matrice_Q=Array{Float64}[]
    matrice_R=Array{Float64}[]

    filed = open(inputfilepath*"/"*inputfilename)
    while !eof(filed)
        data=readline(filed)
        data=rstrip(data)
        if sizeof(data) >= 1
            out=split(data, " = ")
            if(out[1]=="nbDEMANDES")
                nb_dem = parse(Int, out[2])
            elseif (out[1]=="nbPRODUITS")
                nb_prod = parse(Int, out[2])
            elseif (out[1]=="nbMAGASINS")
                nb_mag = parse(Int, out[2])
            elseif (out[1]=="nbNOEUDS")
                nb_noeuds = parse(Int, out[2])
            elseif (out[1]=="S[m,p]")
                for count in 1:nb_mag
                    data=readline(filed)
                    data=rstrip(data)
                    out=split(data, " ;")
                    out=split(out[1], " ")
                    #println(length(out))
                    #println(out)
                    if length(out) != nb_prod
                        println("erreur de lecture ou donnees, difference entre Smp et nbprod")
                    end
                    tmp=[]
                    for i in 1:nb_prod
                        push!(tmp,parse(Int, out[i]))
                    end
                    push!(matrice_S,tmp)
                end
                #println(matrice_S)
                #println(matrice_S[1][2])
                data=readline(filed)
                data=rstrip(data)
                if(data != "]")
                    println("erreur de lecture ou donnees a la fin de Smp")
                end
            elseif (out[1]=="R[i,j]")
                for count in 1:nb_noeuds
                    data=readline(filed)
                    data=rstrip(data)
                    out=split(data, " ;")
                    out=split(out[1], " ")
                    #println(length(out))
                    #println(out)
                    if length(out) != nb_noeuds
                        println("erreur de lecture ou donnees, difference entre Rij et nb_noeuds")
                    end
                    tmp=[]
                    for i in 1:nb_noeuds
                        push!(tmp,parse(Int, out[i]))
                    end
                    push!(matrice_R,tmp)
                end
                #println(matrice_R)
                #println(matrice_R[1][2])
                data=readline(filed)
                data=rstrip(data)
                if(data != "]")
                    println(data)
                    println("erreur de lecture ou donnees a la fin de Rij")
                end
            elseif (out[1]=="Q[d,p]")
                for count in 1:nb_dem
                    data=readline(filed)
                    data=rstrip(data)
                    out=split(data, " ;")
                    out=split(out[1], " ")
                    if length(out) != nb_prod
                        println("erreur de lecture ou donnees, difference entre Qdp et nbdem")
                    end
                    tmp=[]
                    for i in 1:nb_prod
                        push!(tmp,parse(Int, out[i]))
                    end
                    push!(matrice_Q,tmp)
                end
                #println(matrice_Q)
                #println(matrice_Q[1][2])
                data=readline(filed)
                data=rstrip(data)
                if(data != "]")
                    println("erreur de lecture ou donnees a la fin de Qdp")
                end
            end
        end
    end     
    nb_dem, nb_prod, nb_mag, nb_noeuds, matrice_S, matrice_Q, matrice_R
end






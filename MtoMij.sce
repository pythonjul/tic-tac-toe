function concat=MtoMij(M)
    
    //but: créer une matrice pour à afficher au joueur afin qu'il sache comment sont numérotés les cases, ie comment il doit jouer.
    [n,m]=size(M)
    N=string(M) //string pour y transformer en texte
    for i=1:n //à chaque fois que la matrice à un zéro, il case non jouée, on la remplace par la valeur matricielle
        for j=1:m
            if M(i,j)==0
                N(i,j)=msprintf('(%d,%d)', i, j) //% pour le texte, d pour digit
            end
        end
    end
    concat=N
endfunction

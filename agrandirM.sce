function concat=agrandirM(M)
    //but:mettre des zéros tout autour de la matrice M
    //on va vérifier s'il y a bien des zéros tout autour de la matrice M,
    //ie haut,bas,gauche,droite
    //s'il n'y en a pas, on en rajoute afin que le Ji+1 mod2 puisse jouer
    
    [n,m]=size(M)
    
    for i=1:n
        //gauche
        if M(i,1)~=0
            v=zeros(n,1)
            M=[v,M]
            [n,m]=size(M)
        end
        //droite
        if M(i,m)~=0
            v=zeros(n,1)
            M=[M,v]
            [n,m]=size(M)
        end
    end
    
    for j=1:m
        //haut
        if M(1,j)~=0
            v=zeros(1,m)
            M=[v;M]
            [n,m]=size(M)
        end
        //bas
        if M(n,j)~=0
            v=zeros(1,m)
            M=[M;v]
            [n,m]=size(M)
        end
    end
    
concat=M

endfunction

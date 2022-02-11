function concat=agrandirMx2(M)
    //but :on va vérifier s'il y a bien des zéros tout autour de la matrice M,
    //ie haut,bas,gauche,droite sur 2 lignes et colonnes
    //s'il n'y en a pas, on en rajoute
    
    //pour que la fonction fonctionne, n et m >=2
    
    [n,m]=size(M)
    
    for i=1:n
        //gauche
        
        if M(1:n,1)==0 //si colonne sur le bord à gauche est remplie de 0
            
            if M(1:n,2)==0 //si 2e colonne sur le bord à gauche est aussi remplie de 0
                //alors on ne fait rien
            else //sinon, on ajoute un vecteur rempli de 0
                v=zeros(n,1)
                M=[v,M]
                [n,m]=size(M)
            end
            
        end
        
        if M(i,1)~=0
            v=zeros(n,2)
            M=[v,M]
            [n,m]=size(M)
        end
        
        //droite
        if M(1:n,m)==0
            
            if M(1:n,m-1)==0
            else
                v=zeros(n,1)
                M=[M,v]
                [n,m]=size(M)
            end
            
        end
        
        if M(i,m)~=0
            v=zeros(n,2)
            M=[M,v]
            [n,m]=size(M)
        end
    end
    
    for j=1:m
        //haut
        
        if M(1,1:m)==0
            
            if M(2,1:m)==0
            else
                v=zeros(1,m)
                M=[v;M]
                [n,m]=size(M)
            end
            
        end
        
        if M(1,j)~=0
            v=zeros(2,m)
            M=[v;M]
            [n,m]=size(M)
        end
        
        //bas
        
        if M(n,1:m)==0
            
            if M(n-1,1:m)==0
            else
                v=zeros(1,m)
                M=[M;v]
                [n,m]=size(M)
            end
            
        end
        
        if M(n,j)~=0
            v=zeros(2,m)
            M=[M;v]
            [n,m]=size(M)
        end
    end
    
concat=M

endfunction

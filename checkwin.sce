function concat=checkwin(M,Ji)
    //but: vérifier si le Ji a gagné, ie 3 pions similaires se touchant 
    
    [n,m]=size(M)
    
    //pour un problème d'existence, on créé une matrice Z contenant M
    Z=zeros(n+2,m+2)
    [zn,zm]=size(Z)
    Z(2:(zn-1),2:(zm-1))=M
    
    //on pose une variable temp pour vérifier si la partie a été gagnée
    temp=3
    for i=2:(zn-1) //on enlève les bords à cause de l'algorithme, et on n'en a pas besoin de vérifier car si 1 elmt sur le haut p.ex., on ajoutera une ligne de zéro au dessus
        for j=2:(zm-1)
            if Z(i,j)~=0
                //si on a 3 pions allignés
                if (Z(i+1,j-1)==Z(i,j) && Z(i,j)==Z(i-1,j+1)) || (Z(i-1,j-1)==Z(i,j) && Z(i,j)==Z(i+1,j+1)) || (Z(i,j-1)==Z(i,j) && Z(i,j)==Z(i,j+1)) || (Z(i-1,j)==Z(i,j) && Z(i,j)==Z(i+1,j))
                then temp=1 //gagné
                break
                end
            end
        end
    end
    
    //1 ie victoire, sinon 0 ie le jeu continue
    if temp==1 
        concat=1 
        else concat=0
    end
    
endfunction

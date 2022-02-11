function concat=aleatoireint(M,Ji)
    //but: remplace un elmt de notre matrice M de manière choisie en respectant les règles du jeu, 
    //sachant que c'est à l'ordi de jouer, que il ne peut pas gagner et que l'humain de peut pas gagner au prochain tour.
    
    [n,m]=size(M)
    
    Z=zeros(n+4,m+4)
    [zn,zm]=size(Z)
    Z(3:(zn-2),3:(zm-2))=M
    
    st=0
    temp=[0;0]
    
    for i=3:(zn-2)
        for j=3:(zm-2)
            if Z(i,j)==0//ie coup jouable
                    if (Z(i-1,j-1)==2 && Z(i+1,j+1)==0) || (Z(i-1,j)==2 && Z(i+1,j)==0) || (Z(i-1,j+1)==2 && Z(i+1,j-1)==0) || (Z(i+1,j+1)==2 && Z(i-1,j-1)==0) || (Z(i+1,j)==2 && Z(i-1,j)==0) || (Z(i+1,j-1)==2 && Z(i-1,j+1)==0) || (Z(i,j+1)==2 && Z(i,j-1)==0) || (Z(i,j-1)==2 && Z(i,j+1)==0)
                        temp=[temp,[i-2;j-2]]
                        st=1
                    end
                end
            end
        end

if  st==1 //on prend au hasard une des cases enregistrée ci-dessus, avec la meme formule que dans aleatoire
    temp(:,1)=[]
    [vn,vm]=size(temp)
    s=round(((vm-1)*rand(1))+1)
    M(temp(1,s),temp(2,s))=2
else
    M=aleatoire(M,Ji)
    end

    concat=M

       
       
endfunction

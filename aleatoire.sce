function concat=aleatoire(M,Ji)
    //but: remplace un elmt de notre matrice M de manière aléatoire en respectant les règles du jeu
    //M est notre matrice de jeu
    
    //on prend la longueur et largeur de la matrice M
    [n,m]=size(M)
    
    //pour un problème d'existence, on créé une matrice Z contenant M
    Z=zeros(n+2,m+2)
    [zn,zm]=size(Z)
    Z(2:(zn-1),2:(zm-1))=M
    
    //on créé un vecteur qui va recevoir les coordonnées (i,j) de la matrice Z
    //avec les Z(i,j) qui ont des zéros et peuvent être choisis (selon règles du jeu)
    vect=[0;0]
    
    for i=2:(zn-1)
        for j=2:(zm-1)
            if Z(i,j)==0
                then
                    if Z(i-1,j-1)~=0 || Z(i-1,j)~=0 || Z(i-1,j+1)~=0 || Z(i+1,j+1)~=0 || Z(i+1,j)~=0 || Z(i+1,j-1)~=0 || Z(i,j+1)~=0 || Z(i,j-1)~=0
                        //on note i-1 et j-1 car on va utiliser ce résultat sur la matrice M
                        vect=[vect,[i-1;j-1]]
                    end
                end
            end
        end
    
    //supprime première, ie 0,0 du vecteur créé
    vect(:,1)=[]
    
    //nous donne vs le nombre de ligne (ie 1) et le nombre de colonnes, 
    //ie le choix du nombre de cases jouables
    [vn,vm]=size(vect)
    
    //arrondi le (nb colonnes du vect)*(nb-aléatoire-entre-0-et-1)
    //ceci afin d'obtenir un nombre aléatoire, et donc de placer notre 2 ou 1 
    //d'une manière aléatoire
    s=round(((vm-1)*rand(1))+1)
    //rem : si on a 11 valeurs dans le vecteur, (11-1)=10, 10*(nb aléat entre 0 et 1)=[|0,10|]
    //ie 11 valeurs, donc en +1 [|1,11|] donc bien le nombre de cases jouables
    
    //s sera donc le choix à jouer aléatoirement par l'ordinateur
    
    //ceci sert à utiliser le résultat de s ci-dessus appliqué à notre vecteur 
    //vect qui contient les coordonnées des zéros 'jouables' de la matrice M
    if Ji=='J1'
        q=1
    else
        q=2
    end

M(vect(1,s),vect(2,s))=q

        concat=M
endfunction

function concat=tictactoe()
    //but: créer un jeu entre deux joueurs jouant aléatoirement dirigés par l'ordi
    
    //le J1 joue des 1, le J2 joue des 2
    
    //J1 joue, une seule possibilité
    M=[1]
    //on agrandit la matrice afin que le J2 puisse jouer
    M=agrandirM(M)
    
    //choisi au hasard une des cases qui touche le 1, et y met un 2
    M=aleatoire(M,'J2')
    
    //on pose jeu=0,ie jeu en cours
    jeu=0
    
    //tant que jeu=0, le jeu est en cours
    while jeu==0
        //si le nombre de coups joués est pair, c'est à J1 de jouer, sinon c'est à J2
        if modulo(coupsjoues(M),2)==0
            Ji='J1'
        else
            Ji='J2'
            end
        
        M=agrandirM(M)
        M=aleatoire(M,Ji)
        jeu=checkwin(M,Ji)
        if jeu==1
            t=coupsjoues(M)
            txt=sprintf('%s a gagné en %d coups',Ji,t)
            break
            end
    end
    
    disp(txt)
    
    concat=M
    
    
endfunction

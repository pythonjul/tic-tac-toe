function concat=tictactoe_cvsh() // COMPUTER VS HUMAN
    
//but: cette fonction oppose un hôte (réel) à l'ordinateur jouant un petit peu intelligemment.
//l'hôte joue des 1, l'ordinateur des 2

    if rand(1)>=0.5
        FP='J1'
        disp('Vous commencez la partie, vous jouez des 1')
        else
        FP='J2'
        disp('L''ordinateur commence la partie, vous jouez des 1')
    end

    M=[0],jeu=0
    
    while jeu==0

        //si l'hôte commence
        if FP=='J1'
            if modulo(coupsjoues(M),2)==0 //si on vérifie cela, c'est à l'hôte de jouer
                if coupsjoues(M)~=0
                    Ji='J1'
                    M=agrandirMx2(M)
                    //on créé une matrice N afin que l'hôte puisse voir quel coup il a le droit de jouer
                    N=MtoMij(M)
                    disp(N)

                    //on demande à l'hôte où il souhaite jouer son coup
                    B=input('insérer ligne colonne de cette manière ''[ième_ligne jème_colonne]''')
                    s=B(1,1),t=B(1,2)
                    [t1,t2]=size(M)
                    
                    P=zeros(t1+2,t2+2)
                    [p1,p2]=size(P)
                    P(2:(p1-1),2:(p2-1))=M
                        //check si connectée au jeu ou si case déjà jouée
                    if (P(s,t)==0 && P(s,t+1)==0 && P(s,t+2)==0 && P(s+1,t+2)==0 && P(s+2,t+2)==0 && P(s+2,t+1)==0 && P(s+2,t)==0 && P(s+1,t)==0) || M(s,t)~=0
                        while (P(s,t)==0 && P(s,t+1)==0 && P(s,t+2)==0 && P(s+1,t+2)==0 && P(s+2,t+2)==0 && P(s+2,t+1)==0 && P(s+2,t)==0 && P(s+1,t)==0) || M(s,t)~=0
                            B=input('Erreur, veuillez réinsérer ligne colonne de cette manière ''[ième_ligne jème_colonne]''')
                            s=B(1,1),t=B(1,2)
                        end
                    else//quand les checks sont passés, on inscrit le coup de l'hôte dans la matrice M
                        M(B(1,1),B(1,2))=1
                    end

                    jeu=checkwin(M,Ji)
                    if jeu==1
                        txt=sprintf('%s a gagné',Ji)
                        break
                    end


                else //cas unique où J1 commence, on le différentie à cause de la taille de la matrice M 1x1, et ajoute indication supplémentaire
                    Ji='J1'
                    B=input('insérer ligne colonne de cette manière ''[ième_ligne jème_colonne]'', ie [1 1] pour votre premier choix]')
                    M(B(1,1),B(1,2))=1
                end //fin du cas où J1 commence


        else //J1 a commencé la game, mtn à l'ordi de jouer
            Ji='J2',v=canJiwin(M,'J1'),w=canJiwin(M,'J2')
                if w~=0 //ie si l'ordi peut gagner en jouant ce coup
                    M(w(1),w(2))=2
                    jeu=checkwin(M,Ji)
                    if jeu==1
                        txt=sprintf('%s a gagné',Ji)
                        break
                    end
                else //si l'ordi ne peut pas gagner en jouant ce coup,
                    if v~=0 //ie si l'humain peut gagner au prochain tour
                        M(v(1),v(2))=2
                        jeu=checkwin(M,Ji)
                        if jeu==1
                           txt=sprintf('%s a gagné',Ji)
                           break
                        end
                    else //rem: il n'y a pas besoin de faire le check de victoire, car victoire est dans le cas if ci-dessus
                        M=agrandirM(M)
                        M=aleatoireint(M,Ji)
                    end
                end
            end //J1 a commencé la game





    else //si l'ordi commence
            if modulo(coupsjoues(M),2)==0 //cas J2 à commencé la game
                if coupsjoues(M)~=0
                    Ji='J2',v=canJiwin(M,'J1'),w=canJiwin(M,'J2')
                    if w~=0 //ie si l'ordi peut gagner en jouant ce coup
                        M(w(1),w(2))=2
                        jeu=checkwin(M,Ji)
                        if jeu==1
                            txt=sprintf('%s a gagné',Ji)
                            break
                        end
                    else
                        if v~=0 //ie l'humain peut gagner au prochain tour
                            M(v(1),v(2))=2
                            jeu=checkwin(M,Ji)
                            if jeu==1
                                txt=sprintf('%s a gagné',Ji)
                                break
                            end
                        else//rem: il n'y a pas besoin de faire le check de victoire, car victoire est dans le cas if ci-dessus
                            M=agrandirM(M)
                            M=aleatoireint(M,Ji)
                        end
                    end
                else 
                    M=[2]
                    M=agrandirM(M)
                    end //J2 joue sachant que J2 a commencé la game





            else //comme ci-dessus
                Ji='J1'
                    M=agrandirMx2(M)
                    N=MtoMij(M)
                    disp(N)
                    B=input('insérer ligne colonne de cette manière ''[ième_ligne jème_colonne]''')
                    s=B(1,1),t=B(1,2)
                    [t1,t2]=size(M)
                    P=zeros(t1+2,t2+2)
                    [p1,p2]=size(P)
                    P(2:(p1-1),2:(p2-1))=M
                        if (P(s,t)==0 && P(s,t+1)==0 && P(s,t+2)==0 && P(s+1,t+2)==0 && P(s+2,t+2)==0 && P(s+2,t+1)==0 && P(s+2,t)==0 && P(s+1,t)==0) || M(s,t)~=0
                            while (P(s,t)==0 && P(s,t+1)==0 && P(s,t+2)==0 && P(s+1,t+2)==0 && P(s+2,t+2)==0 && P(s+2,t+1)==0 && P(s+2,t)==0 && P(s+1,t)==0) || M(s,t)~=0
                                B=input('Erreur, veuillez réinsérer ligne colonne de cette manière ''[ième_ligne jème_colonne]''')
                                s=B(1,1),t=B(1,2)
                            end
                        else
                            M(B(1,1),B(1,2))=1
                        end
                    jeu=checkwin(M,Ji)
                    if jeu==1
                        txt=sprintf('%s a gagné',Ji)
                        break
                    end
            end //J2 a commencé la game
            end //contient : si Ji=J1, alors ... sinon (Ji=J2)...
end //du while

disp(txt)
    
    concat=M

endfunction

function concat=tictactoe_cvsc2() //UNIQUEMENT POUR COMPTAWIN
    
    if rand(1)>=0.5
        FP='J1'
        else
        FP='J2'
    end

    M=[0],jeu=0
    
    while jeu==0

        //si le computer commence
        if FP=='J1'
            if modulo(coupsjoues(M),2)==0 //si on vérifie cela, c'est à l'hôte de jouer
                if coupsjoues(M)~=0
                    Ji='J1'
                    M=agrandirM(M)
                    M=aleatoire(M,Ji)
                    jeu=checkwin(M,Ji)
                    if jeu==1
                        G=1
                        break
                    end
                else 
                    M=[1]
                    M=agrandirM(M)
                    end

    else //J1 a commencé la game, mtn à l'ia de jouer
            M=agrandirM(M)
            Ji='J2',v=canJiwin(M,'J1'),w=canJiwin(M,'J2')
                if w~=0 //ie si l'ia peut gagner en jouant ce coup
                    M(w(1),w(2))=2
                    jeu=checkwin(M,Ji)
                    if jeu==1
                        G=2
                        break
                    end
                else //si l'ia ne peut pas gagner en jouant ce coup,
                    if v~=0 //ie si l'humain peut gagner au prochain tour
                        M(v(1),v(2))=2
                        jeu=checkwin(M,Ji)
                        if jeu==1
                           G=2
                           break
                        end
                    else //rem: il n'y a pas besoin de faire le check de victoire, car victoire est dans le cas if ci-dessus
                        M=aleatoireint(M,Ji)
                    end
                end
            end //J1 a commencé la game





    else //si l'ia commence
            if modulo(coupsjoues(M),2)==0 //cas J2 à commencé la game
                if coupsjoues(M)~=0
                    M=agrandirM(M)
                    Ji='J2',v=canJiwin(M,'J1'),w=canJiwin(M,'J2')
                    if w~=0 //ie si l'ordi peut gagner en jouant ce coup
                        M(w(1),w(2))=2
                        jeu=checkwin(M,Ji)
                        if jeu==1
                            G=2
                            break
                        end
                    else
                        if v~=0 //ie l'humain peut gagner au prochain tour
                            M(v(1),v(2))=2
                            jeu=checkwin(M,Ji)
                            if jeu==1
                                G=2
                                break
                            end
                        else//rem: il n'y a pas besoin de faire le check de victoire, car victoire est dans le cas if ci-dessus
                            M=aleatoireint(M,Ji)
                        end
                    end
                else 
                    M=[2]
                    M=agrandirM(M)
                    end //J2 joue sachant que J2 a commencé la game





            else //comme ci-dessus
                Ji='J1'
                M=agrandirM(M)
                    M=aleatoire(M,Ji)
                    jeu=checkwin(M,Ji)
                    if jeu==1
                        G=1
                        break
                    end
            end //J2 a commencé la game
            end //contient : si Ji=J1, alors ... sinon (Ji=J2)...
end //du while

    concat=G

endfunction

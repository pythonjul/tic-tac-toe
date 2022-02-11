function concat=comptawin(n)
    //comptabilise les victoires du programme tictactoe_iavsc
    w=[0,0]
    
    for i=1:n
        if tictactoe_cvsc2()==2
            w(1,2)=w(1,2)+1
        else
            w(1,1)=w(1,1)+1
    end
    end
    
    concat=sprintf('J1 a gagné %d fois et J2 (ia) a gagné %d fois',w(1,1),w(1,2))
    endfunction

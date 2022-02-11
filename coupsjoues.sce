function concat=coupsjoues(M)
//but:compter le nombre de coups joués depuis le début de la partie

    [n,m]=size(M)
    
    temp=0
    for i=1:n
        for j=1:m
            if M(i,j)~=0
                temp=temp+1
            end
        end
        end
    concat=temp
endfunction

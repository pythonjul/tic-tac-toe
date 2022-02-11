function concat=canJiwin(M,Ji)
//but : regarder si dans le coup direct à jouer, l'ordi peut gagner


    if Ji=='J1'
        w=1
    else
        w=2
    end


    Q=[0] //ie ne peut pas gagner

    [n,m]=size(M)
    
    Z=zeros(n+4,m+4)
    [zn,zm]=size(Z)
    Z(3:(zn-2),3:(zm-2))=M

    for i=3:(zn-2)
        for j=3:(zm-2)
            if Z(i,j)==0
                then
                    if Z(i-1,j-1)~=0 || Z(i-1,j)~=0 || Z(i-1,j+1)~=0 || Z(i+1,j+1)~=0 || Z(i+1,j)~=0 || Z(i+1,j-1)~=0 || Z(i,j+1)~=0 || Z(i,j-1)~=0
                        if (Z(i+1,j-1)==w && Z(i-1,j+1)==w) || (Z(i-1,j-1)==w && Z(i+1,j+1)==w) || (Z(i,j-1)==w && Z(i,j+1)==w) || (Z(i-1,j)==w && Z(i+1,j)==w) || (Z(i+2,j-2)==w && Z(i+1,j-1)==w) || (Z(i,j-2)==w && Z(i,j-1)==w) || (Z(i-2,j-2)==w && Z(i-1,j-1)==w) || (Z(i-2,j)==w && Z(i-1,j)==w) || (Z(i-2,j+2)==w && Z(i-1,j+1)==w) || (Z(i,j+2)==w && Z(i,j+1)==w) || (Z(i+2,j+2)==w && Z(i+1,j+1)==w) || (Z(i+2,j)==w && Z(i+1,j)==w)
                            Q=[i-2 j-2]
                            break
                        end
                        
                    end
                end
            end
        end

concat=Q
endfunction

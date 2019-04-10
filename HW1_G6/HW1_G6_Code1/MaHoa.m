function KQ = MaHoa(GiaTri, SoCaThe, SoBitMaHoa) 
    GT = GiaTri;
    KQ = zeros([SoCaThe SoBitMaHoa]);  
    for i = 1 : SoCaThe
        X = de2bi(GT(1,i),'left-msb');  % chuyen integer -> binary
        [~, c] = size(X);
        if (c <= (SoBitMaHoa - 1) )
            for j = 1 : (SoBitMaHoa - c)
                KQ(i,j)=0;
            end  
            for k = 1 : c
                j = j + 1;
                KQ(i,j) = X(1,k); 
            end
        else
            for k = 1 : SoBitMaHoa
                KQ(i,k) = X(1,k);  
            end
        end  
    end
end
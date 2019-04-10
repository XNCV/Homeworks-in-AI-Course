function KQ = DotBien(LaiGhep)
    KQ = LaiGhep;
    [h, c] = size(KQ);
    k = randperm(h*c);  
    dem = 1;
    for i = 1 : h
        for j = 1 : c
            if(dem == k(1))
                if(KQ(i,j)==1)
                    KQ(i,j) = 0;
                else
                    KQ(i,j) = 1;
                end
            end
            dem = dem + 1;
        end
    end
end
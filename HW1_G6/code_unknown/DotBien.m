% input: 4 x 5
% output: 4 x 5
% noi dung: dot bien 1 bit cho 1 ca the
function KQ = DotBien(LaiGhep)
    KQ = LaiGhep;
    [h, c] = size(KQ);
    k = randperm(h*c);   % 4 x 5 = 20, chon con so dau tien k(1)
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
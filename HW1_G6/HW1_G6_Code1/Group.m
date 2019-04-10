function KQ = Group(ChonLocSauDotBien, GiuLai)
    CL = ChonLocSauDotBien;
    GL = GiuLai;
    [h1,c] = size(CL);
    [h2,~] = size(GL);
    KQ = zeros(h1+h2,c);
    for i = 1 : h1     
        for j = 1 : c
            KQ(i,j) = CL(i,j);
        end
    end
    for i = 1 : h2     
        for j = 1 : c
            KQ(h1+i,j) = GL(i,j);
        end
    end
end
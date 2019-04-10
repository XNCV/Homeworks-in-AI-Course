% input: GiaTri 6x5, binary
% output: giai ma ra 6 ca the, 1x6.
% noi dung: giai ma tu nhi phan --> so nguyen
function KQ = GiaiMa(GiaTri)
    GT = GiaTri;
    [h,c] = size(GT);
    KQ = zeros(1,h);
    for i = 1 : h
        mu = 0;
        k = 0;
        for j = c : -1 : 1
            k = GT(i,j)*(2^mu) + k;
            mu = mu + 1;
        end
        KQ(1,i) = k;
    end
end
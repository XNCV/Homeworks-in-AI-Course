function KQ = HoiTu(DanhGia, nghiem)
    persistent dem;
    persistent pregt;
    if (isempty(dem))
        dem = 0;
    end
    if (isempty(pregt))
        pregt = 0;
    end
    KQ = 0;  
    J = DanhGia;
    x = nghiem;
    [~,c] = size(J);
% --------------tìm cuc dai--------------
    [gt,vt] = max(J);
    if(abs(gt-pregt) < 0.005)
        dem = dem + 1;
    else
        dem = 0;
    end
    pregt = gt;
    if(dem == 20)
        KQ = 1;
        J = gt
        x = x(1,vt)
    end
end
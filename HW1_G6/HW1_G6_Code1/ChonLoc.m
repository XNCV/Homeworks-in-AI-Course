function KQ = ChonLoc(MaHoa, DanhGia, SoCaThe,SoGiuLai, SoBitMaHoa)
    MH = MaHoa;
    DG = DanhGia;
    KQ = zeros(SoCaThe-SoGiuLai,SoBitMaHoa);
    [~, idx] = sort(DG);   % sap xem lai theo thu tu
    MH = MH(idx,:);         % sap xep vecto theo index
    for i = 1 : (SoCaThe-SoGiuLai)
        KQ(i,:) = MH(i,:);
    end
end
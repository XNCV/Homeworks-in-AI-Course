% input: MaHoa 6x5, DanhGia 1x6, SoCTGiuLai 1x1
% output: KQ 4x5
% lay 4 ca the 
function KQ = ChonLoc(MaHoa, DanhGia, SoCaThe,SoGiuLai, SoBitMaHoa)
    MH = MaHoa;
    DG = DanhGia;
    KQ = zeros(SoCaThe-SoGiuLai,SoBitMaHoa);
    [~, idx] = sort(DG);   % sap xem lai theo thu tu
    MH = MH(idx,:);         % sap xep vecto theo index
% Lay 4 ca the tot nhat, n = 4
    for i = 1 : (SoCaThe-SoGiuLai)
        KQ(i,:) = MH(i,:);
    end
end
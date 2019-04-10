% input: MaHoa 6x5, DanhGia 1x6, SoCTGiuLai=n= 1x1
% output: KQ 2x5
% lay 2 ca the 
function KQ = SoCTGiuLai(MaHoa, DanhGia, n, SoBitMaHoa)
    MH = MaHoa;
    DG = DanhGia;
    KQ = zeros(n,SoBitMaHoa);
    [DG, idx] = sort(DG);   % sap xem lai theo thu tu
    MH = MH(idx,:);         % sap xep vecto theo index
% Giu lai n ca the tot nhat, n = SoCTGiuLai
    for i = 1 : n
        KQ(i,:) = MH(i,:);
    end   
end
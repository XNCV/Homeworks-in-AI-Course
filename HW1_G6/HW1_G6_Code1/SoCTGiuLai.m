function KQ = SoCTGiuLai(MaHoa, DanhGia, n, SoBitMaHoa)
    MH = MaHoa;
    DG = DanhGia;
    KQ = zeros(n,SoBitMaHoa);
    [DG, idx] = sort(DG);  
    MH = MH(idx,:);        
    for i = 1 : n
        KQ(i,:) = MH(i,:);
    end   
end
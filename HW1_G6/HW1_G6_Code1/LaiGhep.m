function KQ = LaiGhep(ChonLoc, SoBitMaHoa, SoCaThe, SoCTGiuLai,min,max)
    CL = ChonLoc;
    [h, c] = size(CL);
    KQ = zeros(h,c);
    idx = randperm(SoCaThe-SoCTGiuLai);  % random tu 1 - SoCaThe, cac so khong trung nhau
    CL = CL(idx,:);
    for i = 1 : 2 : h
        k = randi([2 (SoBitMaHoa-1)], 1);
        for j = 1 : c
            if(j < k)
                KQ(i,j) = CL(i,j);
                KQ(i+1,j) = CL(i+1,j);
            else
                KQ(i,j) = CL(i+1,j);
                KQ(i+1,j) = CL(i,j);
            end
        end
    
%--------------------KIEM TRA CO THOA MIN-MAX KHONG?-----------------
%         kiemTra1 = KiemTra(KQ(i,:));
%         kiemTra2 = KiemTra(KQ(i+1,:));
%         i
%         if( kiemTra1>5 || kiemTra2>5||(kiemTra1<min || kiemTra1>max) || (kiemTra2<min || kiemTra2>max) )
%             i = i - 2
%             display('--------');
%             %idx = randperm(SoCaThe-SoCTGiuLai);  % random tu 1 - SoCaThe, cac so khong trung nhau
%             %CL = CL(idx,:);
%         end
    end
end
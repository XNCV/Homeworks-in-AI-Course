clear;clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% buoc 1: khoi tao quan the, gom 6 ca the
% KhoiTaoQuanThe(min, max, SoCaThe)
min = 0;
max = 5;
SoCaThe = 4;
SoGiuLai = 0;
KhoiTao = KhoiTaoQuanThe(min, max, SoCaThe);
[~,SoBitMaHoa] = size(de2bi(max,'left-msb'));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% buoc 2: danh gia do thich nghi, KQ = DanhGiaThichNghi(nghiem)
DanhGia = DanhGiaThichNghi(KhoiTao);
GiaTriSoNguyen = KhoiTao;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
KQ = 0;
TheHe = 1;
while(KQ == 0)
    
% buoc 3: ma hoa , KQ = MaHoa(KhoiTao, SoCaThe, SoBitMaHoa) 
MH = MaHoa(GiaTriSoNguyen, SoCaThe, SoBitMaHoa); 
%%%%%%%%%%%%%%%%%%%%%PHEP DI TRUYEN%%%%%%%%%%%%%%%%%%%%%%%%
% buoc 4: chon loc, 
GL = SoCTGiuLai(MH, DanhGia, SoGiuLai, SoBitMaHoa); % KQ = SoCTGiuLai(MaHoa, DanhGia, SoGiuLai,SoBitMaHoa)
CL = ChonLoc(MH, DanhGia, SoCaThe,SoGiuLai, SoBitMaHoa);    % KQ = ChonLoc(MaHoa, DanhGia, SoCaThe,SoGiuLai,SoBitMaHoa)
% buoc 5: lai ghep
LG = LaiGhep(CL, SoBitMaHoa, SoCaThe, SoGiuLai,min,max);
% buoc 6: dot bien               function KQ = DotBien(LaiGhep)
DB = DotBien(LG);       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% buoc 7: giai ma
GiaTri = Group(DB, GL);   % KQ = Group(DB,GL)
GiaTriSoNguyen = GiaiMa(GiaTri);      % KQ = GiaiMa(GiaTri)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% buoc 8: danh gia do thich nghi ( giong buoc 2), 
DanhGia = DanhGiaThichNghi(GiaTriSoNguyen);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kiem tra hoi tu chua ? can lap lai hay khong? KQ = HoiTu(DanhGia,GiaTriSoNguyen)
KQ = HoiTu(DanhGia, GiaTriSoNguyen);
if(KQ==1)
    TheHe
else
    TheHe=TheHe+1;
end
end













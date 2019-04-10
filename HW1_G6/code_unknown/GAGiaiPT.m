clear;clc;
% giai phuong trinh f(x) = 4x^4 - 5x^3 + e^(-2x) - 7sin(x) - 3con(x)
% giai phuong t?nh f(x) = x^2 - 2x + 1 = 0.
%syms x;
%x=0:0.0001:5;
%f= 4*(x.^4) - 5*(x.^3) + exp(-2*x) - 7*sin(x) - 3*cos(x) ;
%f = x^2 - 2*x + 1;
%solve(f,x)
%ezplot(f,[-100 100]);
%plot(x,f);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% buoc 1: khoi tao quan the, gom 6 ca the
% KhoiTaoQuanThe(min, max, SoCaThe)
min = 0;
max = 5;
SoCaThe = 20;
SoGiuLai = 2;
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













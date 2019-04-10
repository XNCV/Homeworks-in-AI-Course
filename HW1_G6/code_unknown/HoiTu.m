% input: DanhGia 1x6, ket qua sau khi tinh ham J(x), x 1x6
% output: 0 or 1, neu 1, in KQ ra man hinh 1x1, dung GA. 
% noi dung: kiem tra co x nao = 0 chua?. Neu co thi ket thuc GA va in 
% ket qua x x ra man hinh.
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
%---------------- tim nghiem x chinh xac de f(x) = 0------------------
%    for i = 1 : c
%         if(DG(1,i) == 0)  
%             KQ = 1;
%             J = J(1,i)
%             x = x(1,i)
%         end        
%    end
%----------------tim nghiem x gan dung de f(x) tien ve 0-----------
%     flag = 0;
%     for i = 1 : c
%         if( J(1,i)>=0 && J(1,i)<=1 && (abs(J(1,i)-pregt)<=0.5) )
%             dem = dem + 1;
%             flag = 1;
%             break;
%         end
%     end
%     
%     if(flag == 0)
%         dem = 0;
%         pregt = 0;
%     elseif(flag == 1)
%         dem = dem + 1;
%         pregt = J(1,i);
%     end
%     
%     if(dem == 10) 
%         KQ = 1;
%         J = J(1,i)
%         x = x(1,i)
%     end
% --------------tìm cuc dai--------------
    [gt,vt] = max(J);
    if(abs(gt-pregt) < 0.5)
        dem = dem + 1;
    else
        dem = 0;
    end
    pregt = gt;
    if(dem == 10)
        KQ = 1;
        J = gt
        x = x(1,vt)
    end
% --------------tìm cuc tieu--------------
%     [gt,vt] = min(J);
%     if(abs(gt-pregt) < 0.5)
%         dem = dem + 1;
%     else
%         dem = 0;
%     end
%     pregt = gt;
%     if(dem == 10)
%         KQ = 1;
%         J = gt
%         x = x(1,vt)
%     end
end
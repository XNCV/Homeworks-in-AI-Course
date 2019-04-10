function J = DanhGiaThichNghi(nghiem)
    A = 1817;
    [~, c] = size(nghiem);
    J = zeros(1, c);
    for i = 1 : c
        J(1,i) = 4*(nghiem(1,i)^4) - 5*nghiem(1,i)^3 + exp(-2*nghiem(1,i)) -7*sin(nghiem(1,i)) -3*cos(nghiem(1,i));
    end
end
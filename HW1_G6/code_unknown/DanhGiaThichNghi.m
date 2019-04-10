% J(x) = x^2 - 2x + 1, the x , mong muo J(x) = 0
% input: nghiem 1 x 6
% output: ket qua J(x), 1 x 6

function J = DanhGiaThichNghi(nghiem)
    A = 1817;
    [~, c] = size(nghiem);
    J = zeros(1, c);
    for i = 1 : c
        %J(1, i) = (nghiem(1,i)^2) - 2*nghiem(1,i) + 1;
        %J(1,i) = nghiem(1,i)^3 - 2*cos(nghiem(1,i))*nghiem(1,i)^2 + 5*nghiem(1,i) - 20.855;
        %J(1, i) = 8*(nghiem(1,i)^2) + 5*nghiem(1,i) - 2;
        %J(1, i) = -nghiem(1,i)^5 + 31*nghiem(1,i)^4 + 6*nghiem(1,i)^3 + 4*nghiem(1,i)^2 + 5*nghiem(1,i) + A;
        %J(1,i) = sin(nghiem(1,i)) + cos(nghiem(1,i)) - A;
        J(1,i) = 4*(nghiem(1,i)^4) - 5*nghiem(1,i)^3 + exp(-2*nghiem(1,i)) -7*sin(nghiem(1,i)) -3*cos(nghiem(1,i));
    end
end
%clear, clc;
% input: random tu so min den so max, voi so ca the la 6.
% output: 1 x 6
function KQ = KhoiTaoQuanThe(min, max, SoCaThe)
    % min = 0; max = 31; SoCaThe = 6;
    %KQ = randperm(max,6); % random tu 1 - 31 so khac nhau, lay 6 so nguyen.
    KQ = randi([min max],1,SoCaThe); % random cac so nguyen, tu min -> max
end
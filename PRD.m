%%%%% DOTA2伪随机分布过程的验证 %%%%%
%%% 概率描述 %%%
% 第n次攻击才暴击的概率
% P = k!Cpi(1/i-C)
clear;  clc;
C = 0.5;
n = ceil(1/C);
p = zeros(1, n);
for i = 1 : n - 1
    if (i == 1)
        p(i) = C;
    else
        p(i) = factorial(i) * C;
        for j = 1 : i - 1
            p(i) = p(i) * (1/j - C);
        end
    end
end
p(n) = 1 - sum(p);
Ex = 0;
for i = 1 : n
    Ex = Ex + p(i) * i;
end
p_act = 1 / Ex;

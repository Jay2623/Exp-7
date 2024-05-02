1 x = [1, 2, 2.5, 3, 4, 5];
2 y = [0, 5, 7, 6.5, 2, 0];
3 p = 3.4;
4 n = length(x);
5 a(1) = y(1);
6 for k = 1 : n - 1
7 d(k, 1) = (y(k+1) - y(k))/(x(k+1) - x(k)); 8 end
9 for j = 2 : n - 1
10
11
12
13 end 14
for k = 1 : n - j
d(k, j) = (d(k+1, j - 1) - d(k, j - 1))/(x(k+j) - x(k));
end
15 for j = 2 : n
16 a(j) = d(1, j-1); 17 end
18 Df(1) = 1;
19 c(1) = a(1);
20 for j = 2 : n
21    Df(j) = (p - x(j-1)) .* Df(j-1);
22    c(j) = a(j) .* Df(j);
23 end
24 fp = sum(c);
25
26 % Plotting for 1st order
27 xx1 = linspace(min(x), max(x), 1000);
28 yy1 = zeros(size(xx1));
29 for k = 1:length(xx1)
30 yy1(k) = y(1) + a(2) * (xx1(k) - x(1));
31 end
32
33 % Plotting for 2nd order
34 xx2 = linspace(min(x), max(x), 1000);
35 yy2 = zeros(size(xx2));
36 for k = 1:length(xx2)
37 yy2(k) = y(1) + a(2) * (xx2(k) - x(1)) + a(3) * (xx2(k) - x(1)) * (xx2(k) - x (2));
38 end
39
40 % Plotting for 3rd order
41 xx3 = linspace(min(x), max(x), 1000);
42 yy3 = zeros(size(xx3));
43 for k = 1:length(xx3)
44 yy3(k) = y(1) + a(2) * (xx3(k) - x(1)) + a(3) * (xx3(k) - x(1)) * (xx3(k) - x (2)) + a(4) * (xx3(k) - x(1)) * (xx3(k) - x(2)) * (xx3(k) - x(3));
45 end
46
47 figure;

22/4/24 10:09 PM C:\Users\chait\OneDrive\...\Question1.m 2 of 2
  48 plot(x, y, '-.', xx1, yy1, 'g', xx2, yy2, 'r', xx3, yy3, 'b');
49 xlabel('x');
50 ylabel('y');
51 title('Newtonian Interpolation');
52 legend('Data Points', '1st Order', '2nd Order', '3rd Order');
53 grid on;
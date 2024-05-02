1
2 x = [1, 2, 2.5, 3, 4, 5]; 3 y = [0, 5, 7, 6.5, 2, 0]; 4 p = 3.4;
5
6 % Lagrange interpolation 7 n = length(x);
8 L = zeros(1, n);
9 result = 0;
10
11 for i = 1:n
12 % Compute the ith Lagrange basis polynomial at p
13 term = 1;
14 for 15
16
17
j=1:n ifj~=i
    term = term * (p - x(j)) / (x(i) - x(j));
end
18 end
19     L(i) = term;
20
21 % Compute the interpolated value at p
22     result = result + y(i) * L(i);
23 end
24
25 result % Interpolated value at p
26
27 % Plotting for 1st order
28 xx1 = linspace(min(x), max(x), 1000);
29 yy1 = zeros(size(xx1));
30 for k = 1:length(xx1)
31 yy1(k) = y(1) * L(1) + y(2) * L(2);
32 end
33
34 % Plotting for 2nd order
35 xx2 = linspace(min(x), max(x), 1000);
36 yy2 = zeros(size(xx2));
37 for k = 1:length(xx2)
38 yy2(k) = y(1) * L(1) + y(2) * L(2) + y(3) * L(3);
39 end
40
41 % Plotting for 3rd order
42 xx3 = linspace(min(x), max(x), 1000);
43 yy3 = zeros(size(xx3));
44 for k = 1:length(xx3)
45 yy3(k)=y(1)*L(1)+y(2)*L(2)+y(3)*L(3)+y(4)*L(4); 46 end
47
48 figure;
49 plot(x, y, '-.', xx1, yy1, 'g', xx2, yy2, 'r', xx3, yy3, 'b');

22/4/24 10:09 PM C:\Users\chait\OneDrive\...\Question2.m 2 of 2
  50 xlabel('x');
51 ylabel('y');
52 title('Lagrange Interpolation');
53 legend('Data Points', '1st Order', '2nd Order', '3rd Order');
54 grid on;
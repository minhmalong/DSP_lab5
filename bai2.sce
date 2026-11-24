folder = get_absolute_file_path();
if exists("lab_plot") == 0 then
    exec(folder+"utils.sci",-1);
end
d = lab_figdir(folder);

// 2a
q = poly(0,"q");
x1 = [1 2 3 4 5]; x2 = [1 1 1];
P1 = poly(x1,"q","coeff"); P2 = poly(x2,"q","coeff");
Y = P1*P2;
y = coeff(Y); n = 0:length(y)-1;
disp(Y); disp(y);
lab_check(y,lab_conv(x1,x2),"Bai 2a");
lab_plot(2,n,y,"Bai 2a - y(n)",d,"bai2a_tich_chap.png");

// 2b
n = 0:10; p1 = 1/5; p2 = 2;
A = p1/(p1-p2); B = p2/(p2-p1);
y = A*p1.^n+B*p2.^n;
yref = lab_conv(p1.^n,p2.^n);
disp([A B]); disp(y);
lab_check(y,yref(1:length(n)),"Bai 2b");
lab_plot(3,n,y,"Bai 2b - y(n)",d,"bai2b_tich_chap.png");

// 2c
p1=1; p2=2;
A=-2/(p1-p2)^2; B=2/(p1-p2); C=2/(p2-p1)^2;
y=A*p1.^n+B*n.*p1.^(n-1)+C*p2.^n;
x2=2.^n; x2(1)=0;
yref=lab_conv(n,x2);
disp([A B C]); disp(y);
lab_check(y,yref(1:length(n)),"Bai 2c");
lab_plot(4,n,y,"Bai 2c - y(n)",d,"bai2c_tich_chap.png");

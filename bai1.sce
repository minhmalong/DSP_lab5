folder = get_absolute_file_path();
if exists("lab_plot") == 0 then
    exec(folder+"utils.sci",-1);
end
d = lab_figdir(folder);

z = poly(0,"z");
H = z^2/(z^2-1);
p = roots(H.den);
p1 = p(1); p2 = p(2);
A1 = p1/(p1-p2); A2 = p2/(p2-p1);
n = 0:12;
h = real(A1*p1.^n+A2*p2.^n);
x = zeros(1,length(n)); x(1)=1;
y = lab_rec(x,1,[1 0 -1],[0 0]);
disp(H); disp([A1 A2]); disp(h);
lab_check(h,y,"Bai 1");
lab_plot(1,n,h,"Bai 1 - h(n)",d,"bai1_dap_ung_xung.png");

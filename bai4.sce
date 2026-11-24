folder = get_absolute_file_path();
if exists("lab_plot") == 0 then
    exec(folder+"utils.sci",-1);
end
d = lab_figdir(folder);

n=0:20; p=0.7;
h=p.^n;
A=-p/(1-p); B=1/(1-p);
y=A*p.^n+B;
x=zeros(1,length(n)); x(1)=1;
lab_check(h,lab_rec(x,1,[1 -p],0),"Bai 4 h");
lab_check(y,lab_rec(ones(1,length(n)),1,[1 -p],0),"Bai 4 y");
disp([n' h' y']);
lab_plot(8,n,[h;y],["Bai 4 - h(n)";"Bai 4 - Step response"],d,"bai4_dap_ung.png");

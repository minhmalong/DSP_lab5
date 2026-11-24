folder = get_absolute_file_path();
if exists("lab_plot") == 0 then
    exec(folder+"utils.sci",-1);
end
d = lab_figdir(folder);

n=0:12;
p=1+%i*sqrt(2); pc=conj(p);
Ah=(p+1)/(p-pc);
Ai=(-p-3)/(p-pc);
As=(p+1)*p/((p-pc)*(p-2));
C=2*(2+1)/((2-p)*(2-pc));
h=2*real(Ah*p.^n);
yzi=2*real(Ai*p.^n);
yzs=2*real(As*p.^n)+real(C)*2.^n;
x=zeros(1,length(n)); x(1)=1;
a=[1 -2 3]; b=[1 1];
lab_check(h,lab_rec(x,b,a,[0 0]),"Bai 5 h");
lab_check(yzi,lab_rec(zeros(x),b,a,[1 1]),"Bai 5 zero input");
lab_check(yzs,lab_rec(2.^n,b,a,[0 0]),"Bai 5 zero state");
lab_check(yzi+yzs,lab_rec(2.^n,b,a,[1 1]),"Bai 5 total");
disp([Ah Ai As C]); disp([n' h' yzi' yzs']);
lab_plot(9,n,h,"Bai 5 - h(n)",d,"bai5_h.png");
lab_plot(10,n,[yzi;yzs],["Bai 5 - Zero input";"Bai 5 - Zero state"],d,"bai5_zi_zs.png");

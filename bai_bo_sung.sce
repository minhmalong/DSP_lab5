folder = get_absolute_file_path();
if exists("lab_plot") == 0 then
    exec(folder+"utils.sci",-1);
end
d = lab_figdir(folder);

// 3.7: kiem tra tich chap hai phia bang tong cat ngan
n=-10:15; y=zeros(n); yr=zeros(n);
for k=1:length(n)
    m=n(k);
    if m>=0 then
        y(k)=-2*(1/3)^m+(10/3)*(1/2)^m;
    else
        y(k)=(4/3)*2^m;
    end
    for j=0:100
        t=m-j;
        if t>=0 then
            x=(1/3)^t;
        else
            x=2^t;
        end
        yr(k)=yr(k)+x*(1/2)^j;
    end
end
lab_check(y,yr,"3.7 convolution");
lab_plot(11,n,y,"3.7 - Convolution",d,"bosung_37.png");

// 3.14: kiem tra cac day nhan qua bang phuong trinh sai phan
n=0:12; N=length(n); imp=zeros(n); imp(1)=1;
p=(1+%i)/2;
s1=2*(-1).^n-(-2).^n;
s2=2*real((0.5-0.5*%i)*p.^n);
s3=bool2s(n>=6)+bool2s(n>=7);
s4=2*imp-cos(%pi*n/2);
s5=(17/20)*0.5.^n+2*real((-3/10-23*%i/20)*(1+%i).^n);
s6=1+0.5.^n;
s7=0.25*imp+(n+3)/4.*(-2).^n;
s8=0.75*0.5.^n+2*real((-1/4-7*%i/16)*p.^n);
s9=-imp+2*(-0.5).^n;
a0=0.4; s10=-a0*imp-(1-a0^2)/a0*(1/a0).^n;
lab_check(s1,lab_rec(imp,[1 3],[1 3 2],[0 0]),"3.14a");
lab_check(s2,lab_rec(imp,1,[1 -1 0.5],[0 0]),"3.14b");
lab_check(s3,lab_rec(imp,[0 0 0 0 0 0 1 1],[1 -1],0),"3.14c");
lab_check(s4,lab_rec(imp,[1 0 2],[1 0 1],[0 0]),"3.14d");
lab_check(s5,lab_rec(imp,[1 6 1]/4,[1 -2.5 3 -1],[0 0 0]),"3.14e");
lab_check(s6,lab_rec(imp,[2 -1.5],[1 -1.5 0.5],[0 0]),"3.14f");
lab_check(s7,lab_rec(imp,[1 2 1],[1 4 4],[0 0]),"3.14g");
lab_check(s8,lab_rec(imp,[1 0.75 0.125]/4,[1 -1.5 1 -0.25],[0 0 0]),"3.14h");
lab_check(s9,lab_rec(imp,[1 -0.5],[1 0.5],0),"3.14i");
lab_check(s10,lab_rec(imp,[-1/a0 1],[1 -1/a0],0),"3.14j a=0.4");
disp([n' s1' s2' s3' s4' s5' s6' s7' s8' s9' s10']);

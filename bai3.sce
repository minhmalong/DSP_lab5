folder = get_absolute_file_path();
if exists("lab_plot") == 0 then
    exec(folder+"utils.sci",-1);
end
d = lab_figdir(folder);

n = -6:8;
N = length(n);
S1 = zeros(3,N); S2 = zeros(2,N); S3 = zeros(1,N);
A1=0.5/(1-0.5); B1=0.5/(1-2);
K=1/4; B=(2-4*K)/2; D=1-K-B;
C1=B+D; C2=D;
D3=(1+2)/(1-0.3*2);
C3=(1+10/3)/(1-0.5*10/3)^2;
Araw=1-D3-C3;
A3=Araw+D3; B3=D3;
for i=1:N
    k=n(i);
    if k>=0 then
        S1(1,i)=A1+B1*0.5^k;
        S1(2,i)=B1*0.5^k;
        S2(1,i)=(C1+C2*k)*(-2)^k;
        S3(i)=C3*0.3^k;
        if k==0 then
            S2(1,i)=S2(1,i)+K;
            S2(2,i)=K;
        end
    else
        S1(2,i)=-A1;
        S1(3,i)=-A1-B1*0.5^k;
        S2(2,i)=-(C1+C2*k)*(-2)^k;
        S3(i)=-(A3+B3*k)*0.5^k;
    end
end
// Kiem tra dong nhat thuc PFE tai cac diem khong phai cuc
q=[0.1 0.4 0.8];
lab_check(A1./(1-q)+B1./(1-0.5*q),1./(2-3*q+q.^2),"Bai 3 X1 PFE");
lab_check(K+C1./(1+2*q)+C2*(-2*q)./(1+2*q).^2,(1+2*q+q.^2)./(1+4*q+4*q.^2),"Bai 3 X2 PFE");
lab_check(A3./(1-0.5*q)+B3*0.5*q./(1-0.5*q).^2+C3./(1-0.3*q),(1+q)./((1-0.5*q).^2.*(1-0.3*q)),"Bai 3 X3 PFE");
disp([n' S1' S2' S3']);
lab_plot(5,n,S1,["X1: |z| > 1";"X1: 0.5 < |z| < 1";"X1: |z| < 0.5"],d,"bai3_X1_3ROC.png");
lab_plot(6,n,S2,["X2: |z| > 2";"X2: |z| < 2"],d,"bai3_X2_2ROC.png");
lab_plot(7,n,S3,"X3: 0.3 < |z| < 0.5",d,"bai3_X3_ROC.png");

folder=get_absolute_file_path();
if exists("lab_check")==0 then
    exec(folder+"utils.sci",-1);
end
// Kiem tra 4 tinh chat tren day huu han phuc
n=-2:3;
x=[1+2*%i, 2-%i, -3, 1, 2*%i, 4];
z=1.3+0.4*%i; w=%pi/5;
X=sum(x.*z.^(-n));
Xc=conj(sum(x.*conj(z).^(-n)));
lab_check(sum(conj(x).*z.^(-n)),Xc,"Bai 6 conjugate");
lab_check(sum(real(x).*z.^(-n)),(X+Xc)/2,"Bai 6 real");
lab_check(sum(imag(x).*z.^(-n)),(X-Xc)/(2*%i),"Bai 6 imaginary");
lab_check(sum(exp(%i*w*n).*x.*z.^(-n)),sum(x.*(z*exp(-%i*w)).^(-n)),"Bai 6 modulation");

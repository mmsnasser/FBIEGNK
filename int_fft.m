function y = int_fft (x)
%%
% This function compute the function 
% gamm = int phi(s)ds
% as an antiderivative of the function phi where 
% x=phi(s) and y=gamma(s)
% we must have int_0^2\pi\phi(s)ds=0
% and int_0^2\pi\cos ns\phi(s)ds=0
%%
N        =  length(x);   
n        =  N/2;
C        =  ifft(x);
%%
E        =  zeros(2*n,1);
for k=2:n
    E(k) = C(k)/(-1i*(k-1));
end
for k=n+2:2*n
    E(k) = C(k)/(-1i*(k-1-2*n));
end
%%
y        =  real(fft(E));
%%
end
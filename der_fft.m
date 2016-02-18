function y = der_fft (x)
%%
% This function compute the function 
% gamm = phi'(s) where
% x=phi(s) and y=gamma(s)
%%
n        =  length(x);
A        =  ifft(x);
%%
B        =  zeros(n,1);
% B(1)     =  0;
% B(n/2+1) =  0;
for j=1:n/2-1
    B(j+1) = -(1i*j)*A(j+1);
end
for j=n/2+1:n-1
    B(j+1) = -(1i*(j-n))*A(j+1);
end
%%
y        =  real(fft(B));
%%
end
function  y   =   carg (z)
%This function compute the (continuous function) arg(f)
%
%
%%
n       =  length(z);
y       =  unwrap(angle(z));
% y      =  angle(z);
% for k=2:n
%     if (abs(y(k)-y(k-1))>0.99*pi)
%         cc=round(1.0*((y(k)-y(k-1))/(2*pi)));
%         y(k)=y(k)-2*pi*cc;
%     end
% end
%%
end
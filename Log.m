function  w   =   Log (z,alp)
%
%
%
%%
if (nargin == 1),
    w    =  log(abs(z))+i.*cont_ang(z);
elseif (nargin == 2),
    w    =  log(abs(z))+i.*Arg(z,alp);
end
%%
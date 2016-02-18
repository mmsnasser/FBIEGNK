function  w = Mobius_Transform (z,alp,bet)
%
%
if nargin < 2,
    error('what is alpha and beta')
elseif nargin == 2, 
    w=(z-alp)./(1-alp'.*z);
elseif nargin == 3, 
    w=exp(i*bet).*(z-alp)./(1-alp'.*z);
end
    


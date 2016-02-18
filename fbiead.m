function  mu =  FBIEad(et,etp,etpp,A,Ap,gam,n,c,iprec,restart,gmrestol,maxit)
%%
% The function 
%        mu =  FBIEad(et,etp,etpp,A,Ap,gam,n,c,iprec,restart,gmrestol,maxit)
% returns the unique solution mu of the integral equation 
%               (I+N*+J)mu=gam 
% where et is the parameterization of the boundary, etp=et', etpp=et'',
% A=exp(-i\thet)(et-alp) for bounded G and A=exp(-i\thet) for unbounded
% G, gam is a given function, n is the number of nodes in each boundary
% component, c=1 for bounded G and c=-1 for unbounded G, iprec is the
% FMM precision flag, restart is the maximum number of the GMRES method 
% inner iterations, gmrestol is the tolerance of the GMRES method, and
% maxit is the maximum number of GMRES method outer iterations
%%
a        = [real(et.') ; imag(et.')];
m        =  length(et)/n-1;
[Uetp]   = zfmm2dpart(iprec,(m+1)*n,a,etp.',1);
Eetp     = (Uetp.pot).';
e        = 1-c-(2/n).*imag(Eetp)+(2/n).*imag(etpp./etp-Ap./A);     
%%
mu     = gmres(@(x)gB(x),gam,restart,gmrestol,maxit);
%%
function  hx  = gB (x)
    for k=1:m+1
        hPx(1+(k-1)*n:k*n,1) = (1/n)*sum(x(1+(k-1)*n:k*n,1));
    end
    [UAx]  = zfmm2dpart(iprec,(m+1)*n,a,[A.*x].',1);
    EAx    = (UAx.pot).';
    Btx    = (2/n).*imag((etp./A).*EAx); 
    hx    =  e.*x+Btx+hPx;
end
%%
end
function p3dx = fKinematicControllerExtendedDenise(p3dx,pgains)

%pgains:[k1,k2,k3] - ganhos
umax=0.75;%velocidade linear máxima
wmax=0.3;%velocidade angular máxima


p3dx.pPos.Xd(6) = atan2(p3dx.pPos.Xtil(2),p3dx.pPos.Xtil(1)); %theta_r
p3dx.pPos.Xtil=p3dx.pPos.Xd-p3dx.pPos.X; % Erro


%Parâmetros da função candidata de Lyapunov 
e1=cos(p3dx.pPos.X(6))*p3dx.pPos.Xtil(1)+sin(p3dx.pPos.X(6))*p3dx.pPos.Xtil(2);
e2=-sin(p3dx.pPos.X(6))*p3dx.pPos.Xtil(1)+cos(p3dx.pPos.X(6))*p3dx.pPos.Xtil(2);
e3=p3dx.pPos.Xtil(6);

%Lei de controle
p3dx.pSC.Ud(1)=umax*cos(e3)+pgains(1)*e1; %velocidade linear
p3dx.pSC.Ud(2)=wmax+pgains(2)*umax*e2+pgains(3)*umax*sin(e3);%velocidade angular

end




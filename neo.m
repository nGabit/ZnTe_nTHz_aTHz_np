%LN refractive index of crystal by Sellmeier method
%0 - LN
%1 - LT
%2 - ZnTe
%3 - GaP
%4 - GaAs T. Skauli, P. Kuo, K.L. Vodopyanov eta l., J. Appl. Phys. 94,
%6447-6455 (2003)
%5 - Se Edward J. Danielewicz and Paul D. Coleman, "Far Infrared Optical
%Properties of Selenium and Cadmium Telluride," Appl. Opt. 13, 1164-1170
%(1974)
%6 - CaTe
%7 - ZnSe
%8 - ZnS

function [ n ] = neo(lambda,T,cry)
if cry == 0  %LN
    lambda1 = lambda*1e6;
    a1 = 5.078;
    a2 = 0.0964;
    a3 = 0.2065;
    a4 = 61.16;
    a5 = 10.55;
    a6 = 1.59e-2;
    b1 = 4.677e-7;
    b2 = 7.822e-8;
    b3 = -2.653e-8;
    b4 = 1.096e-4;
    T = T-273;
    f = (T-24.5)*(T+570.82);

    n = sqrt(a1+b1*f+(a2+b2*f)./(lambda1.^2-(a3+b3*f)^2)+(a4+b4*f)./(lambda1.^2-a5^2)-a6*lambda1.^2);

elseif cry == 2 % ZnTe
    l = lambda*1e6;
    a0 = 9.92;
    a1 = 0.4253;
    b1 = 0.37766;
    a2 = 2.6358;
    b2 = 56.5;
    %H. H. Li, doi.org/10.1063/1.555705;

    n = sqrt(a0+a1./(l.^2-b1^1)+a2./(l.^2/b2^2-1));
    
elseif cry == 3 %GaP
    l = lambda*1e6;
     n = real(sqrt(4.1705 + 4.9133./(1 - (0.1174./l.^2)) + 1.9928./(1 -(756.46./l.^2)))); %it is up to 4.0mum    F. L. Madarasz
%     n = sqrt(2.68 + 6.40 * l.^2 / (l.^2 - 0.09032479));
%     a1 = 1.39;
%     a2 = 0.172;
%     b1 = 4.131;
%     b2 = 0.234;
%     c1 = 2.57;
%     c2 = 0.345;
%     d1 = 2.056;
%     d2 = 27.52;
% 
%     n = sqrt(1 + a1 * l .^ 2 ./ (l .^ 2 - a2^2) + b1 * l .^ 2 ./ (l .^ 2 - b2^2) + c1 * l .^ 2 ./ (l .^ 2 - c2^2) + d1 * l .^ 2 ./ (l .^ 2 - d2^2));
    
elseif cry == 4 %GaAs Skauli et al. 2003 0.97-17 um
    l = lambda*1e6;
    a0 = 4.372514;
    a = [5.466742 0.0242996 1.957522];
    b = [0.4431307 0.8746453 36.9166];
    
    n = real(sqrt(a0+1+a(1)*l.^2./(l.^2-b(1)^2)+a(2)*l.^2./(l.^2-b(2)^2)+...
        a(3)*l.^2./(l.^2-b(3)^2)));
    
  %  l1 = 0.4431307;
  %  l2 = 0.8746453;
  %  l3 = 36.9166;
  %  g0 = 5.372514;
  %  g1 = 27.83972;
  %  g2 = 0.031764;
  %  g3 = 0.00143636;
    
    %n = real(sqrt( g0+g1./(1/(l1)^2-1./(l.^2))+g2./(1/(l2)^2-1./(l.^2))+...
     %  g3./(1/(l3)^2-1./(l.^2))));
    
elseif cry == 5 %Se    
    
        n = sqrt(real(er(2*pi*3e8./lambda*1e6,T,cry)));

elseif cry == 7
    A=1;
    B=4.2980149;
    C=0.1920630;
    D=0.62776557;
    E=0.3787826;
    F=2.8955633;
    G=46.994595;
     l = lambda*1e6;
    n=real(sqrt(A+B*l.^2/(l.^2-C^2)+D*l.^2/(l.^2-E^2)+F*l.^2/(l.^2-G^2)));
%     n=real(sqrt(9.01536 + 0.24482./(l.^2 - 0.29934^2) + 3.08889./((l.^2./48.38^2) - 1)));
elseif cry == 8
    l = lambda*1e6;
    n=sqrt(1 + 0.3390426*l.^2./(l.^2 - 0.31423026.^2) + 3.7606868*l.^2./(l.^2 - 0.1759417.^2)+ 2.7312353*l.^2./(l.^2 - 33.886560.^2));
    
end;

end


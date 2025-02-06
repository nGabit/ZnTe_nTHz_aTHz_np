function [deff_] = deff(cry)

if cry == 0 % LN
    deff_= 168e-12;
elseif cry == 2 % ZnTe
    deff_ = 2/sqrt(3)*68.5e-12;
elseif cry == 3 % GaP
    deff_ = 2/sqrt(3)*24.8e-12;
elseif cry == 4 % GaAs
    deff_ = 2/sqrt(3)*65.6e-12;
elseif cry == 7 % ZnSe
    deff_ = 2/sqrt(3)*18.3e-12;
elseif cry == 8   %ZnS
    deff_ = 2/sqrt(3)*11.5e-12;
end;

end



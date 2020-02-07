function Cout= fCout(Ville,A)
%Calcul du cout d'un chemin hamiltonien

Cout=0;
for i=1:length(Ville)-1
    Cout=Cout+A(Ville(i+1),Ville(i));
end
Cout=Cout+A(Ville(length(Ville)),Ville(1));

end


nville=25;
Ville=1:nville;
Coordonnees = Ville_coordonnees(nville);
M=Matrice_distance(Coordonnees);
Cout=[];
niter=0;
tic
for i=1:100
    Cout=[Cout fCout(Ville,M)];
    Voisin = fVoisin(Ville);
    niter=niter+1;
end
toc
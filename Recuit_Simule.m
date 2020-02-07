clc;
clear;
close all;

%Algorithme du recuit simulé
% Pour le voisinage : trouver un nouveau cycle qui permette de décroiser

%Paramètres problème
nville=50;

% Paramètres recuit simulé
Ti=100;
Tgel=10^-14;
alpha=0.99;
n=10; % Durée des palliers

% Initialisation
T=Ti;
Ville=1:nville;
Coordonnees = Ville_coordonnees(nville);
M=Matrice_distance(Coordonnees);
%Boucle principale
Cout=[];
niter=0;
while T>Tgel
    for i=1:n
        niter=niter+1;
        Voisin = fVoisin(Ville);
        if fCout(Voisin,M)<fCout(Ville,M)
            Ville=Voisin;
        else 
            if rand<exp((fCout(Ville,M)-fCout(Voisin,M))/T)
                Ville=Voisin;
            else 
                Ville=Ville;
            end
        end
        Cout=[Cout fCout(Ville,M)];
    end
    T=alpha*T;
end

figure(1)
plot(Coordonnees(:,1),Coordonnees(:,2),'-or',[Coordonnees(nville,1) Coordonnees(1,1)],[Coordonnees(nville,2) Coordonnees(1,2)],'-or')
title('Configuration initiale')
xlabel('X')
ylabel('Y')
figure(2)
plot(Coordonnees(Ville,1),Coordonnees(Ville,2),'-ob',[Coordonnees(Ville(nville),1) Coordonnees(Ville(1),1)],[Coordonnees(Ville(nville),2) Coordonnees(Ville(1),2)],'-g')
title('Configuration finale obtenue par Recuit simule')
xlabel('X')
ylabel('Y')
figure(3)
plot(Cout)
title('Evolution de la fonction Cout à chaque itération')
xlabel('Iteration')
ylabel('Fonction Cout')
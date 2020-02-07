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
n=1; % Durée des palliers

% Initialisation
T=Ti;
Ville=1:nville;

Coordonnees=[  0.5269   -0.0844
    0.3396    0.6287
   -0.6089    0.0028
    0.0158    0.2087
    0.0877    0.2745
   -0.6173   -0.9150
   -0.4207    0.3970
   -0.7232   -0.9487
    0.5727    0.0623
   -0.7760   -0.0071
   -0.1905    0.5111
    0.5677    0.6100
    0.8115    0.7777
   -0.7280    0.4434
    0.1974   -0.1572
    0.9835   -0.4101
    0.6470   -0.3720
    0.2136   -0.3801
    0.5804   -0.1502
   -0.9775    0.8890
   -0.0279    0.9493
   -0.2320   -0.0416
    0.2260   -0.6871
    0.5403   -0.2864
    0.6047    0.4568
    0.4691    0.9572
   -0.2575    0.0841
    0.2961   -0.6710
    0.4399    0.7566
   -0.3468    0.0353
    0.9444    0.6207
    0.7303    0.1735
    0.1081    0.6448
    0.5470    0.4303
    0.0342    0.7358
   -0.7869   -0.2283
   -0.8739    0.1127
    0.4792    0.8759
   -0.1669    0.3825
    0.0591   -0.9080
    0.8668    0.1334
   -0.1692    0.5375
    0.2682    0.0523
    0.5315    0.8660
   -0.1392   -0.5893
   -0.4875    0.1971
    0.1681   -0.1538
    0.3548    0.2402
    0.8099   -0.5865
    0.0535   -0.6899];
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
function  Voisin1  = fVoisin(Ville)
%Cr�ation al�atoire d'un voisin � partir d'une ville
inversion=1;
a=randi([1 length(Ville)]);
b=randi([1 length(Ville)]);
A=min(a,b);
B=max(a,b);

if inversion==1
    Voisin1=[Ville(1:A-1) flip(Ville(A:B)) Ville(B+1:length(Ville))];
else
    Voisin1=Ville;
    Voisin1(A)=Ville(B);
    Voisin1(B)=Ville(A);
end


function M = Matrice_distance(A)
%Création de la matrice des distances pour les villes
N=length(A);
M=zeros(N);
for i=1:N
    for j=1:N
        M(i,j)=((A(i,1)-A(j,1))^2+(A(i,2)-A(j,2))^2)^0.5;
    end
end
end



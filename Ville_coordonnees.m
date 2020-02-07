function [ cities ] = Ville_coordonnees( nbr_cities )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
cities = [];
for d=1:1:nbr_cities
a = -1;
b = 1;
r = (b-a).*rand(1,1) + a;

x = r;
r = (b-a).*rand(1,1) + a;
y = r;

pt = [x y];
cities = [cities; pt];
end





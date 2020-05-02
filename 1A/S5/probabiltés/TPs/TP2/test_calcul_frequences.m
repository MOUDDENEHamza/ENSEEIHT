frequences = calcul_frequences('aabc',transpose('abc'));
resultat = (frequences==[0.5 ; 0.25 ; 0.25]);
if resultat~=1
	fprintf('Il y a un probleme !\n');
else
	fprintf('La fonction calcul_frequences est correcte !\n');
end

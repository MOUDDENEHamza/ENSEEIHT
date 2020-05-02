%--------------------------------------------------------------------------
% ENSEEIHT - 1SN - Analyse de donnees
% TP4 - Reconnaissance de chiffres manuscrits par k plus proches voisins
% fonction kppv.m
%--------------------------------------------------------------------------
function [Partition] = kppv(DataA,DataT,labelA,labelT,K,ListeClass)

[Na,~] = size(DataA);
[Nt,~] = size(DataT);

Nt_test = Nt/100; % A changer, pouvant aller de 1 jusqu'à Nt

% Initialisation du vecteur d'étiquetage des images tests
Partition = zeros(Nt_test,1);

disp(['Classification des images test dans ' num2str(length(ListeClass)) ' classes'])
disp(['par la methode des ' num2str(K) ' plus proches voisins:'])

% Boucle sur les vecteurs test de l'ensemble de l'évaluation
for i = 1:Nt_test

disp(['image test n°' num2str(i)])

% Calcul des distances entre les vecteurs de test
% et les vecteurs d'apprentissage (voisins)
distances = vecnorm(((ones(Na, 1) * DataT(i, :)) - DataA)')';

% On ne garde que les indices des K + proches voisins
[~, indices] = sort(distances);
voisins = indices(1:K);

% Comptage du nombre de voisins appartenant à chaque classe
labels = labelA(voisins);
compte = histc(labels, ListeClass);

% Recherche de la classe contenant le maximum de voisins
[valeurMax, indiceClasse] = max(compte);

% Si l'image test a le plus grand nombre de voisins dans plusieurs
% classes différentes, alors on lui assigne celle du voisin le + proche,
% sinon on lui assigne l'unique classe contenant le plus de voisins
if length(find(compte == valeurMax)) > 1
classe = labelA(voisins(1));
else
classe = ListeClass(indiceClasse);
end

% Assignation de l'étiquette correspondant à la classe trouvée au point
% correspondant à la i-ème image test dans le vecteur "Partition"
Partition(i) = classe;

end
% Calcul de la matrice de confusion et du taux d'erreur

confusion = zeros(length(ListeClass));

for i = 1:Nt_test

confusion(labelT(i)+1, Partition(i)+1) = confusion(labelT(i)+1, Partition(i)+1) + 1;

end

taux = (Nt_test - sum(diag(confusion))) / Nt_test;

disp('Matrice de confusion :')
disp(confusion)
disp(['Taux d''erreur :' num2str(taux)])
end
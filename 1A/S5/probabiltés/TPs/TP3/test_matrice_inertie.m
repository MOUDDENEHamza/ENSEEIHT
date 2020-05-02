[J,I] = meshgrid(1:5,1:5);
G_norme = I+J;
E = [ 1 2 ; 2 2 ; 2 3 ; 3 3 ; 3 4 ; 3 5 ];
indices_E = sub2ind(size(G_norme),E(:,1),E(:,2));

[C_x,C_y,M] = matrice_inertie(E(:,2),E(:,1),G_norme(indices_E));

eps = 0.0001;
if abs(C_x-3.4848)<eps & abs(C_y-2.5455)<eps & abs(M(1,1)-1.1589)<eps & abs(M(1,2)-0.5234)<eps & abs(M(2,2)-0.4298)<eps
	fprintf('La fonction matrice_inertie semble correcte !\n');
else
	fprintf('Attention : probleme !!!\n');
end
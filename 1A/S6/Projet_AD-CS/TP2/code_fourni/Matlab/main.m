clear all;clc
% tolérance
eps = 1e-8;
% nombre d'iterations max pour atteindre la convergence (si i > maxit, l'algo échoue)
maxit = 300; 

% Géneration d'une matrice rectangulaire aléatoire A de taille (n x p)
n = 1000; p = 50;

% ré-initialisation du générateur aléatoire (enlever ligne pour avoir une
% matrice différente à chaque appel
randn('state', 0);

A = 5*randn(n,p);
% AAt, AtA : équations normales de la matrice A
AAt = A*A';
AtA = A'*A;



% appel a eig de matlab : calcul de toutes les valeurs propres
t_v =  cputime;
[VA, DA] = eig(AAt);
t_v = cputime-t_v;
fprintf('eig : Temps eig = %0.3e\n',t_v);
[WA, indices] = sort(diag(DA), 'descend');
VA = VA(:, indices);

% test avec votre puissance itérée
%
%
%
%

% nombre de valeurs propres cherchées (v0) 
% ou taille du sous-espace (V1 et v2)
m = 40;

% pour comparer les différentes versions 
% on veut  que le V (généré aléatoirement) soit le même
% on sauvegarde la valeur du générateur aléatoire
s = rng;

t_v0 =  cputime;
[W0, V0, it1, flag0] = subspace_iter_v0(AAt, m, eps, maxit);
t_v0 = cputime-t_v0;
q0 = norm(W0 - WA(1:m))/norm(WA);
flag0

for i = 1:m
    qv0(i) = norm(AAt*V0(:,i) - W0(i)*V0(:,i))/norm(W0(i));
end

fprintf('iter0 : Temps v0 = %0.3e\n',t_v0);
fprintf('iter0 : Qualité de la solution valeurs propres / eig = %0.3e\n',q0);
fprintf('iter0 : Qualité de la solution couple propres = [%0.3e - %0.3e]\n', min(qv0), max(qv0));


% pourcentage de la trace que l'on veut atteindre
percentage = 0.5;

% on ré-initialise la valeur du générateur aléatoire avec la valeur sauvée
rng(s);

t_v1 =  cputime;
[ W1, V1, n_ev1, k1, flag1 ] = subspace_iter_v1( AAt, m, percentage, eps, maxit );
t_v1 = cputime-t_v1;

q1 =  norm(W1 - WA(1:n_ev1))/norm(WA);
n_ev1
k1
flag1

for i = 1:n_ev1
    qv1(i) = norm(AAt*V1(:,i) - W1(i)*V1(:,i))/norm(W1(i));
end

fprintf('iter1 : Temps v1 = %0.3e\n',t_v1);
fprintf('iter1 : Qualité de la solution valeurs propres / eig = %0.3e\n',q1);
fprintf('iter1 : Qualité de la solution couple propres = [%0.3e - %0.3e]\n', min(qv1), max(qv1));

% on ré-initialise la valeur du générateur aléatoire avec la valeur sauvée
rng(s);

% nombre de produits par itération (approche bloc)
nbprod = 5;
t_v2 =  cputime;
[ W2, V2, n_ev2, k2, flag2 ] = subspace_iter_v2( AAt, m, percentage, nbprod, eps, maxit );
t_v2 = cputime-t_v2;
q2 = norm(W2 - WA(1:n_ev2))/norm(WA);
n_ev2
k2
flag2
for i = 1:n_ev2
    qv2(i) = norm(AAt*V2(:,i) - W2(i)*V2(:,i))/norm(W2(i));
end
fprintf('iter2 : Temps v2 = %0.3e\n', t_v2);
fprintf('iter2 : Qualité de la solution valeurs propres / eig = %0.3e\n',q2);
fprintf('iter2 : Qualité de la solution couple propres = [%0.3e - %0.3e]\n', min(qv2), max(qv2));

% même chose avec AtA
% ...

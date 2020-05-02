clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Definition d'un alphabet ASCII avec les lettres A..Z, a..z, les chiffres 1..9 et la ponctuation :
taille_alphabet = 128;
codes_ASCII = transpose(0:taille_alphabet-1);		% Vecteur (colonne) de codes ASCII
alphabet = char(codes_ASCII);				% Vecteur de caracteres ASCII

% Texte ecrit en francais :
texte = 'Ceci est un texte en Francais. Il contient des lettres (majuscules et minuscules), des chiffres de zero (0) a neuf (9) et quelques caracteres de ponctuation comme la virgule (,), le point (.), les deux points (:) etc. Par contre il ne contient pas de caractere accentue, de guillemets, dapostrophe ou de cedille, qui ne sont pas des caracteres ASCII standards. Il sert simplement a illustrer la loi de probabilite de lalphabet francais. En fait nimporte quel texte convient, du moment quil soit assez long pour illustrer la langue francaise. Du coup on met bout a bout des phrases sans reel lien logique, mais qui permettront dobtenir un histogramme assez representatif de la langue francaise. Normalement le caractere le plus present est lespace, suivi du e, du s, a, i, t... Ce genre dhistogramme est tres utile en cryptographie : chaque langue possede son propre histogramme, ce qui permet de reconnaitre la langue dun texte code meme si les lettres ont ete changees. Evidemment, un bon outil de cryptographie fera en sorte de ne pas chiffrer deux occurrences dune meme lettre de la meme facon, sinon ce serait trop simple ! Pour finir ce texte, jajoute un k et un w, parce quil ny en avait pas encore.';

% Affichage du texte :
fprintf('Texte : %s\n',texte);

% Frequences relatives des lettres dans le texte :
frequences = calcul_frequences(texte,alphabet);

% Selection des caracteres de frequences non nulles :
[selection_frequences,selection_alphabet] = selection(frequences,alphabet);

% Tri des caracteres par frequences decroissantes :
[frequences_triees,indices_frequences_triees] = tri(selection_frequences);

% Histogramme des frequences des differents caracteres :
figure('Name','Histogramme des caracteres du texte','Position',[0.33*L,0,0.67*L,H]);
bar(frequences_triees);
set(gca,'XTick',[1:length(alphabet)]);
set(gca,'XTickLabel',selection_alphabet(indices_frequences_triees));
xlabel('Alphabet','FontSize',15);
ylabel('Frequence','FontSize',15);
set(gca,'FontSize',20);

save exercice_Matlab;

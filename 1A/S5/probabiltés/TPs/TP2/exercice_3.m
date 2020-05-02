clear;
close all;

% Definition d'un alphabet ASCII avec les lettres A..Z, a..z, les chiffres 1..9 et la ponctuation :
taille_alphabet = 128;
codes_ASCII = transpose(0:taille_alphabet-1);		% Vecteur (colonne) de codes ASCII
alphabet = char(codes_ASCII);				% Vecteur de caracteres ASCII

% Texte a encoder :
texte = 'Taratatatsointsoin';

% Affichage du texte :
fprintf('Texte : %s\n',texte);

% Frequences d'apparition des lettres dans le texte :
frequences = calcul_frequences(texte,alphabet);

% Selection des caracteres de frequences non nulles :
[selection_frequences,selection_alphabet] = selection(frequences,alphabet);

% Partitionnement de l'intervalle [0,1] :
bornes = partitionnement(selection_frequences);

% Codage arithmetique :
[borne_inf,borne_sup] = codage_arithmetique(texte,selection_alphabet,bornes);

% Choix (arbitraire) d'un nombre compris dans l'intervalle [borne_inf,borne_sup] pour encoder le texte :
k = 1;
while (floor(k*borne_inf)==floor(k*borne_sup))
	k = 10*k;	
end
texte_encode = floor(k*borne_sup)/k;
fprintf('Texte encode : %.15f\n',texte_encode);

% Decodage du texte encode :
texte_decode = '';
texte_encode_courant = texte_encode;
for i = 1:length(texte)
	c = find((texte_encode_courant>bornes(1,:))&(texte_encode_courant<bornes(2,:)));	% Identification du caractere
	texte_decode = [texte_decode selection_alphabet(c)];				% Concatenation du caractere
	texte_encode_courant = (texte_encode_courant-bornes(1,c))/selection_frequences(c);	% Soustraction de la borne inferieure et division par la probabilite pour obtenir le caractere suivant
end
fprintf('Texte decode : %s\n',texte_decode);

% Calcul du nombre de bits necessaires pour encoder la partie decimale :
dec_texte_encode = texte_encode*k;					% Partie decimale
nb_bits_codage_arithmetique = length(dec2bin(dec_texte_encode));	% Conversion de la partie decimale en binaire (dec2bin)
fprintf('Nombre de bits du codage arithmetique : %d\n',nb_bits_codage_arithmetique);

% Comparaison avec le codage de Huffman :
dico = huffmandict(num2cell(selection_alphabet),selection_frequences);
texte_encode = huffmanenco(texte,dico);
nb_bits_codage_Huffman = length(texte_encode);
fprintf('Nombre de bits du codage de Huffman : %d\n',nb_bits_codage_Huffman);

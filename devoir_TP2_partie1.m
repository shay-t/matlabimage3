
%%question1
% la fonction imread permet de lire le contenu d'une image, on recupere les informations de l'image 
%et l'on stocke dans la matrice I.
I = imread ('circuit.tif');
%question 2
histo = imhist(I,256); %The imhist function returns the histogram
figure(1);
%question3
plot(histo); 

%question 4
%Exploitation de l'histogramme en effectuant plusieurs operations:

%Recadrage de la dynamique de l'image 
J = imadjust(I);   %d'ajuster les valeurs de l'intensité ou la palette de couleurs d'une image 
%Egalisation de l'histogramme 
K = histeq(I,256); %accentuer le contraste
%Egalisation adaptive d'histogrammes 
L = adapthisteq(I);  %adaptation avec histogramme à contraste limité
%affichage de toutes les images avec subplot
figure(2);
subplot(2,2,1) ; imshow(I) ; title('originiale');
subplot(2,2,2) ; imshow(J) ; title('Recadrage dynamique');
subplot(2,2,3) ; imshow(K) ; title('Egalisation');
subplot(2,2,4) ; imshow(L) ; title('Egalisation adaptive');

%question5
%Seuillage
[l,c]=size(I);
img=I;
seuil=100;
for i=1:l
    for j=1:c
        if(img(i,j)>100)
            img(i,j)=255;
        else
            img(i,j)=0;
        end
    end
end 
figure(4);imshow(img);
result=(I>0.5).*I;
%question6
subplot(1,3,2);imshow(result);

%question 8
%on peut ecrire im2bw(I, X); où X est le niveau de seuillage
subplot(1,3,3);imshow(imbinarize(I));
M = im2bw(I); %convertir en image binaire basée sur un seuil
figure(3);
subplot(2,2,1) ; imshow(I) ; title('originiale');
subplot(2,2,2) ; imshow(M) ; title('image binarisée');

%question 9
M1= im2bw(I, 0.5); %convertir en image binaire basée sur un seuil
figure(4);
subplot(2,2,1) ; imshow(I) ; title('originiale');
subplot(2,2,2) ; imshow(M1) ;

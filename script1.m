%filtrage non-linéaire
I = imread("eight.tif");
%ajouter un bruit salt & peper
I1 = imnoise(I,'salt & pepper');
%ajouter bruit gaussien 
I2 = imnoise(I,'gaussian');
%creation de filtre moyenneur->filtre passe bas ->diminution de bruit
%ones ->matrice de 1
h=1/9*ones(3);
%conv2ou filter
I3=conv2(I1,h);
I4=conv2(I2,h);
figure(1);
subplot(2,2,1);imshow(I1);title("avec bruit salt & peper");
subplot(2,2,2);imshow(I2);title("avec bruit gaussien");
%uint8 -> rend la convolution image
subplot(2,2,3);imshow(uint8(I3));title("filtre moyenneur avec s&p");
subplot(2,2,4);imshow(uint8(I4));title("filtre moyenneur avec gaus");
%creation de filtre mediane ->non lineaire->car image positif
%->filtre passe bas->diminuer le bruit -> donne une image directement
I1med=medfilt2(I1);
I2med=medfilt2(I2);
figure(2)
subplot(2,2,1);imshow(I1);title("avec bruit salt & peper");
subplot(2,2,2);imshow(I2);title("avec bruit gaussien");
%uint8 -> rend la convolution image
subplot(2,2,3);imshow(I1med);title("filtre mediane avec s&p");
subplot(2,2,4);imshow(I2med);title("filtre mediane avec gaus");
%F=ones(3)  ;
%pour la creation de nimporte quel filtre
%h=fspecial('average');
%h = fspecial(type)
%h = fspecial('average',hsize)
%h = fspecial('disk',radius)
%h = fspecial('gaussian',hsize,sigma)
%h = fspecial('laplacian',alpha)
%h = fspecial('log',hsize,sigma)
%h = fspecial('motion',len,theta)
%h = fspecial('prewitt')
%h = fspecial('sobel')
% I=imread('eight.tif');
% %I =rgb2gray(I);
% figure ,imshow(I);
%    F=ones(3)  
% img =imfilter(I,F);
% figure ,imshow(img);
%con2(I1,h);
%sigma aij <255->valeur deux fois kber men la taille

%filtre lineaire ->can be done with convolution
%filtre lineaire ->utliser ones avec un coeff superieur taille 3-< utliser
%1/12
%for exemple average
Im=imread('eight.tif');
%I =rgb2gray(I);->non necessaire
F=ones(3);
%wa9ila average hiya la moyenne
h=fspecial('average'); 
img =imfilter(Im,h);
figure(3),
subplot(2,1,1);imshow(Im);title("avant filtrage");
subplot(2,1,2);imshow(uint8(img));title("apres filtrage");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lg=imread('eight.tif');
h1=fspecial('average'); 
h2=fspecial('laplacian'); 
h3=fspecial('log'); 
h4=fspecial('prewitt'); 
h5=fspecial('sobel'); 
img1 =imfilter(lg,h1);
img2 =imfilter(lg,h2);
img3 =imfilter(lg,h3);
img4 =imfilter(lg,h4);
img5 =imfilter(lg,h5);
figure(4),
subplot(2,3,1);imshow(lg);title("image originale");
subplot(2,3,2);imshow(img1);title("filtre average");
subplot(2,3,3);imshow(img2);title("filtre Laplacian");
subplot(2,3,4);imshow(img3);title("filtre log");
subplot(2,3,5);imshow(img4);title("filtre prewitt");
%sobel et prewitt ->contour
subplot(2,3,6);imshow(img5);title("filtre sobel");
%modifier la taille: log , average, gaussienne
%rayon 2
h7=fspecial('log',5); 
h8=fspecial('gaussian',5);
h9=fspecial('average',5);
h10=fspecial('gaussian');
%pas besoin de caster avec mfilter
img6=imfilter(lg,h7);
img7=imfilter(lg,h8);
img8=imfilter(lg,h9);
img9=imfilter(lg,h10);
%par defaut rayon1
figure(5);
subplot(2,3,1);imshow(img3);title("filtre log");
subplot(2,3,2);imshow(img6);title("filtre log rayon2");
subplot(2,3,3);imshow(img1);title("filtre average");
subplot(2,3,4);imshow(img8);title("filtre average rayon2");
subplot(2,3,5);imshow(img7);title("filtre gaussienne");
subplot(2,3,6);imshow(img7);title("filtre gaussienne rayon2");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%utilisation de limage lg
%filtre moyenneur filter2(h,x,shape);
img10=filter2(h,lg,'same');
img11=filter2(h,lg,'valid');
img12=filter2(h,lg,'full');
figure(6);
subplot(1,3,1);imshow(uint8(img10));title("same");
subplot(1,3,2);imshow(uint8(img11));title("valid");
subplot(1,3,3);imshow(uint8(img12));title("full");
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%declaration matrice
a=[0 -1 0;-1 5 -1;0 -1 0];
resultat=conv2(lg,a);
figure(7);
imshow(uint8(img10));title("resultat");
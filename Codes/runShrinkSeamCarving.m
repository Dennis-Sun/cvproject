img = imread('~/Dropbox/CS766/Programs/waterfall.png');
addpath('~/Dropbox/CS766/Seam-Carving-Matlab-master/')
% Normalizzazione dell'immagine (range double [0..1])
normalized = normalize( img );

% Parametri della funzione per il resizing
energyMethod = 0;           % metodo da usare nella funzione "imenergy"
num_rows_removed = 100;     % numero di righe da rimuovere
num_cols_removed = 100;     % numero di colonne da rimuovere

% chiamando la funzione "shrink_SeamCarving" viene creata l'immagine ridimensionata
carved = shrink_SeamCarving(normalized,num_rows_removed,num_cols_removed,energyMethod);


E = imenergy(normalized,energyMethod);
S=Vseam(E);

J = rm_Vseam(normalized,S);

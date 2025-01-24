library(terra)
#il pacchetto terra mi permette di manipolare dati geografici (spaziali) nella forma di raster e vettori.
library(imageRy)
#il pacchetto imageRy permette di manipolare e analizzare immagini raster, utile per immagini satellitari, utile perché si può usare insieme al pacchetto terra
library(viridisLite)
library(viridis)
# questi due pacchetti forniscono una palette di colori che possono essere visti facilmente anche per i daltonici, ottimizzando così la visualizzazione delle immagini
library(ggplot2)
# il pacchetto ggplot2 permette di creare grafici personalizzati e complessi, utile per confrontare le variazioni temporali
library(patchwork) 
#Del pacchetto terra la funzione area viene mascherata da quella del pacchetto patchwork
# il pacchetto patchwork è utile per disporre i grafici creati tramite ggplot2, organizza i grafici creando layout precisi, permette la composizione di più grafici e allo stesso tempo la loro analisi
library(ggfortify)
#semplifica la visualizzazione di analisi multivariate (es. Analisi delle Componenti Principali = PCA) in relazione ai grafici di ggplot2


#Anno 2020
list.files("C:/Users/kiko9/Downloads/esametele/2020")
#list.files() è una funzione di R che mi permette di elencare tutti i files presenti nella directory che io ho specificato, quindi come output ci saranno tutti i nomi dei file presenti nella cartella
#imposto ora la directory su cui lavorerò, dove R prenderà i files, la cartella del mio computer con la funzione setwd()
setwd("C:/Users/kiko9/Downloads/esametele/2020")
Banda02_2020 <- rast ("2020-05-25-00_00_2020-05-25-23_59_Sentinel-2_L1C_B02_(Raw).tiff") 
#la funzione rast() è una funzione del pacchetto terra e serve a caricare un oggetto raster su R
# creo un oggetto Banda02_2020 attraverso l'assegnazione <- 
#mi importo la banda 2 dell'immagine Sentinel-2, la banda 2 di Sentinel corrisponde alla banda del blu, con una lunghezza d'onda: 490 nm
#metto le virgolette perché sono presenti nel nome completo dell'immagine
Banda03_2020 <- rast ("2020-05-25-00_00_2020-05-25-23_59_Sentinel-2_L1C_B03_(Raw).tiff")
#Carico attraverso la funzione rast() la Banda numero 3 del satellite Sentinel-2 che corrisponde alla banda del verde, creo un oggetto Banda03_2020 attraverso l'assegnazione <-
#La banda del Verde ha una lunghezza d'onda di 560 nm
Banda04_2020 <- rast ("2020-05-25-00_00_2020-05-25-23_59_Sentinel-2_L1C_B04_(Raw).tiff")
#Carico la Banda numero 4 che rappresenta la banda del rosso. Lunghezza d'onda: 665 nm.
Banda08_2020 <- rast ("2020-05-25-00_00_2020-05-25-23_59_Sentinel-2_L1C_B08_(Raw).tiff")
#La banda numero 8 è il NIR= Near InfraRed, Vicino Infrarosso. Lunghezza d'onda: 842 nm.
Banda8A_2020 <- rast ("2020-05-25-00_00_2020-05-25-23_59_Sentinel-2_L1C_B8A_(Raw).tiff")
#La Banda 8A rappresenta il Narrow NIR, è una parte specifica dell'infrarosso vicino, ha una lunghezza d'onda centrata a 865 nm; offre maggiori dettagli rispetto alla banda del NIR
Banda12_2020 <- rast ("2020-05-25-00_00_2020-05-25-23_59_Sentinel-2_L1C_B12_(Raw).tiff")
#La Banda 12 rappresenta la banda SWIR= Short Wave Infrared, è un sottoinsieme della banda dell'infrarosso, molto utile perché differenzia bene l'acqua dalla vegetazione (2190 nm)
#utile per identificare superfici umide
#questo procedimento lo faccio per tutti gli anni presi in esame
# Anno 2021
list.files("C:/Users/kiko9/Downloads/esametele/2021")
setwd("C:/Users/kiko9/Downloads/esametele/2021")
Banda02_2021 <- rast ("2021-05-20-00_00_2021-05-20-23_59_Sentinel-2_L1C_B02_(Raw).tiff")
Banda03_2021 <- rast ("2021-05-20-00_00_2021-05-20-23_59_Sentinel-2_L1C_B03_(Raw).tiff")
Banda04_2021 <- rast ("2021-05-20-00_00_2021-05-20-23_59_Sentinel-2_L1C_B04_(Raw).tiff")
Banda08_2021 <- rast ("2021-05-20-00_00_2021-05-20-23_59_Sentinel-2_L1C_B08_(Raw).tiff")
Banda8A_2021 <- rast ("2021-05-20-00_00_2021-05-20-23_59_Sentinel-2_L1C_B8A_(Raw).tiff")
Banda12_2021 <- rast ("2021-05-20-00_00_2021-05-20-23_59_Sentinel-2_L1C_B12_(Raw).tiff")
#Anno 2022
list.files("C:/Users/kiko9/Downloads/esametele/2022")
setwd("C:/Users/kiko9/Downloads/esametele/2022")
Banda02_2022 <- rast ("2022-05-28-00_00_2022-05-28-23_59_Sentinel-2_L1C_B02_(Raw).tiff")
Banda03_2022 <- rast ("2022-05-28-00_00_2022-05-28-23_59_Sentinel-2_L1C_B03_(Raw).tiff")
Banda04_2022 <- rast ("2022-05-28-00_00_2022-05-28-23_59_Sentinel-2_L1C_B04_(Raw).tiff")
Banda08_2022 <- rast ("2022-05-28-00_00_2022-05-28-23_59_Sentinel-2_L1C_B08_(Raw).tiff")
Banda8A_2022 <- rast ("2022-05-28-00_00_2022-05-28-23_59_Sentinel-2_L1C_B8A_(Raw).tiff")
Banda12_2022 <- rast ("2022-05-28-00_00_2022-05-28-23_59_Sentinel-2_L1C_B12_(Raw).tiff")
#Anno 2023
list.files("C:/Users/kiko9/Downloads/esametele/2023")
setwd("C:/Users/kiko9/Downloads/esametele/2023")
Banda02_2023 <- rast ("2023-05-23-00_00_2023-05-23-23_59_Sentinel-2_L1C_B02_(Raw).tiff")
Banda03_2023 <- rast ("2023-05-23-00_00_2023-05-23-23_59_Sentinel-2_L1C_B03_(Raw).tiff")
Banda04_2023 <- rast ("2023-05-23-00_00_2023-05-23-23_59_Sentinel-2_L1C_B04_(Raw).tiff")
Banda08_2023 <- rast ("2023-05-23-00_00_2023-05-23-23_59_Sentinel-2_L1C_B08_(Raw).tiff")
Banda8A_2023 <- rast ("2023-05-23-00_00_2023-05-23-23_59_Sentinel-2_L1C_B8A_(Raw).tiff")
Banda12_2023 <- rast ("2023-05-23-00_00_2023-05-23-23_59_Sentinel-2_L1C_B12_(Raw).tiff")
#Anno 2024
list.files("C:/Users/kiko9/Downloads/esametele/2024")
setwd("C:/Users/kiko9/Downloads/esametele/2024")
Banda02_2024 <- rast ("2024-05-24-00_00_2024-05-24-23_59_Sentinel-2_L1C_B02_(Raw).tiff")
Banda03_2024 <- rast ("2024-05-24-00_00_2024-05-24-23_59_Sentinel-2_L1C_B03_(Raw).tiff")
Banda04_2024 <- rast ("2024-05-24-00_00_2024-05-24-23_59_Sentinel-2_L1C_B04_(Raw).tiff")
Banda08_2024 <- rast ("2024-05-24-00_00_2024-05-24-23_59_Sentinel-2_L1C_B08_(Raw).tiff")
Banda8A_2024 <- rast ("2024-05-24-00_00_2024-05-24-23_59_Sentinel-2_L1C_B8A_(Raw).tiff")
Banda12_2024 <- rast ("2024-05-24-00_00_2024-05-24-23_59_Sentinel-2_L1C_B12_(Raw).tiff")

#Calcolo degli indici spettrali e clusterizzazione per l'anno 2020

setwd("C:/Users/kiko9/Downloads/esametele/2020")
list.files("C:/Users/kiko9/Downloads/esametele/2020")
#reimposto la directory per l'anno 2020 e vedo la lista dei files presenti nella cartella

TRUECOL_2020 <- rast("2020-05-25-00_00_2020-05-25-23_59_Sentinel-2_L1C_True_color.tiff")
#attraverso la funzione rast() mi creo un nuovo oggetto importandomi l'immagine a colori naturali di Sentinel-2
plot(TRUECOL_2020)
#con plot() funzione di R e poi esteso anche a terra, mi permette di visualizzare le immagini raster plottandole
#avrò una visualizzazione dell'immagine a colori naturali dell'area presa per l'anno 2020

#mi posso creare una immagine a falsi colori mettendo insieme le varie bande
# composizione di una immagine in falsi colori SWIR-NIR-Rosso 
stack_2020 <- c(Banda12_2020, Banda08_2020, Banda04_2020)
# c() mi permette di concatenare gli argomenti in un unico vettore/oggetto
im.plotRGB(stack_2020, r=1, g=2, b=3) 
#im.plotRGB() è una funzione del pacchetto imageRy che plotta una immagine RGB partendo da un oggetto SpatRaster
#R= al posto della banda del rosso se la posizione è 1 vorrà dire che avrò la Banda 12 dello SWIR; G= verde, posizionerò la banda 8 del NIR; b= al posto del blu avrò la banda 4, del rosso
#l'acqua assorbe molto nello SWIR e NIR, apparità nera (ha una bassa riflettanza)
#La vegetazione sana riflette fortemente nel NIR, moderatamente nel rosso e poco nello SWIR. Appare verde brillante, gialla o rosa a seconda della salute e del tipo di vegetazione
#Il suolo nudo e le zone urbane riflettono moderatamente nello SWIR, NIR e rosso, appaiono viola/fucsia

#creo un multiframe per mettere vicino le due immagini, quella a colori naturali e l'altra false color
par(mfrow=c(1,2))
#la funzione par() mi permette di modificare e creare grafici impostando un layout
#mfrow= divide la finestra grafica in una griglia (righe x colonne)
plot(TRUECOL_2020)
im.plotRGB(stack_2020, 1, 2, 3)
dev.off()
#dev.off() mi permette di chiudere il layout grafico che avevo impostato. come se mi "ripulisse" la console dai grafici


#calcolo dell'indice NDVI=Normalized Difference Vegetation Index: usa le bande NIR e rosso
#monitora la salute e la densità della vegetazione
NDVI_2020 <- (Banda08_2020 - Banda04_2020) / (Banda08_2020 + Banda04_2020)
summary(NDVI_2020)
#la funzione summary() permette di avere un riepilogo statistico dei valori di NDVI
# mi permette di verificare se i valori calcolati rientrano nell'intervallo atteso (-1 a 1).
# analizzando la distribuzione dei valori posso decidere il valore soglia più appropriato
plot(NDVI_2020)
#attraverso la funzione plot() mi permette di visualizzare l'indice NDVI plottando l'immagine
veg_mask_2020 <- NDVI_2020 > 0.3
#creo una maschera della vegetazione, che mi permette di distinguere i pixel che rappresentano la vegetazione e quelli che non la rappresentano
# dopo l'assegnazione imposto un valore soglia dell'indice NDVI > 0.3, perché sopra questo valore ritroviamo una vegetazione sana
plot(veg_mask_2020, main = "Maschera Vegetazione 2020")
#con FALSE abbiamo tutti quei pixels che non rappresentano la vegetazione; con TRUE sono contati tutti quei pixels che presentano vegetazione

# clusterizzazione dell'immagine dividendola in classi
# anno 2020
# calcolo l'indice NDWI = Normalize Difference Water Index. Monitora la quantità di acqua superficiale
#per essere calcolato c'è bisogno della banda del verde e del NIR, ovvero del vicino infrarosso
NDWI_2020 <-  (Banda03_2020 - Banda08_2020) / (Banda03_2020 + Banda08_2020)
summary(NDWI_2020)
plot(NDWI_2020)
#valori > 0 indicano generalmente la presenza di acqua
#per creare le classi creo una matrice di dati, in cui all'interno metterò proprio gli intervalli numerici per ogni classe, voglio specificare gli intervalli
# con la funzione matrix() creo la matrice di dati
#definisco così le soglie per la classificazione
mcl <- matrix(c(
  -Inf, -0.6, 1,   # Classe 1: Urbano o suolo molto secco # Riga 1: Valori da -Inf a -0.6 saranno classificati come 1
  -0.6, -0.4, 2,   # Classe 2: Suolo secco/nudo # Riga 2: Valori da -0.6 a -0.4 saranno classificati come 2
  -0.4, 0, 3,      # Classe 3: Vegetazione scarsa  # Riga 3: Valori da -0.4 a 0 saranno classificati come 3
  0, 0.2, 4,       # Classe 4: Vegetazione ricca o aree umide # Riga 4: Valori da 0 a 0.2 saranno classificati come 4
  0.2, Inf, 5      # Classe 5: Acqua # Riga 5: Valori da 0.2 a Inf saranno classificati come 5
), nrow=5, ncol = 3, byrow = TRUE)

# c() mi permette di creare un vettore, essendoci più valori da immettere all'interno della matrice. 
#nrow= specifico il numero di righe della matrice, posso anche ometterlo
#ncol = specifico il numero di colonne della matrice
#byrow: specifico se i dati devono essere riempiti per riga (TRUE) o per colonna (FALSE, default).
 
classified_2020 <- classify(NDWI_2020, mcl)
#mi classifica il raster
#la funzione classify() di terra mi permette di applicare la classificazione sull'indice NDWI usando le soglie/ gli intervalli numerici presenti in mcl, formandomi così un oggetto con 5 classi
plot(classified_2020, col = viridis(100), main = "Classificazione 2020")
# la colorazione di questa immagine classificata, con 5 classi, col= viridis(100), ovvero 100 tonalità della palette viridis (colori che vanno dal blu scuro al giallo) del pacchetto viridis
#mai= mi permette di scrivere il titolo principale del grafico

# calcolo la frequenza e la percentuale delle varie classi

FreqClass_2020 <- freq(classified_2020)
#attraverso la funzione freq() del pacchetto terra, mi calcolo il numero di pixel per ciascuna classe
FreqClass_2020
# per la 1° classe: 146896; 2° classe: 697564; 3° classe: 501171; 4° classe: 1024; 5° classe:  845 pixels

tot2020 <- ncell(NDWI_2020)
#ncell() = restituisce il numero totale di celle (quindi di pixel) del raster.
tot2020
#il numero di pixels del raster NDWI_2020 sono 1347500
#la proporzione è la frequenza di ua classe diviso il totale
prop2020 = FreqClass_2020 / tot2020
prop2020
# La 1° classe: 0.1090137291 10.90%; 2° classe: 0.5176727273 51.77%; 3° classe: 0.3719265306  37.19%; 4° classe: 0.0007599258 0.08%; 5° classe: 0.0006270872 0.06%
dev.off()


#Calcolo degli indici spettrali e clusterizzazione anno 2021
setwd("C:/Users/kiko9/Downloads/esametele/2021")
list.files("C:/Users/kiko9/Downloads/esametele/2021")

TRUECOL_2021 <- rast ("2021-05-20-00_00_2021-05-20-23_59_Sentinel-2_L1C_True_color.tiff")
plot(TRUECOL_2021)

# composizione di una immagine in falsi colori SWIR-NIR-Rosso 
stack_2021 <- c(Banda12_2021, Banda08_2021, Banda04_2021)
im.plotRGB(stack_2021, r=1, g=2, b=3) 
#R= al posto della banda del rosso se la posizione è 1 vorrà dire che avrò la Banda 12 dello SWIR; G= verde, posizionerò la banda 8 del NIR; b= al posto del blu avrò la banda 4, del rosso
#l'acqua assorbe molto nello SWIR e NIR, apparità nera (ha una bassa riflettanza)
#La vegetazione sana riflette fortemente nel NIR, moderatamente nel rosso e poco nello SWIR. Appare verde brillante o rosa a seconda della salute e del tipo di vegetazione
#Il suolo nudo e le zone urbane riflettono moderatamente nello SWIR, NIR e rosso, appaiono viola/fucsia

#creo un multiframe per mettere vicino le due immagini, quella a colori naturali e l'altra false color
par(mfrow=c(1,2))
plot(TRUECOL_2021)
im.plotRGB(stack_2021, 1, 2, 3)
dev.off()

#calcolo NDVI
NDVI_2021 <- (Banda08_2021 - Banda04_2021) / (Banda08_2021 + Banda04_2021)
summary(NDVI_2021)
plot(NDVI_2021)
veg_mask_2021 <- NDVI_2021 > 0.3
plot(veg_mask_2021, main = "Maschera Vegetazione 2021")

#classificazione in classi
#creo l'oggetto NDWI= Normalize Difference Water Index
NDWI_2021 <-  (Banda03_2021 - Banda08_2021) / (Banda03_2021 + Banda08_2021)
summary(NDWI_2021)
#con summary() vedo la distribuzione dei valori, capire se mi rientra nell'intervallo -1 a 1, e identificare gli intervalli numerici delle classi
plot(NDWI_2021)


mcl1 <- matrix(c(
  -Inf, -0.6, 1,   # Classe 1: Urbano o suolo molto secco 
  -0.6, -0.4, 2,   # Classe 2: Suolo secco/nudo 
  -0.4, 0, 3,      # Classe 3: Vegetazione scarsa  
  0, 0.2, 4,       # Classe 4: Vegetazione ricca o aree umide 
  0.2, Inf, 5      # Classe 5: Acqua
), ncol = 3, byrow = TRUE)

classified_2021 <- classify(NDWI_2021, mcl1)

plot(classified_2021, col = viridis(100), main = "Classificazione 2021")

# calcolo la frequenza e la percentuale delle varie classi

FreqClass_2021 <- freq(classified_2021)
FreqClass_2021
# per la 1° classe: 277968; 2° classe: 602088; 3° classe: 465964; 4° classe: 475; 5° classe: 1005 pixels

tot2021 <- ncell(NDWI_2021)
tot2021
#il numero di celle del raster NDWI_2021 sono 1347500 che è lo stesso di quello per NDWI_2020
#la proporzione è la frequenza diviso il totale
prop2021 = FreqClass_2021 / tot2021
prop2021
# La 1° classe: 0.2062842301 20,63%; 2° classe: 0.4468185529 44,68%; 3° classe: 0.3457988868  34,58%; 4° classe: 0.0003525046 0.04%; 5° classe: 0.0007458256 0.07%

dev.off()


#Calcolo indici anno 2022
setwd("C:/Users/kiko9/Downloads/esametele/2022")
list.files("C:/Users/kiko9/Downloads/esametele/2022")


TRUECOL_2022 <- rast ("2022-05-28-00_00_2022-05-28-23_59_Sentinel-2_L1C_True_color.tiff")
plot(TRUECOL_2022)
# composizione di una immagine in falsi colori SWIR-NIR-Rosso 
stack_2022 <- c(Banda12_2022, Banda08_2022, Banda04_2022)
im.plotRGB(stack_2022, r=1, g=2, b=3) 

#multiframe natural color-false color
par(mfrow=c(1,2))
plot(TRUECOL_2022)
im.plotRGB(stack_2022, 1, 2, 3)
dev.off()

#calcolo NDVI

NDVI_2022 <- (Banda08_2022 - Banda04_2022) / (Banda08_2022 + Banda04_2022)
summary(NDVI_2022)
plot(NDVI_2022)
veg_mask_2022 <- NDVI_2022 > 0.3
plot(veg_mask_2022, main = "Maschera Vegetazione 2022")

#classificazione in classi

NDWI_2022 <-  (Banda03_2022 - Banda08_2022) / (Banda03_2022 + Banda08_2022)
summary(NDWI_2022)
plot(NDWI_2022)

mcl2 <- matrix(c(
  -Inf, -0.6, 1,   
  -0.6, -0.4, 2,   
  -0.4, -0.2, 3,      
  -0.2, 0, 4,      
  0, Inf, 5  
), ncol = 3, byrow = TRUE)

classified_2022 <- classify (NDWI_2022, mcl2)

plot (classified_2022, col = viridis(100), main = "Classificazione 2022")

# calcolo la frequenza e la percentuale delle varie classi
FreqClass_2022 <- freq(classified_2022)
FreqClass_2022
# per la 1° classe: 46402; 2° classe: 798995; 3° classe: 453109; 4° classe: 47862; 5° classe: 1132 pixels
tot2022 <- ncell(NDWI_2022)
tot2022
#il numero di celle del raster NDWI_2022 sono sempre 1347500
#la proporzione è la frequenza diviso il totale
prop2022 = FreqClass_2022 / tot2022
prop2022
# La 1° classe: 0.0344356215 3,44%; 2° classe:  0.5929461967 59,29%; 3° classe: 0.3362589981  33,63%; 4° classe: 0.0355191095 3.55%; 5° classe: 0.0008400742 0.08%

dev.off()

#Calcolo indici spettrali e clusterizzazione anno 2023

setwd("C:/Users/kiko9/Downloads/esametele/2023")
list.files("C:/Users/kiko9/Downloads/esametele/2023")
TRUECOL_2023 <- rast ("2023-05-23-00_00_2023-05-23-23_59_Sentinel-2_L1C_True_color.tiff")
plot(TRUECOL_2023)
# composizione di una immagine in falsi colori SWIR-NIR-Rosso 
stack_2023 <- c(Banda12_2023, Banda08_2023, Banda04_2023)
im.plotRGB(stack_2023, r=1, g=2, b=3) 

#multiframe natural color-false color
par(mfrow=c(1,2))
plot(TRUECOL_2023)
im.plotRGB(stack_2023, 1, 2, 3)
dev.off()

#calcolo NDVI

NDVI_2023 <- (Banda08_2023 - Banda04_2023) / (Banda08_2023 + Banda04_2023)
summary(NDVI_2023)
plot(NDVI_2023)
veg_mask_2023 <- NDVI_2023 > 0.3
plot(veg_mask_2023, main = "Maschera Vegetazione 2023")

#classificazione in classi
#calcolo l'indice NDWI dell'anno 2023
NDWI_2023 <-  (Banda03_2023 - Banda08_2023) / (Banda03_2023 + Banda08_2023)
summary(NDWI_2023)
plot(NDWI_2023)

mcl3 <- matrix(c(
  -Inf, -0.6, 1,   # Classe 1: Urbano o suolo molto secco # Riga 1: Valori da -Inf a -0.6 saranno classificati come 1
  -0.6, -0.4, 2,   # Classe 2: Suolo secco/nudo # Riga 2: Valori da -0.6 a -0.4 saranno classificati come 2
  -0.4, 0, 3,      # Classe 3: Vegetazione scarsa  # Riga 3: Valori da -0.4 a -0.2 saranno classificati come 3
  0, 0.2, 4,       # Classe 4: Vegetazione ricca o aree umide # Riga 4: Valori da -0.2 a 0 saranno classificati come 4
  0.2, Inf, 5      # Classe 5: Acqua # Riga 5: Valori da 0 a Inf saranno classificati come 5
), ncol = 3, byrow = TRUE)
 
classified_2023 <- classify (NDWI_2023, mcl3)

plot (classified_2023, col = viridis(100), main = "Classificazione 2023")

# calcolo la frequenza e la percentuale delle varie classi

FreqClass_2023 <- freq(classified_2023)
FreqClass_2023
# per la 1° classe: 127944; 2° classe: 584629; 3° classe: 475603; 4° classe: 56444; 5° classe: 102880 pixels
tot2023 <- ncell(NDWI_2023)
tot2023
#il numero di celle del raster NDWI_2023 sono 1347500 
#la proporzione è la frequenza diviso il totale
prop2023 = FreqClass_2023 / tot2023
prop2023
# La 1° classe: 0.09494917 9.49%; 2° classe:  0.43386197 43,39%; 3° classe: 0.35295213  35,30%; 4° classe: 0.04188794 4.19%; 5° classe: 0.07634879 7.63%
dev.off()

#Calcolo indici spettrali e clusterizzazione dell'anno 2024

setwd("C:/Users/kiko9/Downloads/esametele/2024")
list.files("C:/Users/kiko9/Downloads/esametele/2024")
TRUECOL_2024 <- rast ("2024-05-24-00_00_2024-05-24-23_59_Sentinel-2_L1C_True_color.tiff")
plot(TRUECOL_2024)
# composizione di una immagine in falsi colori SWIR-NIR-Rosso 
stack_2024 <- c(Banda12_2024, Banda08_2024, Banda04_2024)
im.plotRGB(stack_2024, r=1, g=2, b=3) 

#multiframe natural color-false color
par(mfrow=c(1,2))
plot(TRUECOL_2024)
im.plotRGB(stack_2024, 1, 2, 3)
dev.off()

#calcolo NDVI
NDVI_2024 <- (Banda08_2024 - Banda04_2024) / (Banda08_2024 + Banda04_2024)
plot(NDVI_2024)
summary(NDVI_2024)
veg_mask_2024 <- NDVI_2024 > 0.3
plot(veg_mask_2024, main = "Maschera Vegetazione 2024")

#classificazione in classi
NDWI_2024 <-  (Banda03_2024 - Banda08_2024) / (Banda03_2024 + Banda08_2024)
summary(NDWI_2024)
plot(NDWI_2024)

mcl4 <- matrix(c(
  -Inf, -0.6, 1,   # Classe 1: Urbano o suolo molto secco # Riga 1: Valori da -Inf a -0.6 saranno classificati come 1
  -0.6, -0.4, 2,   # Classe 2: Suolo secco/nudo # Riga 2: Valori da -0.6 a -0.4 saranno classificati come 2
  -0.4, 0, 3,      # Classe 3: Vegetazione scarsa  # Riga 3: Valori da -0.4 a -0.2 saranno classificati come 3
  0, 0.2, 4,       # Classe 4: Vegetazione ricca o aree umide # Riga 4: Valori da -0.2 a 0 saranno classificati come 4
  0.2, Inf, 5      # Classe 5: Acqua # Riga 5: Valori da 0 a Inf saranno classificati come 5
), ncol = 3, byrow = TRUE)

classified_2024 <- classify (NDWI_2024, mcl4)

plot (classified_2024, col = viridis(100), main = "Classificazione 2024")

# calcolo la frequenza e la percentuale delle varie classi

FreqClass_2024 <- freq(classified_2024)
FreqClass_2024
# per la 1° classe: 191542; 2° classe: 728044; 3° classe: 426586; 4° classe: 385; 5° classe: 943 pixels

tot2024 <- ncell(NDWI_2024)
tot2024
#numero di celle per il raster 1347500
#la proporzione è la frequenza diviso il totale
prop2024 = FreqClass_2024 / tot2024
prop2024
# La 1° classe: 0.1421461967 14.21%; 2° classe: 0.5402923933 54,03%; 3° classe: 0.3165758813  31.66%; 4° classe: 0.0002857143 0.03%; 5° classe: 0.0006998145 0.07%
dev.off()

#creo un multiframe di 2 righe e 3 colonne in cui metterò i grafici dell'indice NDWI per tutti gli anni analizzati
par(mfrow = c(2,3))
plot(NDWI_2020, main="NDWI 2020")
plot(NDWI_2021, main="NDWI 2021")
plot(NDWI_2022, main="NDWI 2022")
plot(NDWI_2023, main="NDWI 2023")
plot(NDWI_2024, main="NDWI 2024")
dev.off()

#multiframe
par(mfrow= c(1,5))
plot(TRUECOL_2020)
plot(TRUECOL_2021)
plot(TRUECOL_2022)
plot(TRUECOL_2023)
plot(TRUECOL_2024)


# costruisco un dataframe con le % delle diverse superfici classificate.
classi <- c("nudo", "secco", "veg.scarsa", "aree.umide", "acqua")
#creo un oggetto tramite assegnazione per cui contiene nel vettore gli elementi "arido" ecc.
perc_2020 <- c(10.90, 51.77, 37.19, 0.08, 0.06)
perc_2021<- c(20.63, 44.68, 34.58, 0.04, 0.07)
perc_2022 <- c(3.44, 59.29, 33.63, 3.55, 0.08)
perc_2023 <- c(9.49, 43.39, 35.30, 4.19, 7.63)
perc_2024 <- c(14.21, 54.03, 31.66, 0.03, 0.07)
#mi riporto tutte le percentuali delle varie classi creando sempre un oggetto che combina i valori in un unico vettore tramite c()
# creo un dataframe, per cui una tabella, combinando il vettore classi e le % di ciascuna superficie
tabout <- data.frame(classi, perc_2020, perc_2021, perc_2022, perc_2023, perc_2024)
#ogni colonna è un vettore
View(tabout)
#attraverso la funzione View() posso vedere il dataframe appena creato sottoforma di tabella

#posso ora visualizzare tramite grafico questo dataframe
#la funzione ggplot() del pacchetto ggplot2 la uso per creare un grafico a barre relativo alle % dei vari anni
#però devo prima rendere la scala tra i due grafici uguale, devo mettere gli assi uguali tramite l'argomento ylim()
#l'argomento della funzione ylim() permette di specificare i limiti dell'asse y
#ylim(c(0,100))
#ci vuole c() perché sono due elementi del vettore, i limiti dell'asse y andranno da 0 a 100
bar_2020 <- ggplot(tabout, aes(x=classi, y=perc_2020, color=classi, fill= classi)) + geom_bar(stat="identity") + ylab("% di copertura 2020") + ylim(c(0,100)) 
bar_2020
#il primo grafico a barre che ho creato è per l'anno 2020 e l'ho chiamato bar_2020
#dopo la funzione ggplot() specifico che dataframe voglio considerare, per cui tabout
#attraverso l'argomento aes() collego le variabili dei dati, per cui sull'asse x avrò le classi, sull'asse y avrò le percentuali del 2020
#il color= il colore delle barre seguirà le classi, sarà diverso per ogni classe
#fill=classi, il colore di riempimento delle barre segue quello delle classi
# il + mi permette di combinare diversi layer e renderli un unico grafico
#attraverso l'argomento geom_bar() specifico che sarà un grafico a barre
#stat="identity" mi specifica che i valori della y devono essere presi direttamente dal dataset
#ylab= il nome dell'asse y, label=etichetta, sarà "% di copertura 2020"
bar_2021 <- ggplot(tabout, aes(x=classi, y=perc_2021, color=classi, fill= classi)) + geom_bar(stat="identity") + ylab("% di copertura 2021") + ylim(c(0,100))  
bar_2021
bar_2022 <- ggplot(tabout, aes(x=classi, y=perc_2022, color=classi, fill= classi)) + geom_bar(stat="identity") + ylab("% di copertura 2022") + ylim(c(0,100))  
bar_2022
bar_2023 <- ggplot(tabout, aes(x=classi, y=perc_2023, color=classi,  fill= classi)) + geom_bar(stat="identity") + ylab("% di copertura 2023") + ylim(c(0,100)) 
bar_2023
bar_2024 <- ggplot(tabout, aes(x=classi, y=perc_2024, color=classi,  fill= classi)) + geom_bar(stat="identity") + ylab("% di copertura 2024") + ylim(c(0,100))
bar_2024

#patchwork
bar_2020 + bar_2021 + bar_2022 + bar_2023 + bar_2024
#il pacchetto patchwork mi permette di combinare più grafici di ggplot2 con una semplice operazione algebrica come questa
#che in questo caso non somma i valori ma aggiunge grafici al layout 
dev.off()

# calcolo MNDWI= Modified Normalized Difference Water Index
# MNDWI  è un indice utilizzato per identificare le aree d'acqua su immagini satellitari, modificato rispetto all'NDWI classico.
# valori positivi indicano la presenza di acqua.
# valori negativi o vicini a zero indicano terreno asciutto o vegetazione.
#lo si calcola con la banda del verde e la banda dello SWIR
MNDWI_2020 <- ( Banda03_2020 - Banda12_2020) / ( Banda03_2020 + Banda12_2020)
summary(MNDWI_2020)
plot(MNDWI_2020, col=colorRampPalette(c("darkgoldenrod", "darkorange", "deepskyblue"))(100), main="MNDWI 2020")
#colorRampPalette() è una funzione che mi permette di personalizzare la palette di colori
# "darkgoldenrod" per il suolo secco, "darkorange" per le zone di transizione, "deepskyblue" per l'acqua. 100 sarebbero varie sfumature
Maschera_acqua_2020 <- MNDWI_2020 > 0.5
# il valore soglia lo sposto fino a 0.5 per ridurre la probabilità di falsi positivi come i campi agricoli ampiamente irrigati e le nuvole
#visualizzazione della maschera
plot(Maschera_acqua_2020, main="Maschera acqua 2020", legend=TRUE)
#avrò un grafico in cui avrò valori FALSE, tutti quei pixels che non sono acqua e TRUE, tutti quei pixels che rappresentano dell'acqua
#legend=TRUE mi aggiunge una legenda al grafico, potrei anche non specificarlo

#calcolo il numero di pixels classificati come "acqua" nella maschera
n_pixel_acqua_2020MNDWI <- sum(Maschera_acqua_2020[], na.rm = TRUE)
# sum() mi permette di fare la somma di tutti i pixel di Maschera_acqua_2020
#questa però è una maschera logica, [] significa che prenderei tutti i valori all'interno della maschera
#i pixels della maschera sono o 1 (TRUE) o 0 (FALSE), facendo così mi sommerà solo i valori TRUE
#na.rm = TRUE mi permette di escludere tutti i valori mancanti N.A. 
n_pixel_acqua_2020MNDWI
# Visualizzo il numero di pixel con acqua -> 1052
totMNDWI <- ncell(MNDWI_2020)
totMNDWI
# il totale è 1347500
# calcolo una % dei pixel mascherati sul totale dei pixel nell'immagine che mi indicano zone d'acqua
pMNDWI_2020 <- n_pixel_acqua_2020MNDWI/totMNDWI
pMNDWI_2020 
#la percentuale è 0.000780705 * 100 =0.08%

#Anno 2021
MNDWI_2021 <- ( Banda03_2021 - Banda12_2021) / ( Banda03_2021 + Banda12_2021)
summary(MNDWI_2021)
plot(MNDWI_2021, col=colorRampPalette(c("darkgoldenrod", "darkorange", "deepskyblue"))(100), main="MNDWI 2021")
# "darkgoldenrod" per il suolo secco, "darkorange" per le zone di transizione, "deepskyblue" per l'acqua
Maschera_acqua_2021 <- MNDWI_2021 > 0.4
# il valore soglia lo sposto  a 0.4 per ridurre la probabilità di falsi positivi come i campi agricoli ampiamente irrigati
#visualizzazione della maschera
plot(Maschera_acqua_2021, main="Maschera acqua 2021", legend=TRUE)

n_pixel_acqua_2021MNDWI <- sum(Maschera_acqua_2021[], na.rm = TRUE)
n_pixel_acqua_2021MNDWI
# Visualizzo il numero di pixel con acqua -> 2068
totMNDWI
# il totale è 1347500
# calcolo una % dei pixel mascherati sul totale dei pixel nell'immagine che mi indicano zone d'acqua
pMNDWI_2021 <- n_pixel_acqua_2021MNDWI/totMNDWI
pMNDWI_2021 
#la percentuale è 0.001534694 * 100 =  0.15%

#Anno 2022

MNDWI_2022 <- ( Banda03_2022 - Banda12_2022) / ( Banda03_2022 + Banda12_2022)
summary(MNDWI_2022)
plot(MNDWI_2022, col=colorRampPalette(c("darkgoldenrod", "darkorange", "deepskyblue"))(100), main="MNDWI 2022")
# "darkgoldenrod" per il suolo secco, "darkorange" per le zone di transizione, "deepskyblue" per l'acqua
Maschera_acqua_2022 <- MNDWI_2022 > 0.4
# il valore soglia lo sposto  a 0.4 per ridurre la probabilità di falsi positivi come i campi agricoli ampiamente irrigati
#visualizzazione della maschera
plot(Maschera_acqua_2022, main="Maschera acqua 2022", legend=TRUE)

n_pixel_acqua_2022MNDWI <- sum(Maschera_acqua_2022[], na.rm = TRUE)
n_pixel_acqua_2022MNDWI
# Visualizzo il numero di pixel con acqua -> 1171
totMNDWI
# il totale è 1347500
# calcolo una % dei pixel mascherati sul totale dei pixel nell'immagine che mi indicano zone d'acqua
pMNDWI_2022 <- n_pixel_acqua_2022MNDWI/totMNDWI
pMNDWI_2022 
#la percentuale è 0.0008690167 * 100 =  0.09%

#Anno 2023

MNDWI_2023 <- ( Banda03_2023 - Banda12_2023) / ( Banda03_2023 + Banda12_2023)
summary(MNDWI_2023)
plot(MNDWI_2023, col=colorRampPalette(c("darkgoldenrod", "darkorange", "deepskyblue"))(100), main="MNDWI 2023")
# "darkgoldenrod" per il suolo secco, "darkorange" per le zone di transizione, "deepskyblue" per l'acqua
Maschera_acqua_2023 <- MNDWI_2023 > 0.4
# il valore soglia lo sposto  a 0.4 per ridurre la probabilità di falsi positivi come i campi agricoli ampiamente irrigati
#visualizzazione della maschera
plot(Maschera_acqua_2023, main="Maschera acqua 2023", legend=TRUE)

n_pixel_acqua_2023MNDWI <- sum(Maschera_acqua_2023[], na.rm = TRUE)
n_pixel_acqua_2023MNDWI
# Visualizzo il numero di pixel con acqua -> 228831
totMNDWI
# il totale è 1347500
# calcolo una % dei pixel mascherati sul totale dei pixel nell'immagine che mi indicano zone d'acqua
pMNDWI_2023 <- n_pixel_acqua_2023MNDWI/totMNDWI
pMNDWI_2023 
#la percentuale è  0.1698189 * 100 =  16.9%

#Anno 2024

MNDWI_2024 <- ( Banda03_2024 - Banda12_2024) / ( Banda03_2024 + Banda12_2024)
summary(MNDWI_2024)
plot(MNDWI_2024, col=colorRampPalette(c("darkgoldenrod", "darkorange", "deepskyblue"))(100), main="MNDWI 2024")
# "darkgoldenrod" per il suolo secco, "darkorange" per le zone di transizione, "deepskyblue" per l'acqua
Maschera_acqua_2024 <- MNDWI_2024 > 0.4
# il valore soglia lo sposto  a 0.4 per ridurre la probabilità di falsi positivi come i campi agricoli ampiamente irrigati
#visualizzazione della maschera
plot(Maschera_acqua_2024, main="Maschera acqua 2024", legend=TRUE)

n_pixel_acqua_2024MNDWI <- sum(Maschera_acqua_2024[], na.rm = TRUE)
n_pixel_acqua_2024MNDWI
# Visualizzo il numero di pixel con acqua -> 3533
totMNDWI
# il totale è 1347500
# calcolo una % dei pixel mascherati sul totale dei pixel nell'immagine che mi indicano zone d'acqua
pMNDWI_2024 <- n_pixel_acqua_2024MNDWI/totMNDWI
pMNDWI_2024 
#la percentuale è 0.002621892 * 100 =  0.26%

dev.off()

#creo un multiframe di tutti i grafici dell'indice MNDWI e vedo come sia variato o meno nel corso degli anni
par(mfrow=c(2,3))
plot(MNDWI_2020, col=colorRampPalette(c("darkgoldenrod", "darkorange", "deepskyblue"))(100), main="MNDWI 2020")
plot(MNDWI_2021, col=colorRampPalette(c("darkgoldenrod", "darkorange", "deepskyblue"))(100), main="MNDWI 2021")
plot(MNDWI_2022, col=colorRampPalette(c("darkgoldenrod", "darkorange", "deepskyblue"))(100), main="MNDWI 2022")
plot(MNDWI_2023, col=colorRampPalette(c("darkgoldenrod", "darkorange", "deepskyblue"))(100), main="MNDWI 2023")
plot(MNDWI_2024, col=colorRampPalette(c("darkgoldenrod", "darkorange", "deepskyblue"))(100), main="MNDWI 2024")

dev.off()

#creo un multiframe con tutte le maschere create dall'indice MNDWI, graficamente vedrò in relazione tutti i pixel che presentano e non presentano acqua per i vari anni
par(mfrow=c(2,3))
plot(Maschera_acqua_2020, main="Maschera acqua 2020", legend=TRUE)
plot(Maschera_acqua_2021, main="Maschera acqua 2021", legend=TRUE)
plot(Maschera_acqua_2022, main="Maschera acqua 2022", legend=TRUE)
plot(Maschera_acqua_2023, main="Maschera acqua 2023", legend=TRUE)
plot(Maschera_acqua_2024, main="Maschera acqua 2024", legend=TRUE)

dev.off()

# differenze per vedere e analizzare come la disponibilità del volume d'acqua sia cambiata tra i vari anni

MNDWI_diff <- MNDWI_2024 - MNDWI_2023
#creo un oggetto tramite assegnazione che è la differenza dell'indice MNDWI tra l'anno 2024 e 2023
cldiff <- colorRampPalette(c("red", "white", "blue"))(100)
#creo un oggetto che mi rappresenta i colori che utilizzerò nel grafico, attraverso la funzione colorRampPalette() scelgo tre colori che mi rappresentano le transizioni, 100 sono le varie sfumatore di questi 3 colori principali
plot(MNDWI_diff, col=cldiff, main= "Differenza MNDWI 2024 - 2023")
#essendo i valori in cui è presente l'acqua > per il 2023 rispetto che per il 2024, avrò che i valori negativi rappresenteranno l'acqua
MNDWI_diffopposta <- MNDWI_2023 - MNDWI_2024
plot(MNDWI_diffopposta, col=cldiff, main= "Differenza MNDWI 2023 - 2024")
#in questo caso ho plottato la differenza mettendo prima i dati del 2023 e poi quelli del 2024, per cui avrò i valori positivi che mi rappresentano le zone d'acqua

#multiframe
par(mfrow = c(2,2))

plot(MNDWI_diff, col=cldiff, main= "Differenza MNDWI 2024 - 2023")

MNDWI_diff2 <- MNDWI_2023 - MNDWI_2022
plot(MNDWI_diff2, col=cldiff, main= "Differenza MNDWI 2023 - 2022")

MNDWI_diff3 <- MNDWI_2022 - MNDWI_2021
plot(MNDWI_diff3, col=cldiff, main= "Differenza MNDWI 2022 - 2021")

MNDWI_diff4 <- MNDWI_2021 - MNDWI_2020
plot(MNDWI_diff4, col=cldiff, main= "Differenza MNDWI 2021 - 2020")


dev.off()

par(mfrow=c(1,3))

MNDWI_diff7 <- MNDWI_2023 - MNDWI_2020
plot(MNDWI_diff7, col=cldiff, main="Differenza MNDWI 2023 - 2020")

MNDWI_diff6 <- MNDWI_2023 - MNDWI_2021
plot(MNDWI_diff6, col=cldiff, main="Differenza MNDWI 2023 - 2021")

MNDWI_diff5 <- MNDWI_2023 - MNDWI_2022
plot(MNDWI_diff5, col=cldiff, main="Differenza MNDWI 20223 - 2022")


#per alcune aree avrò valori pari a zero, colorazione bianca, in cui mi rappresenta che non c'è alcuna differenza di presenza di acqua superficiale fra i due anni presi in esame
#i valori positivi, colorazione blu, affermano che il primo anno preso in esame ha un quantitativo di acqua maggiore rispetto al secondo anno es. MNDWI 2022 > MNDWI 2021
#i valori negativi, colorazione rossa, mi dicono che il secondo anno presenta un quantitativo di acqua superiore al primo anno es. MNDWI 2021 > MNDWI 2022 uguale a dire che MNDWI 2022 < MNDWI 2021
dev.off()


# Creazione della maschera per l'indice NDWI
# riprendo il valore dell'indice NDWI per tutti gli anni NDWI= Normilize Difference Water Index
#anno 2020
NDWI_2020
summary(NDWI_2020)
plot(NDWI_2020, col=colorRampPalette(c("red", "white", "blue"))(100), main= "NDWI 2020")

NDWI_mask_2020 <- NDWI_2020 > 0 # considero solo i valori positivi acqua, filtro solo i pixel > 0 
# visualizzazione della maschera 
plot(NDWI_mask_2020, main=" NDWI Maschera 2020")
# Conta i pixel con valore TRUE (possibile presenza d'acqua) e FALSE assenza di acqua
n_pixel_acqua_2020 <- sum(NDWI_mask_2020[], na.rm = TRUE)
n_pixel_acqua_2020  
# calcolo il numero di pixel con acqua, che sono 1869
totNDWI <- ncell(NDWI_2020)
totNDWI
#il numero totale di pixel dell'immagine è 1347500
pNDWI_2020 <- n_pixel_acqua_2020/totNDWI
pNDWI_2020 
#la percentuale è 0.001387013 * 100 = 0.14%

#anno 2021

NDWI_2021
summary(NDWI_2021)
plot(NDWI_2021, col=colorRampPalette(c("red", "white", "blue"))(100), main= "NDWI 2021")
NDWI_mask_2021 <- NDWI_2021 > 0 # considero solo i valori positivi acqua, filtro solo i pixel > 0 
# visualizzazione della maschera 
plot(NDWI_mask_2021, main=" NDWI Maschera 2021")
# Conta i pixel con valore TRUE (possibile presenza d'acqua)
n_pixel_acqua_2021 <- sum(NDWI_mask_2021[], na.rm = TRUE)
n_pixel_acqua_2021  
#  il numero di pixel con acqua sono 1480
# il totale è lo stesso per tutte le immagini
totNDWI
#il numero totale di pixel dell'immagine è 1347500
pNDWI_2021 <- n_pixel_acqua_2021/totNDWI
pNDWI_2021
#la percentuale è  0.00109833 * 100 = 0.11%

#anno 2022
NDWI_2022
summary(NDWI_2022)
plot(NDWI_2022, col=colorRampPalette(c("red", "white", "blue"))(100), main= "NDWI 2022")
NDWI_mask_2022 <- NDWI_2022 > 0 # considero solo i valori positivi acqua, filtro solo i pixel > 0 
# visualizzazione della maschera 
plot(NDWI_mask_2022, main=" NDWI Maschera 2022")
# Conta i pixel con valore TRUE (possibile presenza d'acqua)
n_pixel_acqua_2022 <- sum(NDWI_mask_2022[], na.rm = TRUE)
n_pixel_acqua_2022  
# conto il numero di pixel con acqua, che sono 1132
# il totale è lo stesso per tutte le immagini
totNDWI
#il numero totale di pixel dell'immagine è 1347500
pNDWI_2022 <- n_pixel_acqua_2022/totNDWI
pNDWI_2022
#la percentuale è  0.0008400742 * 100 = 0.08%

#anno 2023
NDWI_2023
summary(NDWI_2023)
plot(NDWI_2023, col=colorRampPalette(c("red", "white", "blue"))(100), main= "NDWI 2023")
NDWI_mask_2023 <- NDWI_2023 > 0 
# visualizzazione della maschera 
plot(NDWI_mask_2023, main=" NDWI Maschera 2023")
n_pixel_acqua_2023 <- sum(NDWI_mask_2023[], na.rm = TRUE)
n_pixel_acqua_2023  
# Visualizzo il numero di pixel con acqua, che sono 159324
totNDWI
#il numero totale di pixel dell'immagine è 1347500
pNDWI_2023 <- n_pixel_acqua_2023/totNDWI
pNDWI_2023
#la percentuale è  0.1182367 * 100 = 11.8%

#anno 2024
NDWI_2024
summary(NDWI_2024)
plot(NDWI_2024, col=colorRampPalette(c("red", "white", "blue"))(100), main= "NDWI 2024")
NDWI_mask_2024 <- NDWI_2024 > 0 # considero solo i valori positivi acqua, filtro solo i pixel > 0 
# visualizzazione della maschera 
plot(NDWI_mask_2024, main=" NDWI Maschera 2024")
n_pixel_acqua_2024 <- sum(NDWI_mask_2024[], na.rm = TRUE)
n_pixel_acqua_2024  
# Visualizzo il numero di pixel con acqua, che sono 1328
totNDWI
#il numero totale di pixel dell'immagine è 1347500
pNDWI_2024 <- n_pixel_acqua_2024/totNDWI
pNDWI_2024
#la percentuale è 0.0009855288 * 100 = 0.10%

dev.off()

# WATER INDEX
#calcolo l'indice chiamato Water Index
# è la differenza tra banda del verde e banda 8A (NIR stretto)
#anno 2020
WaterIndex_2020 <- Banda03_2020 - Banda8A_2020
#valori positivi indicano la presenza di acqua
#individua la presenza di acqua e la distingue da altre superfici come vegetazione, suolo o aree urbane
plot(WaterIndex_2020, col=colorRampPalette(c("red", "white", "blue"))(100), main="Water Index 2020")
# rosso <- valori bassi (aree senza acqua); blu <- valori alti (aree con possibile frequenza acqua).
summary(WaterIndex_2020)
water_mask_2020 <- WaterIndex_2020 > 0  # Considera valori positivi come acqua e filtro solo i pixel positivi
# Visualizza la maschera
plot(water_mask_2020, main="Water Mask 2020")
# sommo ora i pixels con valore TRUE (possibile presenza d'acqua)
n_pixel_acqua_2020 <- sum(water_mask_2020[], na.rm = TRUE)
n_pixel_acqua_2020    
# Visualizzo il numero di pixel con acqua che sono 1416
totWI <- ncell(WaterIndex_2020)
totWI
#il numero totale di pixel è sempre 1347500
# calcolo una % dei pixel mascherati sul totale dei pixel nell'immagine che mi indicano zone d'acqua
pWI_2020 <- n_pixel_acqua_2020/totWI
pWI_2020 
#la percentuale è 0.001050835 * 100 = 0.10%

#anno 2021
WaterIndex_2021 <- Banda03_2021 - Banda8A_2021
plot(WaterIndex_2021, col=colorRampPalette(c("red", "white", "blue"))(100), main="Water Index 2021")
summary(WaterIndex_2021)
water_mask_2021 <- WaterIndex_2021 > 0 
plot(water_mask_2021, main="Water Mask 2021")
n_pixel_acqua_2021 <- sum(water_mask_2021[], na.rm = TRUE)
n_pixel_acqua_2021 
# Visualizzo il numero di pixel con acqua che sono 1341
totWI
#il numero totale di pixel è sempre 1347500
# calcolo una % dei pixel mascherati sul totale dei pixel nell'immagine che mi indicano zone d'acqua
pWI_2021 <- n_pixel_acqua_2021/totWI
pWI_2021
#la percentuale è 0.0009951763 * 100= 0.10%

#anno 2022
WaterIndex_2022 <- Banda03_2022 - Banda8A_2022
plot(WaterIndex_2022, col=colorRampPalette(c("red", "white", "blue"))(100), main="Water Index 2022")
summary(WaterIndex_2022)
water_mask_2022 <- WaterIndex_2022 > 0 
plot(water_mask_2022, main="Water Mask 2022")
n_pixel_acqua_2022 <- sum(water_mask_2022[], na.rm = TRUE)
n_pixel_acqua_2022
# Visualizzo il numero di pixel con acqua che sono 936
totWI
#il numero totale di pixel è sempre 1347500
# calcolo una % dei pixel mascherati sul totale dei pixel nell'immagine che mi indicano zone d'acqua
pWI_2022 <- n_pixel_acqua_2022/totWI
pWI_2022
#la percentuale è 0.0006946197 * 100= 0.07%

#anno 2023
WaterIndex_2023 <- Banda03_2023 - Banda8A_2023
plot(WaterIndex_2023, col=colorRampPalette(c("red", "white", "blue"))(100), main="Water Index 2023")
summary(WaterIndex_2023)
water_mask_2023 <- WaterIndex_2023 > 0 
plot(water_mask_2023, main="Water Mask 2023")
n_pixel_acqua_2023 <- sum(water_mask_2023[], na.rm = TRUE)
n_pixel_acqua_2023
# Visualizzo il numero di pixel con acqua che sono 150056
totWI
#il numero totale di pixel è sempre 1347500
# calcolo una % dei pixel mascherati sul totale dei pixel nell'immagine che mi indicano zone d'acqua
pWI_2023 <- n_pixel_acqua_2023/totWI
pWI_2023
#la percentuale è 0.1113588 * 100= 11.1%

#anno 2024
WaterIndex_2024<- Banda03_2024 - Banda8A_2024
plot(WaterIndex_2024, col=colorRampPalette(c("red", "white", "blue"))(100), main="Water Index 2024")
summary(WaterIndex_2024)
water_mask_2024 <- WaterIndex_2024 > 0 
plot(water_mask_2024, main="Water Mask 2024")
n_pixel_acqua_2024 <- sum(water_mask_2024[], na.rm = TRUE)
n_pixel_acqua_2024
# Visualizzo il numero di pixel con acqua che sono 1158
totWI
#il numero totale di pixel è sempre 1347500
# calcolo una % dei pixel mascherati sul totale dei pixel nell'immagine che mi indicano zone d'acqua
pWI_2024 <- n_pixel_acqua_2024/totWI
pWI_2024
#la percentuale è 0.0008593692 * 100= 0.09%

#la deviazione standard
#misura la variabilità, la dispersione dei dati rispetto alla loro media
# la calcolo prendendo i valori in percentuale dell'area con l'acqua calcolate per la Classificazione e per i vari indici (WI, MNDWI, NDWI) e vedo come differiscono tra loro
#rappresenta la variabilità tra i valori di copertura dell'acqua delle diverse metodologie di analisi per un dato anno
valori_2020 <- c (0.06, 0.10, 0.32, 0.14) 
#il 1° valore del vettore è la percentuale d'acqua dopo aver fatto la classificazione dell'area.
#il 2° valore è la percentuale di copertura d'acqua calcolata nel WI
#il 3° valore è la percentuale di copertura d'acqua per l'MNDWI
#il 4° valore è la percentuale di copertura d'acqua nel NDWI
valori_2021 <- c (0.07, 0.10, 0.15, 0.11)
valori_2022 <- c (0.08, 0.07, 0.09, 0.08)
valori_2023 <- c (7.63, 11.1, 16.9, 11.8)
valori_2024 <- c (0.07, 0.09, 0.26, 0.10)

sd_2020 <- sd(valori_2020)
#calcolo la deviazione standard dei valori del 2020 tramite la funzione sd() di R
sd_2020
sd_2021 <- sd(valori_2021)
sd_2021
sd_2022 <- sd(valori_2022)
sd_2022
sd_2023 <- sd(valori_2023)
sd_2023
sd_2024 <- sd(valori_2024)
sd_2024

#deviazioni standard
#2020:  0.1147461
#2021:  0.03304038
#2022:  0.008164966
#2023:  3.824294
#2024:  0.0875595

# Creazione di un dataframe per le percentuali
data <- data.frame(
  Anno = c(2020, 2021, 2022, 2023, 2024),                                                           #la 1° colonna presenta gli anni
  Copertura_Classificazione = c(0.06, 0.07, 0.08, 7.63, 0.07),                                      #la 2° colonna è la % di acqua per la classificazione
  Copertura_WaterIndex = c(0.10, 0.10, 0.07, 11.1, 0.09),                                           # 3° colonna % di acqua per WI
  Copertura_MNDWI = c(0.32, 0.15, 0.09, 16.9, 0.26),                                                # 4° col. % acqua di MNDWI 
  Copertura_NDWI = c(0.14, 0.11, 0.08, 11.8, 0.1),                                                  # 5° col. % acqua NDWI                                               
  Deviazione_Standard = c(0.1147461, 0.03304038, 0.008164966, 3.824294, 0.0875595)                  #6° col. il valore della deviazione standard per ogni anno
)

View(data)
#mi mostra il dataframe proprio come tabella

# grafico con il confronto degli andamenti delle diverse classificazioni fatte
# attraverso la funzione ggplot() del pacchetto ggplot2 posso costruire un grafico lineare multivariato
#confronta la percentuale di copertura d'acqua, prendendo i dati di data, che derivano dalla classificazione e dai diversi indici
ggplot(data, aes(x = Anno)) +
  geom_line(aes(y = Copertura_Classificazione, color = "Classificazione")) +
  geom_point(aes(y = Copertura_Classificazione, color = "Classificazione")) +
  geom_line(aes(y = Copertura_NDWI, color = "NDWI")) +
  geom_point(aes(y = Copertura_NDWI, color = "NDWI")) +
  geom_line(aes(y= Copertura_MNDWI, color = "MNDWI"))  +
  geom_point(aes(y= Copertura_MNDWI, color = "MNDWI")) +
  geom_line(aes(y = Copertura_WaterIndex, color = "Water Index")) +
  geom_point(aes(y = Copertura_WaterIndex, color = "Water Index")) +
  labs(title = "Confronto della percentuale di copertura d'acqua",
       y = "Percentuale di copertura (%)",
       color = "Metodo") +
  theme_minimal()

#aes()= aesthetics, mi permette di definire come devo visualizzare il grafico, per cui sull'asse delle x avrò la variabile anno
# geom_line() mi permette di costruire le linee che seguono i valori dell'asse delle y
#per cui avrò una retta per la copertura di acqua calcolata tramite classificazione
#geom_point() mi permette di aggiungere punti sovrapposti alle rette, in cui sull'asse delle y avrò sempre i dati relativi alla variabile classificazione
#lo stesso procedimento per tutti gli indici
#color= mi specifica il colore della linea o del punto in base al metodo di calcolo
#labs() è una funzione che mi permette di applicare sul grafico dei labels, in questo caso scrivo il titolo del grafico
# la y presenterà il titolo "percentuale di copertura", per color =  se scrivo "metodo" mi fa vedere il significato dei vari colori della legenda (associati ai vari indici)

dev.off()

#preparo i dati per l'analisi PA
# PCA = Analisi delle Componenti Principali
#la PCA mi permette di vedere le relazioni tra gli indici di copertura d'acqua nei diversi anni, considerando una scala normalizzata
#esplorare le relazioni tra gli indici di copertura d'acqua nei diversi anni, considerando una scala normalizzata.
#elimino la colonna degli anni, essendo numeri che non sono variabili comparabili
data_pca <- data[,-1]
#creo un oggetto data_pca in cui gli assegno <- i valori dell'oggetto data, eliminando però la prima colonna [,-1]
#oltre a levare la 1° colonna c'è da rimuovere la colonna della deviazione standard. il dataset originale era di 6 colonne, ora però ne ho eliminata una, quindi la sd sarà alla 5° colonna
data_pca <- data_pca[,-5]
#avendo le variabili le stesse scale (tutte percentuali) posso direttamente fare la PCA
# Esegui la PCA
pca_result <- prcomp(data_pca, center = TRUE, scale. = TRUE)
# la funzione prcomp() di R esegue l'analisi delle componenti principali PCA
# i dati saranno quelli di data_pca, center= TRUE significa che centra i dati, lo fa sotrraendo la media di ciascuna variabile; scale. = TRUE, scala di dati (divide per la sd di ciascuna variabile)
# Visualizza i risultati della PCA
summary(pca_result)
#mi mostra un riepilogo dell'analisi PCA
# posso vedere la proporzione di varianza spiegata (la percentuale della varianza totale spiegata da ogni componente principale)
# posso vedere la varianza cumulativa ovvero la somma cumulativa della varianza spiegata, utile per capire quante componenti principali sono necessarie per rappresentare bene i dati.
# praticamente tutta la varianza dei dati è spiegata dalla PC1, le altre componenti principali non aggiungono alcuna informazione significativa
# Crea un biplot per visualizzare la PCA

autoplot(pca_result, data = data, colour = "Anno", loadings = TRUE, loadings.label = TRUE) +
  labs(title = "Biplot dell'Analisi delle Componenti Principali (PCA)",
       x = "PC1",
       y = "PC2") +
  theme_minimal()
# attraverso la funzione autoplot() del pacchetto ggfortify posso creare un biplot della PCA
# i risultati della PCA, ovvero i pca_result saranno gli output del grafico
#i data = provengono dal dataframe originale "data", colour= "Anno" colora i punti in base alla colonna anno, distingue così i vari anni visivamente
#loadings = TRUE mi mostra i vettori delle variabili e indicano la direzione e l'influenza di ciascuna variabile nelle componenti principali
# loadings.label = TRUE mi etichetta i vettori delle variabili
# labs() mi permette di personalizzare i titoli degli assi e dell'intero grafico
#theme_minimal () applica uno stile minimalista al grafico

dev.off()


# Deviazione standard MNDWI 
#utile calcolarmela perché mi misura la variabilità delle aree nel corso degli anni dell'indice MNDWI
# 2020
plot(MNDWI_2020, col=colorRampPalette(c("red", "white", "blue"))(100), main="MNDWI 2020")
#visualizzazione spaziale dell'indice MNDWI del 2020
sd3_MNDWI_2020 <- focal(MNDWI_2020, w = matrix(1/9, 3, 3), fun = sd)
#con questa funzione mi voglio calcolare la deviazione standard dell'indice MNDWI 2020 in una matrice quadrata 3x3 
#la funzione focal() del pacchetto terra mi permette di applicare dei filtri su delle immagini, mi focalizzo così su una finestra
#w = matrix(1/9, 3, 3) mi definisce il "kernel" ovvero la matrice=finestra su cui lavorerò, quindi piccola matrice, molto focalizzato il calcolo, evidenzia piccole variazioni
# creo così una matrice 3x3 in cui ogni elemento pesa 1/9 all'interno del kernel
#fun= sd specifico che operazione devo applicare sulla finestra, in questo caso devo calcolarmi la deviazione standard
sd7_MNDWI_2020 <- focal(MNDWI_2020, w = matrix(1/49, 7, 7), fun = sd)
#in questo caso mi misuro la deviazione standard in una matrice più grande, per cui prendo un'area più ampia attorno al pixel centrale, vedo sia i dettagli che informazioni generali
sd13_MNDWI_2020 <- focal(MNDWI_2020, w = matrix(1/169, 13, 13), fun = sd)
#matrice ancora più ampia, in cui ogni pixels mi pesa 1/169, prende in considerazione un'area molto ampia, mi misura la deviazione standard in un'area più generale, pochissimi dettagli
#creo un multiframe
par(mfrow = c(3, 1))
plot(sd3_MNDWI_2020, col=viridis(100), main="SD MNDWI 3x3 - 2020")
plot(sd7_MNDWI_2020, col=viridis(100), main="SD MNDWI 7x7 - 2020")
plot(sd13_MNDWI_2020, col=viridis(100), main="SD MNDWI 13x13 - 2020")
# Bassa deviazione standard (zone blu): indica che l'indice MNDWI è omogeneo in quell'area, quindi potrebbe trattarsi di acqua stabile o suolo asciutto senza variazioni significative.
# Alta deviazione standard (zone gialle): indica che ci sono variazioni nell'indice MNDWI, che potrebbero essere causate da transizioni tra zone d'acqua e terra, o da miscele di acqua e vegetazione.
dev.off()

#2021
plot(MNDWI_2021, col=colorRampPalette(c("red", "white", "blue"))(100), main="MNDWI 2021")
sd3_MNDWI_2021 <- focal(MNDWI_2021, w = matrix(1/9, 3, 3), fun = sd)
sd7_MNDWI_2021 <- focal(MNDWI_2021, w = matrix(1/49, 7, 7), fun = sd)
sd13_MNDWI_2021 <- focal(MNDWI_2021, w = matrix(1/169, 13, 13), fun = sd)
par(mfrow = c(3, 1))
plot(sd3_MNDWI_2021, col=viridis(100), main="SD MNDWI 3x3 - 2021")
plot(sd7_MNDWI_2021, col=viridis(100), main="SD MNDWI 7x7 - 2021")
plot(sd13_MNDWI_2021, col=viridis(100), main="SD MNDWI 13x13 - 2021")
dev.off()
#2022
plot(MNDWI_2022, col=colorRampPalette(c("red", "white", "blue"))(100), main="MNDWI 2022")
sd3_MNDWI_2022 <- focal(MNDWI_2022, w = matrix(1/9, 3, 3), fun = sd)
sd7_MNDWI_2022 <- focal(MNDWI_2022, w = matrix(1/49, 7, 7), fun = sd)
sd13_MNDWI_2022 <- focal(MNDWI_2022, w = matrix(1/169, 13, 13), fun = sd)
par(mfrow = c(3, 1))
plot(sd3_MNDWI_2022, col=viridis(100), main="SD MNDWI 3x3 - 2022")
plot(sd7_MNDWI_2022, col=viridis(100), main="SD MNDWI 7x7 - 2022")
plot(sd13_MNDWI_2022, col=viridis(100), main="SD MNDWI 13x13 - 2022")
dev.off()
#2023
plot(MNDWI_2023, col=colorRampPalette(c("red", "white", "blue"))(100), main="MNDWI 2023")
sd3_MNDWI_2023 <- focal(MNDWI_2023, w = matrix(1/9, 3, 3), fun = sd)
sd7_MNDWI_2023 <- focal(MNDWI_2023, w = matrix(1/49, 7, 7), fun = sd)
sd13_MNDWI_2023 <- focal(MNDWI_2023, w = matrix(1/169, 13, 13), fun = sd)
par(mfrow = c(3, 1))
plot(sd3_MNDWI_2023, col=viridis(100), main="SD MNDWI 3x3 - 2023")
plot(sd7_MNDWI_2023, col=viridis(100), main="SD MNDWI 7x7 - 2023")
plot(sd13_MNDWI_2023, col=viridis(100), main="SD MNDWI 13x13 - 2023")
dev.off()
#2024
plot(MNDWI_2024, col=colorRampPalette(c("red", "white", "blue"))(100), main="MNDWI 2024")
sd3_MNDWI_2024 <- focal(MNDWI_2024, w = matrix(1/9, 3, 3), fun = sd)
sd7_MNDWI_2024 <- focal(MNDWI_2024, w = matrix(1/49, 7, 7), fun = sd)
sd13_MNDWI_2024 <- focal(MNDWI_2024, w = matrix(1/169, 13, 13), fun = sd)
par(mfrow = c(3, 1))
plot(sd3_MNDWI_2024, col=viridis(100), main="SD MNDWI 3x3 - 2024")
plot(sd7_MNDWI_2024, col=viridis(100), main="SD MNDWI 7x7 - 2024")
plot(sd13_MNDWI_2024, col=viridis(100), main="SD MNDWI 13x13 - 2024")
dev.off()

#sottraggo la deviazione standard MNDWI del 2023 con quella del 2022 e poi quella del 2024
# mi permette di vedere come è cambiata la variabilità spaziale delle superfici negli anni
diffsdMNDWI24 <- sd13_MNDWI_2024 - sd13_MNDWI_2023
plot(diffsdMNDWI24, col=viridis(100), main= "SD DIFFERENZA MNDWI24 - MNDWI23")
diffsdMNDWI22 <- sd13_MNDWI_2023 - sd13_MNDWI_2022
plot(diffsdMNDWI22, col=viridis(100), main= "SD DIFFERENZA MNDWI23 - MNDWI22")

diffoppostaMNDWI <- sd13_MNDWI_2023 - sd13_MNDWI_2024 
plot(diffopposta, col=viridis(100), main= "SD DIFFERENZA MNDWI23 - MNDWI24")

par(mfrow=c(1,2))
plot(diffsdMNDWI24, col=viridis(100), main= "SD DIFFERENZA MNDWI24 - MNDWI23")
plot(diffsdMNDWI22, col=viridis(100), main= "SD DIFFERENZA MNDWI23 - MNDWI22")
dev.off()

# Deviazione Standard NDWI 
#mi permette di vedere le aree nel corso degli anni se sono eterogenee o omogenee
#posso vedere se il territorio ha recuperato dopo l'alluvione o meno
# 2020
plot(NDWI_2020, col=colorRampPalette(c("red", "white", "blue"))(100), main="NDWI 2020")
sd3_NDWI_2020 <- focal(NDWI_2020, w = matrix(1/9, 3, 3), fun = sd)
sd7_NDWI_2020 <- focal(NDWI_2020, w = matrix(1/49, 7, 7), fun = sd)
sd13_NDWI_2020 <- focal(NDWI_2020, w = matrix(1/169, 13, 13), fun = sd)
par(mfrow = c(3, 1))
plot(sd3_NDWI_2020, col=viridis(100), main="SD NDWI 3x3 - 2020")
plot(sd7_NDWI_2020, col=viridis(100), main="SD NDWI 7x7 - 2020")
plot(sd13_NDWI_2020, col=viridis(100), main="SD NDWI 13x13 - 2020")
dev.off()
#2021
plot(NDWI_2021, col=colorRampPalette(c("red", "white", "blue"))(100), main="NDWI 2021")
sd3_NDWI_2021 <- focal(NDWI_2021, w = matrix(1/9, 3, 3), fun = sd)
sd7_NDWI_2021 <- focal(NDWI_2021, w = matrix(1/49, 7, 7), fun = sd)
sd13_NDWI_2021 <- focal(NDWI_2021, w = matrix(1/169, 13, 13), fun = sd)
par(mfrow = c(3, 1))
plot(sd3_NDWI_2021, col=viridis(100), main="SD NDWI 3x3 - 2021")
plot(sd7_NDWI_2021, col=viridis(100), main="SD NDWI 7x7 - 2021")
plot(sd13_NDWI_2021, col=viridis(100), main="SD NDWI 13x13 - 2021")
dev.off()
#2022
plot(NDWI_2022, col=colorRampPalette(c("red", "white", "blue"))(100), main="NDWI 2022")
sd3_NDWI_2022 <- focal(NDWI_2022, w = matrix(1/9, 3, 3), fun = sd)
sd7_NDWI_2022 <- focal(NDWI_2022, w = matrix(1/49, 7, 7), fun = sd)
sd13_NDWI_2022 <- focal(NDWI_2022, w = matrix(1/169, 13, 13), fun = sd)
par(mfrow = c(3, 1))
plot(sd3_NDWI_2022, col=viridis(100), main="SD NDWI 3x3 - 2022")
plot(sd7_NDWI_2022, col=viridis(100), main="SD NDWI 7x7 - 2022")
plot(sd13_NDWI_2022, col=viridis(100), main="SD NDWI 13x13 - 2022")
dev.off()
#2023
plot(NDWI_2023, col=colorRampPalette(c("red", "white", "blue"))(100), main="NDWI 2023")
sd3_NDWI_2023 <- focal(NDWI_2023, w = matrix(1/9, 3, 3), fun = sd)
sd7_NDWI_2023 <- focal(NDWI_2023, w = matrix(1/49, 7, 7), fun = sd)
sd13_NDWI_2023 <- focal(NDWI_2023, w = matrix(1/169, 13, 13), fun = sd)
par(mfrow = c(3, 1))
plot(sd3_NDWI_2023, col=viridis(100), main="SD NDWI 3x3 - 2023")
plot(sd7_NDWI_2023, col=viridis(100), main="SD NDWI 7x7 - 2023")
plot(sd13_NDWI_2023, col=viridis(100), main="SD NDWI 13x13 - 2023")
dev.off()
#2024
plot(NDWI_2024, col=colorRampPalette(c("red", "white", "blue"))(100), main="NDWI 2024")
sd3_NDWI_2024 <- focal(NDWI_2024, w = matrix(1/9, 3, 3), fun = sd)
sd7_NDWI_2024 <- focal(NDWI_2024, w = matrix(1/49, 7, 7), fun = sd)
sd13_NDWI_2024 <- focal(NDWI_2024, w = matrix(1/169, 13, 13), fun = sd)
par(mfrow = c(3, 1))
plot(sd3_NDWI_2024, col=viridis(100), main="SD NDWI 3x3 - 2024")
plot(sd7_NDWI_2024, col=viridis(100), main="SD NDWI 7x7 - 2024")
plot(sd13_NDWI_2024, col=viridis(100), main="SD NDWI 13x13 - 2024")

dev.off()

# differenze sempre considerando il 2023 e poi rispettivamente il 2024 e 2022
#posso individuare le aree che hanno subito i maggiori cambiamenti nella variabilità delle superfici
diffsdNDWI24 <- sd13_NDWI_2024 - sd13_NDWI_2023
plot(diffsdNDWI24, col=viridis(100), main= "SD DIFFERENZA NDWI24 - NDWI23")
diffsdNDWI22 <- sd13_NDWI_2023 - sd13_NDWI_2022
plot(diffsdNDWI22, col=viridis(100), main= "SD DIFFERENZA NDWI23 - NDWI22")

diffoppostaNDWI <- sd13_NDWI_2023 - sd13_NDWI_2024
plot(diffoppostaNDWI, col=viridis(100), main= "SD DIFFERENZA NDWI23 - NDWI24")

par(mfrow=c(1,2))
plot(diffoppostaNDWI, col=viridis(100), main= "SD DIFFERENZA NDWI23 - NDWI24")
plot(diffsdNDWI22, col=viridis(100), main= "SD DIFFERENZA NDWI23 - NDWI22")
dev.off()

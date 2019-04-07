% w projekcie zostala wykorzystana technika konwolucyjnych sieci
% neuronowych, ktora posrednio posluzy do ekstrakcji cech znajdowanych na
% obrazkach a nastepnie do klasyfikacji 3 obiektow samolotu, promu, laptopa
% przy pomocy SVM

% w projekcie wykorzystano wczesniej wytrenowaną sieć ResNet-50,
% Neural Network Toolbox™,
% Statistics and Machine Learning Toolbox™,
% Neural Network Toolbox™ Model for ResNet-50 Network



% obrazki pobrano ze strony caltech
url = 'http://www.vision.caltech.edu/Image_Datasets/Caltech101/101_ObjectCategories.tar.gz';
% tworzymy tymczasowy folder
outputFolder = fullfile(tempdir, 'caltech101');

% pobieramy dane jednorazowo
if ~exist(outputFolder, 'dir')
    disp('Downloading 126MB Caltech101 data set...');
    untar(url, outputFolder);
end

% wybieramy z data setu tylko 3 kategorie
rootFolder = fullfile(outputFolder, '101_ObjectCategories');
categories = {'airplanes', 'ferry', 'laptop'};

% imageDatastore (lokalizacja obrazkow, ladowanie do pamieci
% tylko w runtime), imds zawiera teraz obrazek i przypisana
% kategorie (kategoria przypisana jest z nazwy obrazka
imds = imageDatastore(fullfile(rootFolder, categories), 'LabelSource', 'foldernames');



% zliczenie obrazkow w danej kategorii
tbl = countEachLabel(imds);

% ustalanie najmniejszej liczby obrazkow w kategorii
minSetCount = min(tbl{:,2});

% wziecie losowych obrazkow w takiej liczbie zeby byla ona rowna
% najmniejszej liczbie w danej klasie
imds = splitEachLabel(imds, minSetCount, 'randomize');

% zliczenie i dowod zrownania liczebnosci w danej klasie
countEachLabel(imds)



% pierwsze napotkane instancje z kazdej kategorii z naszego datasetu
airplanes = find(imds.Labels == 'airplanes', 1);
ferry = find(imds.Labels == 'ferry', 1);
laptop = find(imds.Labels == 'laptop', 1);

figure
subplot(1,3,1);
imshow(readimage(imds,airplanes))
subplot(1,3,2);
imshow(readimage(imds,ferry))
subplot(1,3,3);
imshow(readimage(imds,laptop))



% zaladowanie wytrenwanej sieci
net = resnet50();

% wizualizacja warstw 150..170
%figure
%plot(net)
%title('First section of ResNet-50')
%set(gca,'YLim',[150 170]);

% inspekcja pierwszej warstwy
net.Layers(1)

% inspekcja ostatniej warstwy
net.Layers(end)
% liczba elementow ostatniej warstwy (liczba klas)
numel(net.Layers(end).ClassNames)



% rozdzielanie datasetu na treningowy i testowy
[trainingSet, testSet] = splitEachLabel(imds, 0.3, 'randomize');


% przeksztalcenie obrazkow do postaci takiej jaka jest przyjmowana przez
% siec
imageSize = net.Layers(1).InputSize;
augmentedTrainingSet = augmentedImageDatastore(imageSize, trainingSet, 'ColorPreprocessing', 'gray2rgb');
augmentedTestSet = augmentedImageDatastore(imageSize, testSet, 'ColorPreprocessing', 'gray2rgb');

% warstwa przedostatnia  
featureLayer = 'fc1000';
% ekstrakcja cech warstwy przedostatniej
trainingFeatures = activations(net, augmentedTrainingSet, featureLayer, ...
    'MiniBatchSize', 32, 'OutputAs', 'columns');


% przypisanie etykiet
trainingLabels = trainingSet.Labels;

% trening klasyfikatora typu SVM przy uzyciu wyekstrachowanych cech z przetrenowanej sieci
% konwolucyjnej
classifier = fitcecoc(trainingFeatures, trainingLabels, ...
    'Learners', 'Linear', 'Coding', 'onevsall', 'ObservationsIn', 'columns');

% ekstrakcja cech warstwy przedostatniej setu testowego
testFeatures = activations(net, augmentedTestSet, featureLayer, ...
    'MiniBatchSize', 32, 'OutputAs', 'columns');

% sprawdzanie klasyfikatora
predictedLabels = predict(classifier, testFeatures, 'ObservationsIn', 'columns');

% wyciagniecie znanych etykiet
testLabels = testSet.Labels;

% ustawienie etykiet testowych i przewidzianych w macierz konfuzji
confMat = confusionmat(testLabels, predictedLabels);

  

% konwersja macierzy do formy procentowej
confMat = bsxfun(@rdivide,confMat,sum(confMat,2));

% srednia wartosc procentowa
accuracy = mean(diag(confMat));



% kategoryzacja nowych obrazkow
newImage = imread(fullfile(rootFolder, 'airplanes', 'image_0690.jpg'));

% automatyczne przeskalowanie 
ds = augmentedImageDatastore(imageSize, newImage, 'ColorPreprocessing', 'gray2rgb');

% ekstrakcja cech przy uzyciu DNN
imageFeatures = activations(net, ds, featureLayer, 'OutputAs', 'columns');

% predykcja 
label = predict(classifier, imageFeatures, 'ObservationsIn', 'columns');

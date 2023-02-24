//alle benötigten Variablen initialisieren, wie die Größe des Bildes, das Array für die Helligkeits-, Farbton- und Sättigungsdaten
PImage pic;
int imgX, imgY;
int[] sArr;
int[] bArr;
int[] hArr;

void setup() {
  //size(1512, 1512);
  //das Bild laden und die Daten des Bildes in ein Array laden
  pic = loadImage("as.jpeg");
  pic.loadPixels();

  //den Wert für die Größe des Bildes für wiederverwendbaren Code festlegen
  imgX = pic.width;
  imgY = pic.height;


  //die Größe der Arrays festlegen
  sArr = new int[imgX * imgY];
  bArr = new int[imgX * imgY];
  hArr  = new int[imgX * imgY];





  //eine Schleife, die das Array mit den Daten für das Bild durchläuft und den Sättigungswert jedes Pixels in sArr
  int indexSatGet = 0;
  for (int y = 0; y < imgY; y++) {
    for (int x = 0; x < imgX; x++) {
      //die Sättigung des gerade iterierten Pixels ermitteln
      color farb = pic.get(x, y);
      float satwert = saturation(farb);

      //Laden der Daten in das Array
      sArr[indexSatGet] = int(satwert);

      indexSatGet++;
    }
  }



  //eine Schleife, die das Array mit den Daten für das Bild durchläuft und den Helligkeitswert jedes Pixels in bArr
  int indexBriGet = 0;
  for (int y = 0; y < imgY; y++) {
    for (int x = 0; x < imgX; x++) {
      // liefert die Helligkeit des gerade iterierten Pixels
      color c = pic.get(x, y);
      float brightnessWert = brightness(c);

      //Laden der Daten in das Array
      bArr[indexBriGet] = int(brightnessWert);

      indexBriGet++;
    }
  }

  int indexHueGet = 0;
  for (int y = 0; y < imgY; y++) {
    for (int x = 0; x < imgX; x++) {
      // liefert die Farbton des gerade iterierten Pixels
      color c = pic.get(x, y);
      int hueWert = int(hue(c));
      //Laden der Daten in das Array
      hArr[indexHueGet] = hueWert;
      indexHueGet++;
    }
  }

//Wenden Sie den Sortieralgorithmus auf jedes Feld an. Beachten Sie, dass dieser Algorithmus destruktiv ist und die Wertepositionierung des bestehenden Arrays verändert. Die Pixel im Array des Originalbildes bleiben jedoch gleich, da wir nur Daten daraus abgeleitet haben
  InsertSort(sArr);
  InsertSort(bArr);
  InsertSort(hArr);
}

void InsertSort(int[] needSarray) {
 // beim zweiten Element des Arrays beginnen dann durch das Array iterieren
  for (int i = 1; i < needSarray.length; i++) {
    int schlussel = needSarray[i];
    int j = i - 1;
 //   iteriert durch jedes Element hinter dem Element, das gerade iteriert wird. Wird ein Wert gefunden, der größer ist als das Element, über das gerade iteriert wird, 
  //  wird das Array nach vorne verschoben. Wenn das Ende des Arrays erreicht ist oder
   // kein Wert mehr gefunden wird, der größer als der Wert des iterierten Elements ist. Setzt den Wert des letzten zu vergleichenden Elements auf den Wert des gerade iterierten Elements
    while (j >= 0 && needSarray[j] > schlussel) {
      needSarray[j + 1] = needSarray[j];
      j--;
    }
    needSarray[j + 1] = schlussel;
  }
}

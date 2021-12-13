
Lampada l[];
String id[] = { "_S", "_C", "_B" };
color c_on = #FFFF00;
color c_off = #808080;
int nl = 3;

String url = "http://doc.ths-net.it/api/status/";
String nome_file = "w:\\docenza\\dato locale.json";

// codici delle lampade
// prima lampada in soggiorno
// seconda lampada in cucina
// terza lampada in bagno

String codice_utente = "FG"; // Federico Galvagni
String codice_l_soggiorno = "FG_S";
String codice_l_cucina = "FG_C";
String codice_l_bagno = "FG_B";


int ultimo_aggiornamento;

void AggiornaStatoLampade() {
  JSONObject s;
  
  String url_codice = url + codice_utente;
  println(url_codice);
  
  s = loadJSONObject(url_codice);
  println(s);
  
  for (int i=0; i<nl; i++) {
    // estraggo il valore dal dato JSON
    String cmd = s.getString(l[i].id);
    println(cmd);
    if (cmd.equals("ON")) {
      l[i].stato = true;
    }
    if (cmd.equals("OFF")) {
      l[i].stato = false;
    }
  }  
  
  
  ultimo_aggiornamento = millis(); // millisecondi dell'ultimo aggiornamento
}

void setup() {
  size(800, 600);
  background(192); // color(192, 192, 192)
  //inizializzazione lampade
  
  l = new Lampada[nl];
  for (int i=0; i<nl; i++) {
    l[i] = new Lampada(100 + i*200, 100, 120, c_on, c_off, codice_utente + id[i]);
  }

  AggiornaStatoLampade();

}


void draw() {
  if (millis() >= (ultimo_aggiornamento + 5000)) {
    AggiornaStatoLampade();
  }
  for (int i=0; i<nl; i++) {
    l[i].Draw();
  }  
}

void mousePressed() {
  for (int i=0; i<nl; i++) {
    l[i].MousePressed(mouseX, mouseY);
  }  
}

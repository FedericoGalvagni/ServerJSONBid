class Lampada {
  int x, y, r;
  color c_on, c_off;
  boolean stato = false;
  String id; // identificativo lampada
  Pulsante pon, poff;

  // costruttore
  Lampada(int x, int y, int r, color c_on, color c_off, String id) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.c_on = c_on;
    this.c_off = c_off;
    this.id = id;
    // calcolo posizione e dimensione pulsanti
    int yp = y + r/2 + r/7;
    int wp = r/3;
    int hp = r/4;
    pon = new Pulsante("On", x-r/2+r/12, yp, wp, hp, #0000FF, #FFFFFF); 
    poff = new Pulsante("Off", x+r/12, yp, wp, hp, #0000FF, #FFFFFF); 
  }
  
  void Draw() {
    fill(0);
    circle(x, y, r);
    if (stato == true) {
      fill(c_on);
    } else {
      fill(c_off);
    }
    circle(x, y, r*0.8);
    pon.Draw();
    poff.Draw();
  }

  // punto interno
  boolean MouseIsOver(int xp, int yp) {
    int dx = (x - xp);
    int dy = (y - yp);
    
    // funzione per calcolare una potenza => pow
    // pow(3, 2) = 9
    // pow(9, 0.5) o sqrt(9) 
    
    float dist = sqrt((dx*dx)+(dy*dy));
    
    return (dist < (r*0.4));
    
  }
  
  // gestione pressione tasto mause
  void MousePressed(int xp, int yp) {
    // vedo se interno alla lampada
    if (MouseIsOver(xp, yp)) {
      // operatore NOT scritto come !
      stato = (!stato);
    }
    // vedo se sono stati premuti i pulsanti
    if (pon.MouseIsOver(xp, yp)) {
      stato = true;
    }
    if (poff.MouseIsOver(xp, yp)) {
      stato = false;
    }
  }

}

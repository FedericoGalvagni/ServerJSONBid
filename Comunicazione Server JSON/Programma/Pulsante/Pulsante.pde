class Pulsante {
  int x, y, w, h;
  color bc, tc;
  String testo;
  
  // costruttore
  Pulsante(String testo, int x, int y, int w, int h, color bc, color tc) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.bc = bc;
    this.tc = tc;
    this.testo = testo;
  }

  // disegno
  void Draw() {
    fill(bc);
    rect(x, y, w, h);
    
    fill(tc);
    textAlign(CENTER, CENTER);
    text(testo, x+w/2, y+h/2);
  }
  
  // punto interno
  boolean MouseIsOver(int xp, int yp) {
    boolean over_x = ((xp >= x) && (xp <= (x+w)));
    boolean over_y = ((yp >= y) && (yp <= (y+h)));
    return (over_x && over_y);
  }

}

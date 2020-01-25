class Cell {
    int content = 0, //content = 0: Cell is empty; content = 1: Cell is occupied(O); content = 1: Cell is occupied(X);
        x, y, 
        s, 
        cx, cy;
    Cell(int x_, int y_, int s_) {
        x = x_;
        y = y_;
        s = s_;
        cx = width / 2 - floor(maxx / 2) * s + x * s;
        cy = height / 2 + floor(maxy / 2) * s - y * s;
    }

    void create() {
        fill(51, 51, 51);
        stroke(0, 0, 0);
        strokeWeight(5);
        rectMode(CENTER);
        ellipseMode(CENTER);
        square(cx, cy, s);
        if (content == 1) {
            stroke(34, 235, 11);
            circle(cx, cy, s - 40);
        } else if (content == 2) {
            stroke(0, 240, 255);
            line(cx - s / 2 + 20, cy - s / 2 + 20, cx + s / 2 - 20, cy + s / 2 - 20);
            line(cx - s / 2 + 20, cy + s / 2 - 20, cx + s / 2 - 20, cy - s / 2 + 20);
        }
    }

    void checkForClick(float clickX, float clickY) {
        if (clickX >= cx - s / 2
         && clickX <= cx + s / 2
         && clickY <= cy + s / 2
         && clickY >= cy - s / 2) 
            click(player);
    }

    void click(int cont) {
        if (content == 0) {
            content = cont;
            checkWin();
        }
    }
}

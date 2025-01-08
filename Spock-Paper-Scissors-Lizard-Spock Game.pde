float comp, user;
int screen = 0;
boolean endGame = false;
String resultado = "";
PFont fonte;
PImage telaInicio, telaResultad;

void setup() {
  size(700, 700); 
  noStroke();
  colorMode(HSB, 360, 100, 100);
  textAlign(CENTER, CENTER); 
  fill(15);
  fonte = createFont("Minecraft.ttf", 20); 
  textFont(fonte); 

  telaInicio = loadImage("TELA1.png");
  telaResultad = loadImage("TELA_RESULT.png");
  user = 6; 
}

void draw() {
  background(0, 0, 100);

  if (screen == 0) {
    image(telaInicio, 0, 0, width, height);
  } else if (screen == 1) {
    image(telaResultad, 0, 0, width, height);
    text(resultado, width / 2, height / 2);
  }
}

void mousePressed() {
  if (screen == 0) {
    if (mouseX > 91 && mouseX < 196 && mouseY > 252 && mouseY < 350) {
      user = 0; //spock //esquerda cima
    } else if (mouseX > 280 && mouseX < 378 && mouseY > 98 && mouseY < 196) {
      user = 1; // tesoura // cima
    } else if (mouseX > 504 && mouseX < 602 && mouseY > 252 && mouseY < 350) {
      user = 2; // papel // direita cima
    } else if (mouseX > 406 && mouseX < 504 && mouseY > 462 && mouseY < 560) {
      user = 3; // pedra // direita baixo
    } else if (mouseX > 182 && mouseX < 280 && mouseY > 462 && mouseY < 560) {
      user = 4; // lagarto // esquerda baixo
    }

    if (user != 6) {
      comp = int(random(5)); 
      println(comp);

      String r_user = "";
      if (user == 0) {
        r_user = "Spock";
      } else if (user == 1) {
        r_user = "Tesoura";
      } else if (user == 2) {
        r_user = "Papel";
      } else if (user == 3) {
        r_user = "Pedra";
      } else if (user == 4) {
        r_user = "Lagarto";
      }

      String r_comp = "";
      if (comp == 0) {
        r_comp = "Spock";
      } else if (comp == 1) {
        r_comp = "Tesoura";
      } else if (comp == 2) {
        r_comp = "Papel";
      } else if (comp == 3) {
        r_comp = "Pedra";
      } else if (comp == 4) {
        r_comp = "Lagarto";
      }

      if (user == comp) {
        resultado = "\n EMPATE:\n\n Ambos escolheram " + r_user + ".";
      } else if (
        (user == 0 && (comp == 1 || comp == 3)) ||
        (user == 1 && (comp == 2 || comp == 4)) ||
        (user == 2 && (comp == 3 || comp == 0)) ||
        (user == 3 && (comp == 4 || comp == 1)) ||
        (user == 4 && (comp == 0 || comp == 2))
        ) {
        resultado = "\n Voce Venceu!\n\n Computador escolheu " + r_comp + "\n e voce " + r_user + ".";
      } else {
        resultado = "\n Computador Venceu!\n\n Computador escolheu " + r_comp + "\n e voce " +  r_user + ".";
      }

      endGame = true;
      screen = 1; 
    }
  } else if (screen == 1) { 
    endGame = false;
    user = 6; 
    screen = 0; 
  }
}

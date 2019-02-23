import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class testePlayer extends PApplet {

Player player;
Input input;

public void setup() {
  
  player = new Player(100, 100);
  input = new Input();
}

public void draw() {

  background(0xff2B9D52);

  player.draw();
  player.control(input.pressed);

  // Testes ________________
  // input.debugDraw();
  player.debugDraw();
}

public void keyPressed(){
  input.keyPressed();
}

public void keyReleased(){
  input.keyReleased();
}
class Pressed {
  
  boolean right;
  boolean left;
  boolean flap; 
  boolean grab;
  
  Pressed() {
    right = false;
    left = false;
    flap = false;
    grab = false;
  }
    
}

class Input{
  
  Pressed pressed;
  
  Input() {
    pressed = new Pressed();
  }
  
  public void keyPressed(){
    if(key == 'a') pressed.left = true;
    if(key == 'd') pressed.right = true;
    if(key == ' ') pressed.flap = true;
    if(key == 'n') pressed.grab = true;
  }
  
  public void keyReleased() {
    if(key == 'a') pressed.left = false;
    if(key == 'd') pressed.right = false;
    if(key == ' ') pressed.flap = false;
    if(key == 'n') pressed.grab = false;
  }
  
 public void debugDraw() {
    fill(0);
    rect(0, 0, 80, 90);
    fill(0, 255, 255);
    textSize(12);
    text("left: " + pressed.left, 5, 20);
    text("right: " + pressed.right, 5, 40);
    text("flap: " + pressed.flap, 5, 60);
    text("grab: " + pressed.grab, 5, 80);
  }
  
}
class Player {
  
  Transform transform;
  Transform speed;
  Transform acc;

  int state;

  final int ST_FLYING = 1;
  final int ST_ON_GROUND = 2;

  int parFlapSpeed = 30;
  int parFlySpeed = 5;

  Player(int x, int y) {
    state = ST_ON_GROUND;
    transform = new Transform(x, y, 0);
    speed = new Transform(0, 0, 0);
    acc = new Transform(0, 0, 0);
  }
  
  public void draw() {
    fill(0,0,0);
    rect(transform.x, transform.y, 20, 20);
  }
  
  public void debugDraw(){
    fill(255, 0, 0);
    textSize(10);
    text("state:" + state, 0, 10);
  }
  
  public void control(Pressed pressed){
    if (state == ST_ON_GROUND){
      if (pressed.flap) {
        state = ST_FLYING;
        speed.x += parFlapSpeed;
      }
    } 
    if (state == ST_FLYING) {
      if (pressed.flap) {
        speed.x += parFlapSpeed;
      }
      if (pressed.left) {
        transform.x -= parFlySpeed;
      }
      if (pressed.right) {
        transform.x += parFlySpeed;
      }
    }
    
  }
}
class Transform {
  int x;
  int y;
  int r;

  Transform(int tempX, int tempY, int tempR){
    x = tempX;
    y = tempY;
    r = tempR;
  }
}
  public void settings() {  size(1000, 700); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "testePlayer" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

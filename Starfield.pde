//your code here
Particle star[]= new Particle[300];
float rot = 0;
void setup()
{
	size(1000,1000);
	for(int i=0;i<star.length;i++){
		star[i]=new Particle();
	}
	star[0]=new OddballParticle();
}
void draw()
{
	frameRate(100);
	fill(0,0,0,40);
	stroke(255,255,255,50);
	rect(0,0,1000,1000);
	translate(500,500);
	star[0].move();
	star[0].show();
	rotate(rot);

	for(int i=1;i<star.length;i++){
		star[i].move();
		star[i].show();
	}
	rot += .02;

}
class Particle
{
	double myX,myY,myAngle, mySpeed, mySize;
	int myR,myG,myB;
	Particle(){
		myX= 0;
		myY = 0;
		myR = (int)(Math.random()*255)+1;
		myG = (int)(Math.random()*255)+1;
		myB = (int)(Math.random()*255)+1;
		mySize = 2;
		myAngle = (Math.random()*2)*Math.PI;
		mySpeed = (Math.random()*8)+1;
	}
	void move(){
		for(int i=1;i<star.length;i++){
			if(star[i].myX>500 || star[i].myY>500||star[i].myX<-500||star[i].myY<-500){
				star[i].myX=0;
				star[i].myY=0;
				star[i].mySize=2;
			}
		}
		myX += Math.cos(myAngle)*mySpeed;
		myY += Math.sin(myAngle)*mySpeed;
		mySize += .05;

	}
	void show(){
		fill(myR,myG,myB);
		ellipse((float)myX,(float)myY,(float)mySize,(float)mySize);
	}
}

class OddballParticle extends Particle//inherits from Particle
{
	OddballParticle(){
		mySize = 50;
	}
	void move(){
		myX=mouseX-500;
		myY=mouseY-500;

	}
	void show(){
		fill(0,200,200);
		ellipse((float)myX,(float)myY,(float)mySize,(float)mySize);
		fill(30);
		ellipse((float)myX,(float)(myY+mySize/3),(float)(mySize*2),(float)(mySize/2));
	}
}



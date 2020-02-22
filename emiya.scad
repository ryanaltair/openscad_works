// enable animate(vioew->animate)
// set FPS=20,Steps=50;
s30=sin(30);
s60=sin(60);
module q(l=10){
  translate([l/2,0,0])
  cube([l,1,1],center=true);
  }
module emiya(now,c1=50,c2=100){
  if(now>c1){
      if(now>c2){
    translate([c1,0,0])
    q(c2-c1);
    }else if(c2>now){
       translate([c1,0,0])
      q((c2-c1)-(c2-now));
      }
    }
  }
module emiya2(now,c1=100,c2=150,dir=1){
   if(now>c1){
      if(now>c2){
       translate([c1,0,0])
        rotate([0,0,dir*60])
        q((c2-c1)/s30);
      }else if(c2>now){
        translate([c1,0,0])
        rotate([0,0,60])
        q(((c2-c1)-(c2-now))/s30);
      }
    }
  }
module layer(now,x,w=8){
  emiya(now,x,x+10);
  emiya2(now,x+10,x+10+10*s30,1);
  emiya2(now,x+10,x+10+10*s30,-1);
}
module route(now){

    for(x=[0:2*10*(1+s30):600]){
     layer(now,x);
      translate([0,10*sin(60),0])
      layer(now,x+10+10*s30);
      }
    }
    module road(px,py){
      xk=10*(1+s30)*2;
      yk=10*s60*2;
      translate([xk*px,yk*py,0])
    route($t*360);
      }
    
color("blue")road(0,1);
color("blue")road(2,2);
      color("blue")road(-1,4);
        color("silver")road(-1,-2);
//translate([0,0,10])
color("silver")road(1,0);
color("red")road(2,3);
color("red")road(1,-1);

    
  
 
 
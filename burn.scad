cir=800;
module q(){
cube([200,100,40],center=true);
}
h=10;
//for(h=[0:40:400]){
for(i=[0:20:360]){

rotate([0,0,i+h/4])
translate([0,cir,h])
  q();
  }
//}

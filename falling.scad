module s(){
  cube([1,1,2],center=true);
  }
  module main(){
      for(x=[1:3:10]){
  for(r=[1:30:360]){
  rotate([0,0,x*$t*360])
  
    rotate([0,0,r])
  translate([x,0,0]){
  translate([0,0,0.1*x*(1-sin($t*PI*60))*10])
  s();
  }
}
  }
}
color("gray")cylinder(2,12.5,12.5,center=true);
main();
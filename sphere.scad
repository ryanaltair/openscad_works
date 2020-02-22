// enable animate (view->animate)
// set FPS=20 Steps=360
module
q()
{
    cube([ 10, 1, 1 ], center = true);
}

module
c()
{
    cube([ 1, 1, 1 ], center = true);
}
module
o()
{
    cylinder(1, 2, 2);
} 
module
main11()
{
    color("gold") translate([ 0, 0, 20 * (2) ])
        //     rotate([0,0,$t*360])
        for (r = [180:10:360])
    {
        rotate([ 0, 0, r ]) for (i = [0:60:360])
        {
            rotate([ 0, r, i * sin($t * 360 * 1) ])
                translate([ 0, $t * 360 / 30, 30 ]) scale([ 1, 1, 20 ]) o();
        }
    }
} 
main11();






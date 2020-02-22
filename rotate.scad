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
module cycle_rotate(i)
{
    for (i = [0:360 / i:360])
        rotate([ 0, 0, i ]) children();
}
module layer(l, h, angle = 0)
{
    for (i = [0:h / l:h]) {
        translate([ 0, i * angle, i ]) children();
    }
}
module sin_cycle(l, h, angle = 0)
{
    for (i = [0:h / l:h]) {
        translate([ 0, sin(i / 3.14), i ]) children();
    }
}

// cycle_rotate(10)sin_cycle(10,10,-2)q();
module
main0()
{
    for (b = [0:1:2]) {
        for (a = [0:5:360]) {
            rotate([ 0, 0, b * 90 ])
                translate([ 0, sin(10 * $t * 360), a / 10 ])
                    rotate([ 0, 0, a + $t * 360 ])
                        scale([ 1 + sin(10 * $t * 360) * sin(a) + 1, 1, 1 + 1 ])
                            q();
        }
    }
};

module main1(l)
{

    for (i = [0:360 / l:90]) {
        translate([ 0, i / 10, 0 ]) rotate([ 0, i + 0.2 * i * $t * 360, 0 ])
            scale([ 1, 1, 3 + 10 * i / 90 ]) c();
    }
}
module
main2()
{
    for (i = [0:10:360]) {

        translate([ 0, 0, 4 * i / 360 * (2 + sin($t * 360 * 30)) ])
            rotate([ 0, 0, i * 2 ]) translate([ 0, 3, 0 ]) c();
    }
}
module
main3()
{
    rotate([ 0, 0, $t * 360 * 30 ]) for (i = [0:5:360])
    {
        rotate([ 0, 0, i * 2 ])
            translate([ 0, 4 * i / 360 * (1.5 + sin($t * 360 * 10)), 0 ]) c();
    }
}
module
main4()
{
    for (i = [0:10:360]) {
        rotate([ 0, 0, i * $t * 360 * 0.05 ])
            translate([ 0, $t * 360 / 100 + i / 30, i * 0.01 ])
            //  rotate([0,0,i*$t*360])
            //    translate([sin($t*360*4)*i/10,cos($t*360)*i/10,0])

            q();
    }
}
module
main5()
{
    for (x = [-8:1:8]) {
        for (y = [-8:1:8]) {
            translate([ x, y, 0 ]) scale(
                [ 1, 1, 3 + 3 * cos(y * 36 * $t * 15) * sin(x * 36 * $t * 15) ])
                c();
        }
    }
}
module
main6()
{
    rotate([ 0, 0, $t * 360 ]) for (r = [0:45:4 * 90])
    {
        rotate([ 0, 0, r ]) translate(
            [ 10 * (2 + sin(10 * $t * 360)), 0, 0 ]) for (i = [0:30:360])
        {
            rotate([ 0, 0, i + 4 * $t * 360 ]) translate([ 2, 0, 0 ])
                scale([ 10 * (1 + sin(10 * $t * 360)), 1, 2 ]) c();
        }
        rotate([ 0, 0, r + 45 / 2 ])
            translate([ 5 * (2 + sin(10 * $t * 360)), 0, 0 ])
                cube([ 10 * (2 + sin(10 * $t * 360)), 1, 1 ], center = true);
    }
}
module
main7()
{
    //     translate([0,sin($t*360),0])
    rotate([ 0, 0, $t * 360 * 10 / 2 ])
        translate([ 0, 10 * sin($t * 360), $t * 360 * 5 / 100 ])
            rotate([ 0, 0, $t * 360 * 10 ]) q();
    color("gray") for (i = [1:1:360])
    {
        rotate([ 0, 0, i * 10 / 2 ]) translate([ 0, 10 * sin(i), i * 5 / 100 ])
            rotate([ 0, 0, i * 10 ]) c();
    }
}
module
main8()
{
    color("gray") for (i = [1:1:360])
    {
        rotate([ 0, 0, i * 10 ]) translate([ 0, i * sin($t * 360), 0 ])
            rotate([ 0, 0, $t * 360 * 1 ]) q();
    }
}
module
main9()
{
    for (x = [-8:1:8]) {
        for (y = [-8:1:8]) {
            translate([ x * 5, y * 5, 0 ]) scale([
                1,
                1,
                (3 + 3 * cos(y * 36 * $t * 15) * sin(x * 36 * $t * 15)) * 5
            ]) rotate([ 0, 0, $t * 360 * 6 ]) o();
        }
    }
}
module
main10()
{
    for (i = [1:10]) {
        translate([ 0, 0, -i ]) rotate([ 0, 0, i * $t * 360 * 6 * 10 ])
            scale([ i, i, 1 ]) o();
    }
    rotate([ 0, 0, $t * 360 * 6 ])
        translate([ 0, 0, 20 * (1 + sin($t * 360 * 10)) ]) scale([ 1, 1, 30 ])
            o();

    translate([ 0, 0, 20 * (2 + sin($t * 360 * 10)) ])
        rotate([ 0, 0, $t * 360 * 6 ]) for (r = [0:10:60])
    {
        for (i = [0:30:360]) {
            rotate([ 0 + r, 60 + r, i + r ]) translate([ 0, $t * 360 / 30, 30 ])
                scale([ 1, 1, 20 ]) o();
        }
    }
} 
main0();
// main1(100);
//  main2();
//  main3();
//  main4();
//  main5();
// main6();

//  main7();
//      main8();
//      main9();
// main10();







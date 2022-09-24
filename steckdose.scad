length=200;
innerwidth=60;
heightfront=20;
heightback=50;
wand=2;
holeheight=40;

difference(){
    cube([length,innerwidth+2*wand,height]);
    translate([20,8,-1])
        cube([60,innerwidth-10,10]);
    translate([length-20-60,8,-1])
        cube([60,innerwidth-10,10]);
}
    cube([length,wand,heightfront]);
difference(){
    translate([0,innerwidth+wand,0])
        cube([length,wand,heightback]);
    translate([20,innerwidth,holeheight])
        sphere(r=4.7);
    translate([length-20,innerwidth,holeheight]) 
        sphere(r=4.7);
    translate([35,innerwidth,10])
        cube([130,6,heightback]);
}

translate([22,0,5])
rotate([90,0,0])
linear_extrude(1)
text("Language Science Press");
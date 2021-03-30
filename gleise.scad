
module gleis(laenge, spurweite, extra_schwellen=0, fluegel=true){
    translate([0,0, fahrbahnhoehe])
    schiene(laenge-hakenrotationradius);
    translate([0,spurweite, fahrbahnhoehe])
    schiene(laenge-hakenrotationradius);
    faecher=1+extra_schwellen;
    schwellenoffset=(laenge-2*schwellensafety-schwellenbreite)/faecher;
    for (i=[0:faecher]){
        translate([schwellensafety+schwellenoffset*i-hakenrotationradius/2,0,fahrbahnhoehe-1])
        schwelle(spurweite);
    }
//    color("red")
//    translate([laenge-schwellensafety,0,0])
//    schwelle(spurweite);
//    if (fluegel){
        translate([-hakenrotationradius/2,0,fahrbahnhoehe])
        fluegel();
    //
        translate([laenge-hakenrotationradius/2,0,fahrbahnhoehe])//mirrored on y axis, hence safety offset already included
        mirror([1,0,0])
        fluegel();
    //
        translate([-hakenrotationradius/2,spurweite,fahrbahnhoehe])
        mirror([0,1,0])
        fluegel();
    //
        translate([laenge-hakenrotationradius/2,spurweite,fahrbahnhoehe])
        mirror([1,0,0])
        mirror([0,1,0])
        fluegel();
//    }
}

module schiene(laenge, radius=gleisdicke/2, double=true){
    stange(laenge,radius=radius);
    color("red")
    haken(xoffset=laenge,knob=false);
    if (double){
        rotatehaken(xoffset=0, knob=false);
    }
}

module stange(laenge,radius=gleisdicke/2){
    rotate([0,90,0])
    cylinder(r=radius, h=laenge, $fn=fn);
}




module drehschwelle(spurweite=spurweite,winkel=120,scope=1){
    if (scope==1){
        skip = 40;
        limit = winkel/skip-1;
        echo(limit);
        for (i = [0:limit]){
            translate([-scope*11.9-spurweite/2,0,6])
            rotate([0,0,skip*i+skip/4])
            difference() {
//                outer cylinder
                rotate_extrude(convexity = 10, angle=skip/2, $fn=fn)
                translate([scope*17.5,0,0])
                circle(d=spurweite*1.2);
//                inner cylinder
                rotate([0,0,-.1])     //drop initial membrane
                rotate_extrude(convexity = 10, angle=skip/2+1, $fn=fn)
                translate([scope*17.5,0,0])
                circle(d=spurweite*.9);
    //                rather radical crop for schwellen
                translate([0,0,fahrbahnhoehe/2-4])
                cylinder(d=scope*sechseckkantenlaenge*2,h=12);
            }
        }
    }
    if (scope==3){//needs computation instead of guesswork
        skip = 20;
        limit = winkel/skip-1;
        for (i = [0:limit]){
//            translate([-scope*16-spurweite/2,0,3])
//            rotate([0,0,skip*i+skip/4])
//            rotate_extrude(convexity = 10, angle=skip/2, $fn=fn)
//            translate([scope*16,0,0])
//            square([spurweite,1]);
            translate([-scope*15.8-spurweite/2,0,6])
            rotate([0,0,skip*i+skip/4])
            difference() {
//                outer cylinder
                rotate_extrude(convexity = 10, angle=skip/2, $fn=fn)
                translate([scope*17.5,0,0])
                circle(d=spurweite*1.15);
//                inner cylinder
                rotate([0,0,-.1])     //drop initial membrane
                rotate_extrude(convexity = 10, angle=skip/2+1, $fn=fn)
                translate([scope*17.5,0,0])
                circle(d=spurweite*.9);
    //                rather radical crop for schwellen
                translate([0,0,fahrbahnhoehe/2-4])
                cylinder(d=scope*sechseckkantenlaenge*2,h=8);
            }
        }
    }
}



module haken(xoffset=0, knob=true){
    translate([xoffset,0,-hakenrotationradius])
    rotate([90,270+rotationangle,0])
    rotate_extrude(convexity = 10, angle=rotationangle, $fn=fn)
    translate([hakenrotationradius, 0, 0])
    circle(r = gleisdicke/2, $fn=fn);
    if(knob){
        translate([hakenrotationradius-0.5, 0, (-fahrbahnhoehe+2)])
        cylinder(r = 1.2*gleisdicke/2,h=1.1,$fn=fn);
    }
}

module rotatehaken(xoffset=0,knob=false){
    translate([xoffset,0,0])
    mirror([1,0,0]){
        haken(knob=knob);
    }
}

module fluegel(){
    color("blue")
    translate([schwellensafety,-1,0])
    rotate([45,0,0])
//    cube([fluegelbreite,fluegelhoehe,1]);
    prism(10,1,6,extraw=3);
}


module scheibe(){
    circle(d=gleisdicke);
}


module doppelscheibe(abstand=spurweite){
    translate([-abstand/2,0,0])
    scheibe();
    translate([abstand/2,0,0])
    scheibe();
}

module kurve(winkel=120,scope=1){
    drehschwelle(spurweite=spurweite,winkel=winkel,scope=scope);
//    rotate([0,0,30])
//    translate([scope*.5*5,scope*.5*20])
//    translate([spurweite/2,0])
//    rotate([0,0,90])
//    schwelle();
//    translate([spurweite/2,0])
//    rotate([0,0,90])
//    schwelle();
//    haken
    rotate([0,0,270])
    translate([0,.5*spurweite,fahrbahnhoehe])
    haken();
    rotate([0,0,270])
    translate([0,-.5*spurweite,fahrbahnhoehe])
    haken();
    translate([-scope*0.5*sechseckkantenlaenge, 0])
    rotate_extrude(convexity = 10, angle=winkel, $fn=fn)
    translate([scope*.5*sechseckkantenlaenge, fahrbahnhoehe])
    doppelscheibe();
//    translate([-schwellenbreite/2,0])

}




//rotate
module schwelle(spurweite=spurweite){
   translate([0,0,gleisdicke*1.5])
    rotate([90,0,90])
    difference() {
                translate([0.5*spurweite,0,0])
//                rotate([90,0,0])
                cylinder(d=1.15*spurweite,h=schwellenbreite);
                translate([0.5*spurweite,0,-1])
//                rotate([90,0,0])
                cylinder(d=.95*spurweite,h=schwellenbreite+2);
                translate([-0.5*spurweite,-2.8,-.8*spurweite])
//                rotate([90,0,0])
                cube(spurweite*2);
            }
}

module schwelleold(spurweite=spurweite){
    translate([0,0,gleisdicke/48])
    color("green")
    rotate([-90,0,0])
    cube([schwellenbreite,1,spurweite]);
}

module gleis2(){ //0.1 is the right spiel
gleis(0.1*sechseckhoehe+sechseckhoehe*2,spurweite,extra_schwellen=1);
}

module gleis3(){
gleis(0.1*sechseckhoehe+sechseckhoehe*3,spurweite,extra_schwellen=2);//.2 spiel zu viel
}

module gleis4(){
gleis(0.0*sechseckhoehe+sechseckhoehe*4,spurweite,extra_schwellen=3);
}

module gleis5(){
gleis(.0*sechseckhoehe+sechseckhoehe*5,spurweite,extra_schwellen=3);
}

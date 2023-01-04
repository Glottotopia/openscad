
module canal(){
    translate([-spurweite/2,sechseckhoehe/2-4,-7])
        rotate ([90,45,0])
            cylinder (h = 6, r=2.5, center = true, $fn=4);
//    translate([-spurweite/2,sechseckhoehe/2-hakenrotationradius,4.5])
//        rotate ([0,0,0])
//            cylinder (h = 8, r=2, center = true, $fn=10);

    translate([+spurweite/2,sechseckhoehe/2-4,-7])
        rotate ([90,45,0])
            cylinder (h = 6, r=2.5, center = true, $fn=4);
//    translate([+spurweite/2,sechseckhoehe/2-hakenrotationradius,4.5])
//        rotate ([0,0,0])
//            cylinder (h = 8, r=2, center = true, $fn=10);
  translate([0,sechseckhoehe/2+1,2])
    cube(fahrbahnbreite,center=true)  ;
  translate([spurweite/2,sechseckhoehe/2,-7])
    rotate([90,45,0])
        cylinder(d=gleisdicke*1.05,h=4,center=true,$fn=4);
  translate([-spurweite/2,sechseckhoehe/2,-7])
    rotate([90,45,0])
        cylinder(d=gleisdicke*1.05,h=4,center=true,$fn=4);
}

module canals(slots=[0:5]){
    for(i=slots){
        rotate([0,0,60*i])
        canal();
    }
}

module runways(geometry=false,rotate=0){
    if (geometry=="*"){
        for(i=[0:2]){
            rotate([0,0,60*i+3])
            rotate ([-90,0,0]) cylinder (h = sechseckhoehe+1, d=fahrbahnbreite, center = true, $fn=20);
        }
    }
    if (geometry=="I"){
        rotate([0,0,rotate])
            rotate ([-90,0,0]) cylinder (h = sechseckhoehe+1, d=fahrbahnbreite, center = true, $fn=20);
        canals(slots=[0:5]);
    }
    if (geometry=="X"){
        rotate([0,0,rotate])
        rotate ([-90,0,0]) cylinder (h = sechseckhoehe+1, d=fahrbahnbreite, center = true, $fn=20);
        rotate([0,0,rotate+60])
        rotate ([-90,0,0]) cylinder (h = sechseckhoehe+1, d=fahrbahnbreite, center = true, $fn=20);
    }
    if (geometry=="c"){
        rotate([0,0,rotate])
        translate([-1*0.5*sechseckkantenlaenge, -sechseckhoehe/2-1,-fahrbahnbreite/2+fahrbahnhoehe])
        rotate_extrude(convexity = 10, angle=120, $fn=fn)
        translate([1*.5*sechseckkantenlaenge, fahrbahnhoehe])
        circle(d=fahrbahnbreite);
    }
    if (geometry=="ccc"){
        rotate([0,0,rotate])
        translate([-1*0.5*sechseckkantenlaenge, -sechseckhoehe/2,-fahrbahnbreite/2+fahrbahnhoehe])
        rotate([0,0,-10])
        rotate_extrude(convexity = 10, angle=140, $fn=fn)
            translate([1*.5*sechseckkantenlaenge, fahrbahnhoehe-2])
                rotate([0,0,45])
                    circle(d=fahrbahnbreite+1,$fn=4);
        rotate([0,0,120+rotate])
            translate([-1*0.5*sechseckkantenlaenge, -sechseckhoehe/2,-fahrbahnbreite/2+fahrbahnhoehe])
                rotate([0,0,-10])
                    rotate_extrude(convexity = 10, angle=140, $fn=fn)
                        translate([1*.5*sechseckkantenlaenge, fahrbahnhoehe-2])
                            rotate([0,0,45])
                                circle(d=fahrbahnbreite+1,$fn=4);
        rotate([0,0,240+rotate])
            translate([-1*0.5*sechseckkantenlaenge, -sechseckhoehe/2,-fahrbahnbreite/2+fahrbahnhoehe])
                rotate([0,0,-10])
                    rotate_extrude(convexity = 10, angle=140, $fn=fn)
                        translate([1*.5*sechseckkantenlaenge, fahrbahnhoehe-2])
                            rotate([0,0,45])
                                circle(d=fahrbahnbreite+1,$fn=4);
    }
    if (geometry=="C"){
        rotate([0,0,rotate])
        translate([-3*0.5*sechseckkantenlaenge, -sechseckhoehe/2-1,-fahrbahnbreite/2+fahrbahnhoehe])
        rotate_extrude(convexity = 10, angle=61, $fn=fn)
        translate([3*.5*sechseckkantenlaenge, fahrbahnhoehe])
        circle(d=fahrbahnbreite);
    }
    if (geometry=="cC"){
        rotate([0,0,rotate])
        translate([-1*0.5*sechseckkantenlaenge, -sechseckhoehe/2-1,-fahrbahnbreite/2+fahrbahnhoehe])
        rotate_extrude(convexity = 10, angle=120, $fn=fn)
        translate([1*.5*sechseckkantenlaenge, fahrbahnhoehe])
        circle(d=fahrbahnbreite);
        rotate([0,0,rotate+240])
        translate([-3*0.5*sechseckkantenlaenge, -sechseckhoehe/2-1,-fahrbahnbreite/2+fahrbahnhoehe])
        rotate_extrude(convexity = 10, angle=61, $fn=fn)
        translate([3*.5*sechseckkantenlaenge, fahrbahnhoehe])
        circle(d=fahrbahnbreite);
    }
    if (geometry=="Cc"){
        rotate([0,0,rotate])
        translate([-3*0.5*sechseckkantenlaenge, -sechseckhoehe/2-1,-fahrbahnbreite/2+fahrbahnhoehe])
        rotate_extrude(convexity = 10, angle=61, $fn=fn)
        translate([3*.5*sechseckkantenlaenge, fahrbahnhoehe])
        circle(d=fahrbahnbreite);
        rotate([0,0,rotate+180])
        translate([-1*0.5*sechseckkantenlaenge, -sechseckhoehe/2-1,-fahrbahnbreite/2+fahrbahnhoehe])
        rotate_extrude(convexity = 10, angle=120, $fn=fn)
        translate([1*.5*sechseckkantenlaenge, fahrbahnhoehe])
        circle(d=fahrbahnbreite);
    }
}

module lochset(){
    for(i=[0:5]){
        rotate([0,0,60*i])
        loecher();
    }
}

module hakenfillset(positionen=[0,1,2,3,4,5]){
    for(i=positionen){
        rotate([0,0,60*i])
        hakenfill();
    }
}

module plaettchen(hex_x=0,
        hex_y=0,
        color="orange",
        kantenlaenge=sechseckkantenlaenge,
        hakenpositionen=[],
        geometry=false,
        runwayrotate=0,
        solid=true
        ){
//    color(color,0.6)
    x_offset=hex_x*1.5*sechseckkantenlaenge;
    y_offset=hex_x*0.5*sechseckhoehe+hex_y*sechseckhoehe;
    color([cos((hex_x+1)*122)/2+0.5,
            cos((hex_y+1)*104)/2+0.5,
            cos((hex_x+hex_y+1)*133)/2+0.5],0.8)
if (solid){
    difference() {
            translate([x_offset,y_offset,0])
                linear_extrude(height=plaettchenhoehe)
                    circle($fn=6,r=sechseckkantenlaenge-schlupf);
            translate([x_offset,y_offset,0])
                canals(slots=hakenpositionen);
            translate([x_offset,y_offset,fahrbahnhoehe+spurweite/2+1])
                runways(geometry=geometry,rotate=runwayrotate);
        }
    }
//    runways();
//    add haken
    translate([x_offset,y_offset])
    hakenfillset(positionen=hakenpositionen);
//    label plaettchen
    if (False){
        translate([x_offset-5,y_offset,plaettchenhoehe])
        text(str(hex_x));
        translate([x_offset+5,y_offset,plaettchenhoehe])
        text(str(hex_y));
        }
//    inset
    translate([x_offset,y_offset,-3])
    difference() {
        linear_extrude(height=4)
//            circle($fn=6,d=34); //fits well
            circle($fn=6,d=stopfengroesse);
//        inneres Sechseck
        translate([0,0,-1])
            linear_extrude(height=5)
                circle($fn=6,d=32);
//        Ecken rausschneiden
        translate([0,0,-1])
            rotate([0,0,0])
                linear_extrude(height=5)
                    circle($fn=3,d=35);
//        nochmal Ecken rausschneiden
        translate([0,0,-1])
            rotate([0,0,60])
                linear_extrude(height=5)
                    circle($fn=3,d=35);
    }
}

//plaettchen();


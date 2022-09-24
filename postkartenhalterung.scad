hoehe=25;
durchmesser=5.3;
wandstaerke=2;

fn=100;

module roehre(h,d,w){
    difference(){
        cylinder(h=h,d=d+w*2,$fn=fn);
        translate([0,0,-1])
        cylinder(h=h+2,d=d,$fn=fn);
    }
}

module kreuzstueck(h,d,w,fliptext=false,text=true){
    roehre(h,d,w);
    translate([-h/2,d+w,h/2])
        rotate([0,90,0])
            roehre(h,d,w);
    translate([d/2,-d/2,.5])
    if(text){
        rotate([0,-90,90])
            scale([.7,.7,.7])
                linear_extrude(4)
                    if(fliptext){
                        rotate([0,0,180])
                        translate([-h-d-w-2,-d-w,0])
                        text("xHain");
                    }
                    else{ 
                        text("xHain");
                    }    
            }                
}


module tstueck(h,d,w,text=text,fliptext=fliptext){
    difference(){
        kreuzstueck(h,d,w,text=text,fliptext=fliptext);
        translate([d,d/2,h/2-d])
            cube([h/2,d*2,d*2]);
    }
    translate([d,d+w,h/2])
    rotate([0,90,0])
    cylinder(d=d+2*w,h=1,$fn=fn);
}


module lstueck(h,d,w){
    difference(){
        kreuzstueck(h,d,w,text=text,fliptext=fliptext);
        translate([d,d/2,h/2-d])
            cube([h/2,d*2,d*2]);
        rotate([0,90,90])
            translate([-h/2+d,-d,-d])
                cube([h/2,d*2,d*2]);
    }
    translate([d,d+w,h/2])
    rotate([0,90,0])
    cylinder(d=d+2*w,h=1,$fn=fn);
    translate([0,0,h/2-d+.01])
    rotate([0,0,90])
    cylinder(d=d+2*w,h=1,$fn=fn);
}

module clip(h,d,w){
    difference(){
        roehre(h,d,w);
        translate([(-d-w),-(-d)/3,-1])
            cube([d*2+w*2,h,h+2]);
    }
    clipstaerke=1;
    cliphoehe=5;
    translate([-clipstaerke/2+.7,-d-w*2,0])
        cube([clipstaerke,cliphoehe,h]);
    translate([-clipstaerke/2-.7,-d-w*2,0])
        cube([clipstaerke,cliphoehe,h]);
}

module tstueck_oben(h,d,w){
    tstueck(h,d,w,text=true, fliptext=true);
}

module tstueck_unten(h,d,w){
    tstueck(h,d,w,text=true, fliptext=false);
}

module tstueck_seite(h,d,w){
    tstueck(h,d,w,text=false);
}

//clip(hoehe,durchmesser,wandstaerke);


//clip(10,5,2);

//mirror([0,0,1])
lstueck(hoehe,durchmesser,wandstaerke);
        
    
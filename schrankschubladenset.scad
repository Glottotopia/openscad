include <saegezahn.scad>;

ladenbreite = 120;
gesamttiefe = 250;
ladentiefe = gesamttiefe-5;
mdfwidth = 3;
hinterabstand = 5;
ladenabstand = 4;
randabstand = 6;
gesamtbreite = 3 * ladenbreite + 2 * ladenabstand + 2 * randabstand;
fasslochradius = 10;
randhoehe=10;
threeD = true;
function extrude()= threeD?linear_extrude(mdfwidth):translate([0,0,0]);

module fuehrung(){
//    rotate([0,-90,0])
//    linear_extrude(mdfwidth)
    difference(){
        square([mdfwidth*3,gesamttiefe]);
        translate([0,-15,0])
        saegezahnstrahl(mdfwidth,30,ladentiefe);
    }
}


module ladenunterplatte(){    
//    linear_extrude(mdfwidth)
        difference(){
            square([ladenbreite,ladentiefe]);
            hull(){
            translate([ladenbreite/2-10,fasslochradius*1.5])
                circle(fasslochradius,$fn=20);
            translate([ladenbreite/2+10,fasslochradius*1.5])
                circle(fasslochradius,$fn=20);
            }
            translate([0,15])
                saegezahnstrahl(mdfwidth,30,ladentiefe); 
            translate([ladenbreite-mdfwidth,15])
                saegezahnstrahl(mdfwidth,30,ladentiefe); 
            translate([-15,gesamttiefe-hinterabstand-mdfwidth])
                rotate([0,0,-90])
                    saegezahnstrahl(mdfwidth,30,ladentiefe); 
        }
}

module ladenseite(){
//    rotate([0,-90])
//            linear_extrude(mdfwidth)
    {
                difference(){
                    union(){
                        square([randhoehe,ladentiefe]);
                    }
                    translate([mdfwidth,-15])
                    saegezahnstrahl(mdfwidth,30,ladentiefe);
                }
                translate([2,10]) 
                        circle(3,$fn=20);
                translate([2,70]) 
                        circle(3,$fn=20);
                translate([2,130]) 
                        circle(3,$fn=20);
                translate([2,190]) 
                        circle(3,$fn=20); 
            }
}

module ladenhinterseite(){ 
//        rotate([90,-90])
//            linear_extrude(mdfwidth)
                difference(){
                    square([randhoehe-mdfwidth,ladenbreite-2*mdfwidth]); 
                    translate([0,-45-3,0]) 
                            saegezahnstrahl(mdfwidth,30,ladentiefe); 
                }
}


module lade(){
    color("green")
    ladenunterplatte();
    translate([mdfwidth,0,-mdfwidth])
        ladenseite(); 
    translate([ladenbreite,0,-mdfwidth])             
        ladenseite(); 
    translate([ladenbreite-mdfwidth,ladentiefe-mdfwidth,0])           
        ladenhinterseite(); 
}

module bodenplatte(){
//linear_extrude(mdfwidth)
    difference(){
        square([gesamtbreite, gesamttiefe]); 
                translate([2.5,-45])
                    saegezahnstrahl(mdfwidth,30,ladentiefe*2); 
                translate([-mdfwidth+randabstand+ladenbreite+ladenabstand/2+mdfwidth/2,-45])
                    saegezahnstrahl(mdfwidth,30,ladentiefe*2); 
                translate([-mdfwidth+randabstand+ladenbreite*2+ladenabstand+ladenabstand/2+mdfwidth/2,-45])
                    saegezahnstrahl(mdfwidth,30,ladentiefe*2); 
                translate([-mdfwidth+gesamtbreite-2.5,-45])
                    saegezahnstrahl(mdfwidth,30,ladentiefe*2);  
    }
}



//bodenplatte();
//
//translate([0,0,1]){
//    translate([randabstand,0])
//        translate([0,0,mdfwidth*2])    
//            lade();
//    translate([randabstand+ladenbreite+ladenabstand,0])
//        translate([0,0,mdfwidth*2])    
//            lade();
//    translate([randabstand+2*ladenbreite+2*ladenabstand,0])
//        translate([0,0,mdfwidth*2])   
//            lade();
//}
//
//
//color("blue")
//    translate([2.5+mdfwidth,0,0])
//        fuehrung();
//color("blue")
//    translate([randabstand+ladenbreite+ladenabstand/2+mdfwidth/2,0,0])
//        fuehrung();
//color("blue")
//    translate([randabstand+ladenbreite*2+ladenabstand+ladenabstand/2+mdfwidth/2,0,0])
//        fuehrung();
//color("blue")
//    translate([gesamtbreite-2.5,0,0])
//        fuehrung();


module cutsheet1(){
    bodenplatte();  
    translate([gesamtbreite+10,gesamttiefe])    
        rotate([0,0,180])
            fuehrung();
    translate([gesamtbreite+20,gesamttiefe])    
        rotate([0,0,180])
            fuehrung();
    translate([gesamtbreite+30,gesamttiefe])    
        rotate([0,0,180])
            fuehrung();
    translate([gesamtbreite+40,gesamttiefe])    
        rotate([0,0,180])
            fuehrung();     
}


module cutsheet2(){ 
    ladenunterplatte();
    translate([122,0,0])
        ladenunterplatte();
    translate([244,0,0])
        ladenunterplatte();  
    
    translate([ladentiefe+1,gesamttiefe+3])  
        rotate([0,0,-90])
            ladenhinterseite();  
    translate([ladentiefe+1,gesamttiefe+11])  
        rotate([0,0,-90])
            ladenhinterseite();  
    translate([ladentiefe+1,gesamttiefe+19])  
        rotate([0,0,-90])
            ladenhinterseite();         
    
    translate([ladentiefe,gesamttiefe-4])  
        rotate([0,0,90])
            ladenseite();   
    translate([ladentiefe,gesamttiefe-4+11])  
        rotate([0,0,90])
            ladenseite();   
    translate([ladentiefe,gesamttiefe-4+22])  
        rotate([0,0,90])
            ladenseite();  
            
    translate([3*ladenbreite+15,ladentiefe])  
        rotate([0,0,180])
            ladenseite();  
    translate([3*ladenbreite+26,ladentiefe])  
        rotate([0,0,180])
            ladenseite();  
    translate([3*ladenbreite+37,ladentiefe])  
        rotate([0,0,180])
            ladenseite();  
}

echo(gesamtbreite);
echo(gesamttiefe);

cutsheet1();
    




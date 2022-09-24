difference(){
linear_extrude(3)
    scale([.66,.66])
        import("baustelle.svg");
translate([0,0,1])    
linear_extrude(22)
    translate([55,20,1])
        import("bauarbeiter.svg");
} 
rotate([-60,0,0]) 
 linear_extrude(2)
    translate([87,0])
    square([20,120]);
    
translate([87,5,-1])    
rotate([0,90,0])    
cylinder(h=20,d=6,$fn=20) ;   
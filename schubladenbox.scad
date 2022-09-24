outerwidth = 100; 
outerlength = 50; 
outerheight = 50;
wallthickness = 2; 
innerwidth=outerwidth-2*wallthickness; 
innerlength=outerlength-2*wallthickness;
innerheight=outerheight-wallthickness;
epsilon=.01;

difference(){
    cube([outerwidth,outerlength,outerheight]);
    translate([wallthickness,wallthickness,wallthickness+epsilon])
        cube([innerwidth,innerlength,innerheight]);
//    schraege
    translate([-epsilon,0,innerheight/2])
        rotate([60,0,0])
            cube([outerwidth+2*epsilon,40,40]);     
}


translate([1,wallthickness,innerheight/2+1.2])
    rotate([60,0,0])
        minkowski(){
            cube([30,12,.1]);  
            sphere(1,$fn=20);
        }

translate([wallthickness,wallthickness,-1])
    cube([innerwidth,innerlength,wallthickness]);


translate([8,.5,3])
    rotate([90,0,0])
    linear_extrude(1)
    scale([.08,.08])
        import("sawfish.svg");

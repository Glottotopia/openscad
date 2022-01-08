hpieces = 8;
vpieces = 5;
blockwidth = 20;
entrywidth = 4;
paroiwidth = (blockwidth-entrywidth)/2;
linkersize = 4;

for (h=[0:hpieces]){
    for (v=[0:vpieces]){
        translate([h*blockwidth,v*blockwidth]){
            color("orange",.2)
                difference(){
                square([blockwidth,blockwidth]);
                translate([.1,.1])
                    square([blockwidth-.2,blockwidth-.2]);
                }
                    
//            color("black")
//                square([linkersize,linkersize],center=true);
            
//            translate([paroiwidth,0])
//                color("red")
//                    square([linkersize/2,linkersize/2],center=true);
//            translate([paroiwidth+entrywidth,0])
//                color("red")
//                    square([linkersize/2,linkersize/2],center=true);   
            
            rand = rands(-entrywidth,entrywidth,1)[0];
            offset = 0;
            if (rand>0){                 
                color("pink",.9)
                translate([paroiwidth,0])
                square([entrywidth,entrywidth]);
            }
            else{
                translate([paroiwidth,-entrywidth])
                color("pink",.5)
                square([entrywidth,entrywidth]);
            } 
//            translate([0,paroiwidth])
//                color("green")
//                    square([linkersize/2,linkersize/2],center=true);
//            translate([0,paroiwidth+entrywidth])
//                color("green")
//                    square([linkersize/2,linkersize/2],center=true);  
            rand = rands(-entrywidth,entrywidth,1)[0];
            offset = 0;
            if (rand>0){                 
                color("brown",.9)
                translate([0,paroiwidth])
                square([entrywidth,entrywidth]);
            }
            else{
                translate([-entrywidth,paroiwidth])
                color("brown",.5)
                square([entrywidth,entrywidth]);
            }         
        }        
    }
}
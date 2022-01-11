hpieces = 4;
vpieces = 3;
blockwidth = 20;
entrywidth = 4;
paroiwidth = (blockwidth-entrywidth)/2;
linkersize = 4;
randomspread = .1;

matrix = concat(
    [[for (i=[0:hpieces+1]) [0,i*100]]],
    [for (i=[0:hpieces+1]) 
        concat(
            [[(i+1)*100,0]],
            [for (j=[0:vpieces+1]) 
                    [randpercent(i,randomspread),randpercent(j,randomspread)]
            ]
        )
]
);
//echo(matrix);
    
//
//for (h=[0:hpieces]){
//    if (h%2==1){
////        continue
//    }
//    else{
//        for (v=[0:vpieces]){
//            hpos = h*blockwidth;
//            if (v%2==0){
//                hpos = (h+1)*blockwidth;
//                translate([hpos,v*blockwidth]){
//                    puzzlestueck();
//                }
//            }
//            else{
//                translate([hpos,v*blockwidth]){
//                    puzzlestueck(); 
//                }         
//            }  
//        }      
//    }
//}

function randpercent(i,p)= 100*(rands(1-p,1+p,1)[0]+i); 

for (h=[0:hpieces]){
    for (v=[0:vpieces]){ 
        if(h%2==v%2){
            puzzlestueck(h,v);
        }
    }
}
    
module puzzlestueck(i,j){       
//    translate([hpos,v*blockwidth]){ 
//        color("orange",.2)
//                difference(){
    corner1 = matrix[i][j];
    corner2 = matrix[i+1][j]; 
    corner3 = matrix[i+1][j+1];
    corner4 = matrix[i][j+1];
    lateraloffset1 = 10*rands(1-randomspread,1+randomspread,1)[0];
    lateraloffset2 = 10*rands(1-randomspread,1+randomspread,1)[0];
    orthogonaloffset1 = 20*rands(1-randomspread,1+randomspread,1)[0];
    orthogonaloffset2 = 20*rands(1-randomspread,1+randomspread,1)[0];
    sign_ = sign(rand1 = rands(-1,1,1)[0]);    
    echo(sign_);
    m12a = [(corner1[0]+corner2[0])/2-lateraloffset1,(corner1[1]+corner2[1])/2+0]; 
    m12b = [(corner1[0]+corner2[0])/2-lateraloffset1,(corner1[1]+corner2[1])/2-orthogonaloffset1*sign_];  
    m12c = [(corner1[0]+corner2[0])/2+lateraloffset2,(corner1[1]+corner2[1])/2-orthogonaloffset2*sign_];
    m12d = [(corner1[0]+corner2[0])/2+lateraloffset2,(corner1[1]+corner2[1])/2+0]; 
    echo(corner1,m12a,corner2,corner3,corner4);
    color("green",rands(.2,1,1)[0])
    polygon([corner1,m12a,m12b,m12c,m12d,corner2,corner3,corner4]); 
    rand = rands(-entrywidth,entrywidth,1)[0]; 
    rand2 = rands(-entrywidth,entrywidth,1)[0];  
//    if (rand>0){           
//        if (rand2>0){ //weg weg
//            difference(){
//                square([blockwidth,blockwidth]);        
//                translate([paroiwidth,0])
//                    fuesschen();
//                translate([paroiwidth,blockwidth-entrywidth]) 
//                    rotatefuesschen();
//            }
//        }
//        else{//weg dazu
//            union(){                    
//                difference(){
//                    square([blockwidth,blockwidth]);        
//                translate([paroiwidth,0])
//                    fuesschen();
//                }
//                translate([paroiwidth,blockwidth]) 
//                    fuesschen();
//            } 
//        }
//    }
//    else{          
//        if (rand2>0){ //dazu weg
//            union(){
//                difference(){
//                    square([blockwidth,blockwidth]);        
//                    translate([paroiwidth,blockwidth-entrywidth])
//                        rotatefuesschen();
//                }
//                translate([paroiwidth,-entrywidth]) 
//                rotatefuesschen();
//            }
//        }
//        else{//dazu dazu
//            union(){ 
//                square([blockwidth,blockwidth]);        
//                translate([paroiwidth,-entrywidth])
//                    rotatefuesschen();   
//                translate([paroiwidth,blockwidth])
//                    fuesschen();
//                } 
//            }
//        } 
    }   
    

module fuesschen(angle=0){
    union(){
        translate([0,0])
            hals();
        translate([0,3])
            kopf();
    }
}

module rotatefuesschen(){
    translate([0,3.3])
    rotate(180)
        fuesschen();
}
    
module hals(){
    circle(1,$fn=20);
}

module kopf(){
    circle(3,$fn=20);
}

//fuesschen();
    
    
        
//TODO 
//randstuecke
//bezier
//union/difference

hpieces = 14;
vpieces = 13;
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
    
    lateraloffset121 = 10*rands(1-randomspread,1+randomspread,1)[0];
    lateraloffset122 = 10*rands(1-randomspread,1+randomspread,1)[0];
    orthogonaloffset121 = 20*rands(1-randomspread,1+randomspread,1)[0];
    orthogonaloffset122 = 20*rands(1-randomspread,1+randomspread,1)[0];
    sign_ = sign(rand1 = rands(-1,1,1)[0]);    
    echo(sign_);
    m12a = [(corner1[0]+corner2[0])/2-lateraloffset121,(corner1[1]+corner2[1])/2+0]; 
    m12b = [(corner1[0]+corner2[0])/2-lateraloffset121,(corner1[1]+corner2[1])/2-orthogonaloffset121*sign_];  
    m12c = [(corner1[0]+corner2[0])/2+lateraloffset122,(corner1[1]+corner2[1])/2-orthogonaloffset122*sign_];
    m12d = [(corner1[0]+corner2[0])/2+lateraloffset122,(corner1[1]+corner2[1])/2+0]; 
    
    lateraloffset231 = 10*rands(1-randomspread,1+randomspread,1)[0];
    lateraloffset232 = 10*rands(1-randomspread,1+randomspread,1)[0];
    orthogonaloffset231 = 20*rands(1-randomspread,1+randomspread,1)[0];
    orthogonaloffset232 = 20*rands(1-randomspread,1+randomspread,1)[0];
    sign2 = sign(rand1 = rands(-1,1,1)[0]); 
    echo(sign_);
    m23a = [(corner2[0]+corner3[0])/2+0,(corner2[1]+corner3[1])/2-lateraloffset231]; 
    m23b = [(corner2[0]+corner3[0])/2-orthogonaloffset231*sign2,(corner2[1]+corner3[1])/2-lateraloffset231];  
    m23c = [(corner2[0]+corner3[0])/2-orthogonaloffset232*sign2,(corner2[1]+corner3[1])/2+lateraloffset232];
    m23d = [(corner2[0]+corner3[0])/2+0,(corner2[1]+corner3[1])/2+lateraloffset232]; 
    
    lateraloffset341 = 10*rands(1-randomspread,1+randomspread,1)[0];
    lateraloffset342 = 10*rands(1-randomspread,1+randomspread,1)[0];
    orthogonaloffset341 = 20*rands(1-randomspread,1+randomspread,1)[0];
    orthogonaloffset342 = 20*rands(1-randomspread,1+randomspread,1)[0];
    sign3 = sign(rand1 = rands(-1,1,1)[0]);    
    echo(sign_);
    m34a = [(corner4[0]+corner3[0])/2-lateraloffset341,(corner4[1]+corner3[1])/2+0]; 
    m34b = [(corner4[0]+corner3[0])/2-lateraloffset341,(corner4[1]+corner3[1])/2-orthogonaloffset341*sign3];  
    m34c = [(corner4[0]+corner3[0])/2+lateraloffset342,(corner4[1]+corner3[1])/2-orthogonaloffset342*sign3];
    m34d = [(corner4[0]+corner3[0])/2+lateraloffset342,(corner4[1]+corner3[1])/2+0];  
    
    
    lateraloffset411 = 10*rands(1-randomspread,1+randomspread,1)[0];
    lateraloffset412 = 10*rands(1-randomspread,1+randomspread,1)[0];
    orthogonaloffset411 = 20*rands(1-randomspread,1+randomspread,1)[0];
    orthogonaloffset412 = 20*rands(1-randomspread,1+randomspread,1)[0];
    sign4 = sign(rand1 = rands(-1,1,1)[0]); 
    echo(sign_);
    m41a = [(corner4[0]+corner1[0])/2+0,(corner4[1]+corner1[1])/2-lateraloffset411]; 
    m41b = [(corner4[0]+corner1[0])/2-orthogonaloffset411*sign4,(corner4[1]+corner1[1])/2-lateraloffset411];  
    m41c = [(corner4[0]+corner1[0])/2-orthogonaloffset412*sign4,(corner4[1]+corner1[1])/2+lateraloffset412];
    m41d = [(corner4[0]+corner1[0])/2+0,(corner4[1]+corner1[1])/2+lateraloffset412]; 
    
    
//    echo(corner1,m12a,corner2,corner3,corner4);
    color("green",rands(.2,1,1)[0])
    polygon([corner1,m12a,m12b,m12c,m12d,corner2,m23a,m23b,m23c,m23d,corner3,m34d,m34c,m34b,m34a,corner4,m41d,m41c,m41b,m41a]); 
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
    
    
        
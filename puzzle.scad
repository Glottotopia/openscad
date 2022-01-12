//TODO 
//randstuecke
//bezier linie polygon 
//correct x.y placement of fuesse

hpieces = 14;
vpieces = 13;
blockwidth = 100;
entrywidth = 4;
paroiwidth = (blockwidth-entrywidth)/2;
linkersize = 4;
randomspread = .1;

//create some fuzziness
function randpercent(i,p)= 100*(rands(1-p,1+p,1)[0]+i); 

//get a list of points in a x.y grid with some fuzziness
matrix = concat(
    [[for (i=[0:hpieces+1]) [0,i*blockwidth]]],
    [for (i=[0:hpieces+1]) 
        concat(
            [[(i+1)*blockwidth,0]],
            [for (j=[0:vpieces+1]) 
                    [randpercent(i,randomspread),randpercent(j,randomspread)]
            ]
        )
]
);
 


for (h=[0:hpieces]){
    for (v=[0:vpieces]){ 
        if(h%2==v%2){
            color("green",rands(.2,1,1)[0])
            puzzlestueck(h,v);
        }
    }
}
    
module puzzlestueck(i,j){        
    corner1 = matrix[i][j];
    corner2 = matrix[i+1][j]; 
    corner3 = matrix[i+1][j+1];
    corner4 = matrix[i][j+1];
 
    unionordifference = rands(-entrywidth,entrywidth,4);  
    union(){
        difference(){
            polygon([corner1,corner2,corner3,corner4]);  
            if (unionordifference[0]<0){   
                if(j==0){
//                    echo(j,j==0); 
                }
                else{
                translate([0,10])
                rotate([0,0,0])
                translate([corner1[0]+blockwidth/2,corner1[1]])
                    fuss();  
                }
            }  
            if (unionordifference[1]<0){
                if(i==hpieces){
//                    echo(i,i==hpieces); 
                }
                else{
                translate([corner2[0],corner2[1]+blockwidth/2])
                translate([-10,0])
                rotate([0,0,90])
                    fuss();
                }
            }  
            if (unionordifference[2]<0){ 
                if(j==vpieces){
//                    echo(j,j==vpieces); 
                }
                else{
                translate([corner4[0]+blockwidth/2,corner4[1]])
                translate([0,-10])                
                rotate([0,0,-180])
                    fuss();
                }
            }  
            if (unionordifference[3]<0){   
                if(i==0){
//                    echo(i,i==0); 
                }
                else{   
                translate([corner1[0],corner1[1]+blockwidth/2])
                translate([10,0])
                rotate([0,0,270])
                    fuss(); 
            }
            } 
        }  
            if (-unionordifference[0]<0){          
                if(j==0){
//                    echo(j,j==0); 
                }
                else{
                translate([0,-10])
                translate([corner1[0]+blockwidth/2,corner1[1]])
                rotate([0,0,180])
                    fuss(); 
                }
            }
            if (-unionordifference[1]<0){
                if(i==hpieces){
//                    echo(i,i==hpieces); 
                }
                else{
                translate([corner2[0],corner2[1]+blockwidth/2])
                translate([10,0])
                rotate([0,0,-90])
                    fuss();
                }
            }  
            if (-unionordifference[2]<0){
                if(j==vpieces){
//                    echo(j,j==vpieces); 
                }
                else{
                translate([corner4[0]+blockwidth/2,corner4[1]])
                translate([0,10])                
                rotate([0,0,0])
                    fuss();
                }
            }  
            if (-unionordifference[3]<0){     
                if(i==0){
//                    echo(i,i==0); 
                }
                else{   
                translate([corner1[0],corner1[1]+blockwidth/2])
                translate([-10,0])
                rotate([0,0,90])
                    fuss(); 
                }
            }         
        }
    }   

module klecks(s=6){
    hull() {
        rotaterands = rands(-1,1,48);
        for (i1=[0:24]){            
            rotate([0,0,i1*15])
            translate([s+rotaterands[i1],0])
            circle(5,$fn=20);
        }
    }
}
 
module fuss(){
    fussrands = rands(-1,1,4);
    rotate(4*fussrands[0])
        hull(){
            klecks();
            translate([1*fussrands[0],-20+2*fussrands[1]])
                klecks(s=1);
        }
}  
outer = 155;
inner = 125;
offset = 47;
inset = 40;
boardwidth=15;

module cross(){
    square([inner,inner]);
    translate([inner,inner/2-inset/2,0])
        square([boardwidth,inset]);
    translate([-boardwidth,inner/2-inset/2])
        square([boardwidth,inset]);
    translate([inner/2-inset/2,-boardwidth])
        square([inset,boardwidth]);
    translate([inner/2-inset/2,inner])
        square([inset,boardwidth]);
}

list =[
 [4,12],[3,11],[3,8],[2,10],[3,10],[5,10],[6,11],[2,15],[3,11],[2,10],[2,7],[4,8],[2,7],[4,8]
];

difference(){
    cross();
    translate([0,10,0])
    union(){
        for (i=[1:12]){
            translate([i*10,0,0])
           square(list[i],center=true);
        }
    } 
}

translate([0,0,-5])
difference(){
    color("red",.3)
    cross();
    translate([0,10,0])
    union(){
        for (i=[1:12]){
            translate([i*10,0,0])
            scale([1.3,1.3])
                square(list[i],center=true);
        }
    } 
}

    
    

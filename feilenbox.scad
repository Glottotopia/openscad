outer = 155;
inner = 125;
offset = 47;
inset = 40;
boardwidth=15;

module cross(){
    square([inner,inner]);
    translate([inner,inner/2-inset/2,0])
        difference(){
            square([boardwidth,inset]);
            translate([7.5,20,0])
                circle(d=4,$fn=30);
        }
    translate([-boardwidth,inner/2-inset/2])
        (){
            square([boardwidth,inset]);
            translate([7.5,20,0])
                circle(d=4,$fn=30);
        } 
    translate([inner/2-inset/2,-boardwidth])
        difference(){
            square([inset,boardwidth]);
            translate([20,7.5,0])
                circle(d=4,$fn=30);
        }
        square([inset,boardwidth]);
    translate([inner/2-inset/2,inner])
        difference(){
            square([inset,boardwidth]);
            translate([20,7.5,0])
                circle(d=4,$fn=30);
        } 
}

list1 =[
 [5,20],[4,4],[5,20],[4,4]
];

list2 =[
 [10,10],[10,26],[10,10],[10,20]
];

list3 =[
 [15,32],[4,4],[10,30],[4,4] //demilune
];

list4 =[
 [9,9],[10,12],[9,9],[10,20] //circle
];

difference(){
    cross();
    translate([0,20,0])
    union(){
        for (i=[0:4]){
            translate([i*30+20,0,0])
           square(list1[i],center=true);
        }
    }  
    translate([0,45,0])
    union(){
        for (i=[0:4]){
            translate([i*30+20,0,0])
           square(list2[i],center=true);
        }
    } 
    translate([0,75,0])
    union(){
        for (i=[0:4]){
            translate([i*30+20,0,0])
           square(list3[i],center=true);
        }
    } 
    translate([0,105,0])
    union(){
        for (i=[0:4]){
            translate([i*30+20,0,0])
           square(list4[i],center=true);
        }
    } 
}

translate([156,0,0])
difference(){
    color("red",.3)
    cross();
    translate([0,20,0]) 
            for (i=[0:4]){
                translate([i*30+20,0,0])
            scale([1.3,1.3])
               square(list1[i],center=true);
            } 
    translate([0,45,0]) 
        for (i=[0:4]){
            translate([i*30+20,0,0])
            scale([1.3,1.3])
           square(list2[i],center=true);
        } 
    translate([0,75,0]) 
        for (i=[0:4]){
            translate([i*30+20,0,0])
            scale([1.3,1.3])
           square(list3[i],center=true);
        } 
    translate([0,105,0]) 
        for (i=[0:4]){
            translate([i*30+20,0,0])
            scale([1.3,1.3])
           square(list4[i],center=true); 
    } 
} 

    
    

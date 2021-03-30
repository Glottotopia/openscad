

module cube(x,y,z){ 
    linear_extrude(height = z)
        square([x, y]);
}  

module schrankweiss(x=0,y=0){
    color("white")
    translate([x,y, 0])
    cube(60,112,200);
}

module schrankbraun(x=0,y=0){
    color("#AA8800")
    translate([x,y,0])
    cube(53,118,198);
}

module heizung(x=0,y=0){
    color("#666666")
    translate([x,y,0])
    cube(58,18,73);
}

module matratze(x=0, y=0, mycolor="beige", height=0){
    color(mycolor)
    translate([x,y,height])
    cube(135,200,31.5);
}

module hochebene1(x=0, y=0, height=237){
    color("#aa7700",0.5)
    translate([x,y,height])
    cube(171,220,15);   
//    translate([x+171,y,height-37])
//    cube(15,220,52);  
    
}


module hochebene2(x=0, y=0, height=190){
    color("#aa7700",0.5)
    translate([151,y,height])
    cube(213,220,15); 
    translate([0,80,-72])
    rotate([20,0,0])
    leiter(x+260,y+220)
    ;
}

module brett(x=0, y=0, height=100){    
    color("#aa7700",0.5)
    translate([x,y,height])
    cube(200,30,3);
}


module brett2(x=0, y=0, height=100){    
    color("#aa7700",0.5)
    translate([x,y,height])
    cube(30,100,3);
}

module brett3(x=0, y=0, height=100){    
    color("#aa7700",0.5)
    translate([x,y,height])
    cube(30,61,3);
}

module brett4(x=0, y=0, height=100){    
    color("#aa7700",0.5)
    translate([x,y,height])
    cube(30,155,3);
}

module regalwand1(x=0, y=0, height=0){
    color("#aa7700",0.5)
    translate([x,y,height])
    cube(3,30,190);
}


module regalwand2(x=0, y=0, height=0){
    color("#aa7700",0.5)
    translate([x,y,0])
    cube(30,3,307);
}

module regalwand3(x=0, y=0, height=0){
    color("#aa7700",0.5)
    translate([x,y,200])
    cube(30,3,107);
}

module regalwand4(x=0, y=0, height=0){
    color("#aa7700",0.5)
    translate([x,y,0])
    cube(50,3,190);
}



module leiter(x=0, y=0){
    translate([x,y,0])    
    holm(0,0);
    translate([x,y,0])    
    holm(40,0); 
    sprosse(x+2.5,y-8,3,30);   
    sprosse(x+2.5,y-8,3,60);  
    sprosse(x+2.5,y-8,3,90);  
    sprosse(x+2.5,y-8,3,120);  
    sprosse(x+2.5,y-8,3,150);  
    sprosse(x+2.5,y-8,3,180);
}

module holm(x=0, y=0, dicke=5){
    translate([x,y,104])
    linear_extrude(height = 215, center = true)
    translate([2, 0, 0])
    circle(r = 2,$fn=20);    
//    cube(dicke,dicke,210);
}

module stange(x=0, y=0, dicke=5){
    color("black")
    translate([x,y,150])    
    cube(2,140,2);
}



module sprosse(x=0, y=0, dicke=3, hoehe=0){
    translate([x,y,hoehe])  
    rotate([-20,0,0])  
    cube(40,20,dicke);
}


module kindermatratze(x=0, y=0, mycolor="beige", height=0){
    color(mycolor)
    translate([x,y,height])
    cube(80,180,20);
}

module pfosten(x=0, y=0, dicke=10){
    translate([x,y,0])    
    cube(dicke,dicke,237);
}

module regal(x=0, y=0){
    color("black")
    translate([x,y,0])
    cube(150,40,150);
}

module kaefig(x=0, y=0){
    color("green" ,0.5)
    translate([x,y,0])
    cube(50,100,70.5);
}

module schreibtisch(x=0, y=0){
    color("red" ,0.5)
    translate([x,y,200])
    cube(108,54,72);
}

//module bett(x=0,y=0){
//    kindermatratze(x,y,"beige",0);
//    kindermatratze(x,y,"beige",100);
//    pfosten(x,y,10);
//    pfosten(x+70,y,10);
//    pfosten(x,y+170,10);
//    pfosten(x+70,y+170,10);
//}
 
 
 
module door(x,y){
    color("#555555",0.4)
    translate([x,y-10,0])
    rotate([0,0,40])
    cube(119,4,237);
//    
    color("#ffffff",0.1)
    translate([x,y-10,0]) 
    cube(119,20,237);
}

module wall(x,y,offsetX,offsetY){
    color("#ffffff")
    translate([offsetX, offsetY,0])
        cube(x,y,305);
}

module stuck(x,offsetX,offsetY){    
    color("blue", 0.25) 
    translate([offsetX, offsetY,306]) 
    rotate([330,0,0])
    rotate([0,0,0])
    cube(x, 3, 16);
}

module vorhang(x,y){
    color("pink", 0.5)
    translate([x, y, 10])
        linear_extrude(height = 190, twist = 5)
            square([1, 140]);
}

module flurwall(x,offsetX,offsetY){
    wall(x,3,offsetX,offsetY);
}

module upperflurwall(x,offsetX,offsetY){
    color("#ffffff")
    translate([offsetX, offsetY, 237])
        linear_extrude(height = 67)
            square([x, 3]);
}



module peggywall(y,offsetX,offsetY){
    wall(3,y,offsetX,offsetY);
}

module myfloor(points){
    linear_extrude([0,0,3])
    color("#664400",0.5)   
    polyhedron(
        points=points,
        faces=[[0,1,2,3,4,5,6,7]]
    );   
}
 

//translate([150,160])
//    circle(90);


//myfloor([[0,0],[351,0],[351,62],[363,62],[363,650],[-90,650],[-90,450],[0,350]]);

//cube(363,650,2);

//upperflurwall(151,0,0);
//color("blue", 0.25) 
//translate([0, 0,306]) 
//rotate([315,0,0]) 
//cube(351, 3, 22);

//color("blue", 0.25) 
//translate([0, 0,306]) 
//rotate([0,45,0]) 
//cube(3, 200, 22);

//color("blue", 0.25) 
//translate([351, 0,306]) 
//rotate([0,315,0]) 
//cube(3, 61, 22);
 
//flurwall(200,151,0);
//flurwall(13,351,62);
//peggywall(62,351,0);   
//peggywall(590,363,62);      
            
//door(33,0);

//schrankweiss(300,540);
//schrankbraun(307,261);

//matratze(50,510);
//matratze(50,510,"white",32);

//regal(322,350);
//kaefig(310,450);

//schreibtisch(200,0);

//bett(220,6S0);
 

hochebene1(0,0);
//hochebene2(0,0);
pfosten(151,210);
pfosten(151,0);
//matratze(30,0,"white",247);
//matratze(185,0,"white",200);

//heizung(288,0);

//regalwand1(161,0);
//regalwand1(249,0);
////brett(151,0,40);
//brett(151,0,80);
//brett(151,0,115);
//brett(151,0,150);
//regalwand1(348,0);
 
 

regalwand2(0,0); 
brett2(0,0,40);
brett2(0,0,80);
brett2(0,0,120);
brett2(0,0,160);
brett2(0,0,200);
//
//brett2(0,0,240);
brett2(0,0,275);
//brett2(0,0,290); 
regalwand2(0,100); 
//brett2(0,100,265);  
brett2(0,100,40);
brett2(0,100,80);
brett2(0,100,120);
brett2(0,100,160);
brett2(0,100,200);
brett2(0,100,275);  
regalwand2(0,200); 
 

//regalwand3(321,1);  
//brett3(321,0,240);
//brett3(321,0,265);
//brett3(321,0,290); 
//regalwand3(321,61);  

//vorhang(300,61);
//stange(340,61); 


//regalwand4(314,63); 
//brett4(334,63,25);
//brett4(334,63,50); 
//brett4(334,63,150); 
//regalwand4(314,210);


//translate([50,210,60])
//    linear_extrude(height = 300, twist = 2600)
//        scale([1.5,.5])circle(d=4);
//        
//translate([290,180,190])
//    color("#222222")
//        rotate([90,0,0])
//            linear_extrude(height = 100, twist = 12600)
//                scale([1.5,.5])circle(d=4);
//                
//translate([270,180,190])
//    color("#222222")
//        rotate([90,0,0])
//            linear_extrude(height = 100, twist = 12600)
//                scale([1.5,.5])circle(d=4);
//                
//translate([250,180,190])
//    color("#222222")
//        rotate([90,0,0])
//            linear_extrude(height = 100, twist = 12600)
//                scale([1.5,.5])circle(d=4);
//                
//translate([230,180,190])
//    color("#222222")
//        rotate([90,0,0])
//            linear_extrude(height = 100, twist = 12600)
//                scale([1.5,.5])circle(d=4);
//                
//translate([210,180,190])
//    color("#222222")
//        rotate([90,0,0])
//            linear_extrude(height = 100, twist = 12600)
//                scale([1.5,.5])circle(d=4);
//                
//translate([190,180,190])
//    color("#222222")
//        rotate([90,0,0])
//            linear_extrude(height = 100, twist = 12600)
//                scale([1.5,.5])circle(d=4);
                 
                
//translate([250,80,200])
//    color("blue")
//        linear_extrude(height = 55, twist = 99)
//            scale([1.2,.7])circle(d=40);
        
        
//translate([361,380,20])
//    color("turquoise", 0.3)
//    cube(2,80,180);
                
// 
//translate([310,367,0])
//    color("#aa7700",0.5)
//    cube(50,3,50); 
//translate([310,317,0])
//    color("#aa7700",0.5)
//    cube(50,3,100); 
//translate([310,267,0])
//    color("#aa7700",0.5)
//    cube(50,3,150); 
//translate([310,217,0])
//    color("#aa7700",0.5)
//    cube(50,3,200); 
//    
//     
//translate([310,270,50])
//    color("#aa7700",0.5)
//    cube(50,100,3); 
//translate([310,220,100])
//    color("#aa7700",0.5)
//    cube(50,100,3); 
//translate([310,30,150])
//    color("#aa7700",0.5)
//    cube(50,240,3); 
//    
//color("#00cc00")
//    translate([100,220,237])
//    rotate([90,0,180])
//    text("1");
//    
//color("#00cc00")
//    translate([250,220,190])
//    rotate([90,0,180])
//    text("2");
//    
//color("#00cc00")
//    translate([340,320,75])
//    rotate([90,0,180])
//    text("3"); 
//    
//color("#00cc00")
//    translate([20,205,175])
//    rotate([90,0,180])
//    text("4");
//    
//color("#00cc00")
//    translate([340,65,270])
//    rotate([90,0,180])
//    text("5");
//    
//
//color("#00cc00")
//    translate([250,35,120])
//    rotate([90,0,180])
//    text("6");
//    
//color("#00cc00")
//    translate([330,75,80])
//    rotate([90,0,180])
//    text("7");
//                
                
                
            

 
 
  
 
 




            
            
 
                        

            
            
            
            
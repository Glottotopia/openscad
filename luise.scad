luise = "L u  is e";

translate([-1,32,8])
rotate([90,0,0])
    for (i=[0:8]){
        rotate([0,0,20+14*i])
            translate([11,0,0])
                rotate([90,0,111])
                    linear_extrude(2)
                        text(luise[i]);
    }

import("perrito_dog.stl");
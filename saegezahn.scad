module saegezahnstrahl(saegezahntiefe,saegezahnbreite,length,offset=0){
    epsilon=0.01;
    difference(){
        square([saegezahntiefe,length]);
            for (i=[0:length/saegezahnbreite]){
                translate([-epsilon,offset*saegezahnbreite+i*saegezahnbreite*2-epsilon])
                    square([saegezahntiefe*1.5+epsilon*2,saegezahnbreite+epsilon*2]);
        }
    }
}
 
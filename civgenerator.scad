radius=1; 
long_diameter=2; 
short_diameter=2*sin(60)*radius;

mapsizes = [
 [40,25,2,6],
 [56,36,4,10],
 [66,42,6,15],
 [80,52,8,20],
 [104,64,10,30],
 [128,80,12,40]
];
//Duel:      40 x 25  (2 players, 4 city-states, 2 natural wonders)
//Tiny:      56 x 36  (4 players, 8 city-states, 3 natural wonders)
//Small:     66 x 42  (6 players, 12 city-states, 3 natural wonders)
//Standard:  80 x 52  (8 players, 16 city-states, 4 natural wonders)
//Large:    104 x 64  (10 players, 20 city-states, 6 natural wonders)
//Huge:     128 x 80  (12 players, 24 city-states, 7 natural wonders)

size = 0;
mapspecs = mapsizes[size];
xrange = mapspecs[0];
yrange = mapspecs[1];
number_of_continents = mapspecs[2];
number_of_islands = mapspecs[3];

surface_=(xrange+1)*(yrange+1);
percent_landmass = .45;
land_tiles = surface_*percent_landmass;


//number_of_mountain_ranges = number_of_continents; 

number_of_smaller_mountains = floor(number_of_islands/percent_landmass);
number_of_vegetation_ranges= floor(number_of_islands/percent_landmass);
number_of_rivers=number_of_continents*2;

hill_percentage = 10;
jungle_percentage = 80;
snow_percentage = 80;
desert_percentage_equator = 50;
grassland_percentage = 40;


tiles_per_continent = floor(land_tiles/number_of_continents)-1;
tiles_per_island = 20;
tiles_per_mountain = tiles_per_island;
tiles_per_vegetation_range = 2*tiles_per_island;
//echo(tiles_per_continent);

module hex(x,y,elevation=.1,resource="",color_="blue"){
    x_offset=x*1.5*long_diameter;  
    y_offset_coefficient = f_y_offsetc(x,y); 
    y_offset = y_offset_coefficient*short_diameter; 
//    color(color,.5)
    translate([x_offset,y_offset])
        {
        color(color_,.5)
        cylinder($fn=6,d1=long_diameter*1.95,d2=long_diameter/2,h=elevation);
            scale([.1,.1]){                
            translate([-6,3])
            text(str(x));
            translate([-6,-10])
            text(str(y));
            }
        color("black")
        translate([-1,-1,elevation])
            scale([.2,.2])
                text(resource);
        }
}

function f_y_offsetc(x,y)=x%2==0?(y*2-x)+x:(y*2-x)+x+1;
 
function all_surrounding_tiles(coord) = coord[0]%2==0? 
                                        [[coord[0],coord[1]+1],
                                         [coord[0],coord[1]-1],
                                         [coord[0]+1,coord[1]],
                                         [coord[0]-1,coord[1]],
                                         [coord[0]-1,coord[1]-1],
                                         [coord[0]+1,coord[1]-1]
                                        ]:                                      
                                        [[coord[0],coord[1]+1],
                                         [coord[0],coord[1]-1],
                                         [coord[0]+1,coord[1]],
                                         [coord[0]-1,coord[1]],
                                         [coord[0]-1,coord[1]+1],
                                         [coord[0]+1,coord[1]+1]
                                        ];
 
function get_one_more_tile(list) = 
    concat(list, [get_one_neighboring_tile(
        list[
            floor(rands(max(0,len(list)-6),len(list),1)[0])
//            floor(rands(0,len(list),1)[0])
            ])]
        );
        
//module river_edge(coord,edge){ 
//    translate([coord[0]*1.5*long_diameter,f_y_offsetc(coord[0],coord[1])*short_diameter]) 
//        rotate([0,0,60*edge])
//            translate([-long_diameter/2,short_diameter])
//                rotate([0,90])
//                    color("red") 
//                    rotate([0,0,45])
//                        cylinder(h=2.25,d=1,$fn=4);    
//}

function get_corners(x,y) =
        x%2==0?
            [
                [x, y, 0],
                [x+1, y, 1],
                [x-1, y, 0],
                [x, y, 1],
                [x-1, y-1, 0],
                [x+1, y-1, 1]
            ]:            
            [
                [x, y, 0],
                [x+1, y+1, 1],
                [x-1, y+1, 0],
                [x, y, 1],
                [x-1, y, 0],
                [x+1, y, 1]
            ]           
;

module river_corner(x,y,o){        
    translate([x*1.5*long_diameter,f_y_offsetc(x,y)*short_diameter]) 
        rotate([0,0,o*180-60])
            translate([long_diameter/2,short_diameter])
                    cylinder(d=.2,h=.22,$fn=6);
}
 
module river_edge(start,end){ 
    color("#2288ff",.8) 
    hull(){
        river_corner(start[0],start[1],start[2]);
        river_corner(end[0],end[1],end[2]); 
    }
}

module river(corners){
    for (i=[0:len(corners)-2]){
        river_edge(corners[i],corners[i+1]);
    }
}
             
function continent_tile_list(list,count) = count == 0 ? list : continent_tile_list(concat(get_one_more_tile(list)),count-1);

island_reduction = tiles_per_island/4;
function island_tile_list(list,count) = count < 0 ? list : island_tile_list(concat(get_one_more_tile(list)),count-random_int(1,island_reduction));
  
function random_coord(xbottom,ybottom,xtop,ytop)=[floor(rands(xbottom,xtop,1)[0]),floor(rands(ybottom,ytop,1)[0])];

function continent_seed(x,y,stray) = [x+floor(rands(-stray,stray,1)[0]),y+floor(rands(-stray,stray,1)[0])];
 
function random_int(bottom,top) = floor(rands(bottom,top+1,1)[0]);
 

function get_one_neighboring_tile(coord) = [
        coord[0]+floor(rands(-1,2,1)[0]),
        coord[1]+floor(rands(-1,2,1)[0])
];
    
function is_in (coord,list) = len(search(coord, list)) > 0 ? true:false;


function is_in_vector(c,v) = len(search(1,[ for (el = v)  c==el?1:0 ]))>0;
  
function expand_coastal_waters(list) = [for(i=[0:floor(len(coastal_waters*extra_coastal_waters_factor))+1])
                        get_one_neighboring_tile(
                                            list[random_int(0, len(list)-1)]
                                        )
                        ];

coastal_waters_color = "#3333ff";
jungle_color = "#449944";
snow_color = "#FFFFFF";
forest_color = "#44ff44";
tundra_color = "#cccccc";
hills_color = "#cc9999";
desert_color = "yellow";
grassland_color = "#aaffaa";
plains_color = "#bbaa88";
deepsea_color = "blue";
mountain_color = "#555555";

function get_terrain(coord) = 
    is_in_vector(coord,continent_seeds)?"red":
        is_in_vector(coord,snow_tiles) ?"#FFFFFF":
            is_in_vector(coord,pole_tiles) ?"#FFFFFF":
                is_in_vector(coord,effective_mountain_tiles)?mountain_color:
                    is_in_vector(coord,jungle_tiles) ?jungle_color:
                        is_in_vector(coord,forest_tiles) ?forest_color: 
                                is_in_vector(coord,tundra_tiles) ?tundra_color:
                                    is_in_vector(coord,hill_tiles)?hills_color:
                                        is_in_vector(coord,desert_tiles)?desert_color:
                                            is_in_vector(coord,grassland_tiles)?grassland_color:
                                                is_in_vector(coord,landmass_tiles) ?plains_color: 
                                                    is_in_vector(coord,total_coastal_waters)?coastal_waters_color:
                                                        deepsea_color; 

function get_resource(coord,color_) = 
    rand100()>resource_percentage? "":
        color_==coastal_waters_color? get_coastal_waters_resource():
            !is_in_vector(coord,landmass_tiles)? "":
                is_in_vector(coord,effective_mountain_tiles)? "":
                    color_==jungle_color? get_jungle_resource():
                        color_==desert_color? get_desert_resource():
                            color_==plains_color? get_plains_resource():
                                color_==grassland_color? get_grassland_resource():
                                    color_==tundra_color? get_tundra_resource():
                                        color_==hills_color? get_hills_resource():
                                            color_==forest_color? get_forest_resource():
                                                color_==snow_color? get_snow_resource():
                    "R";
                    



function get_elevation(coord) = 
    is_in_vector(coord,effective_mountain_tiles) ? 1: 
        is_in_vector(coord,hill_tiles) ? .4:
            is_in_vector(coord,landmass_tiles) ? .03:
                .01;
                
resource_percentage = 12;      

function rand100() = rands(0,100,1)[0];

function get_coastal_waters_resource() = rand100()<70?"f":
                                            rand100()<70?"W":
                                                rand100()<70?"C":
                                                    "P";
                                                
                                                
function get_jungle_resource() = rand100()<80?"b":
                                    rand100()<50?"S":
                                        "C";
                                                
                                                
function get_desert_resource() = rand100()<33?"w":
                                    rand100()<33?"s":
                                        "G";
                                                
function get_plains_resource() = rand100()<25?"w":
                                        rand100()<33?"c":
                                            rand100()<50?"b": 
                                                rand100()<66?"s":
                                                   rand100()<50? "G": 
                                                        "I";
                                                
function get_grassland_resource() = rand100()<33?"c":
                                        rand100()<50?"b":
                                            "s";
                                                
                                                
function get_hills_resource() = rand100()<80?"s":
                                                "G";
                                                
                                                
function get_forest_resource() = rand100()<80?"d":
                                                rand100()<50?"Z": //seide
                                                "S";
                                                
function get_snow_resource() = rand100()<100?"s":
                                                "R";
                                                
function get_tundra_resource() = rand100()<50?"d":
                                    rand100()<66?"s":
                                        "G"; 
                                                
                                                
    
                

stray=floor(number_of_continents*1.4);
effective_x_range = xrange  ;
effective_y_range = yrange  ;


x_slice_range = 2*floor(effective_x_range/(number_of_continents+1));
y_slice_range = floor(effective_y_range/3);
//echo(xrange,yrange,x_slice_range,y_slice_range);

number_of_x_slices = number_of_continents/2;

continent_seeds = [
 for (longitude_index=[1:number_of_x_slices])
    for (latitude_index=[1:2])
         continent_seed(x_slice_range * longitude_index,
                        y_slice_range * latitude_index,
                        stray)
];

island_seeds = [for (i=[1:number_of_islands]) random_coord(0,0,xrange,yrange)];
single_mountain_seeds = [for (i=[1:number_of_smaller_mountains]) random_coord(0,0,xrange,yrange)];
vegetation_seeds = [for (i=[1:number_of_vegetation_ranges]) random_coord(0,0,xrange,yrange)]; 

  

continent_tiles = [for (i=[0:len(continent_seeds)-1]) continent_tile_list([continent_seeds[i]],tiles_per_continent)];    
pole_tiles = [for (x=[0:xrange]) for (y=[0,1,yrange-1,yrange]) [x,y]];
island_tiles = [for (i=[0:number_of_islands-1]) for (coord=island_tile_list([island_seeds[i]],tiles_per_island)) coord];   
smaller_mountain_tiles = [for (i=[0:number_of_smaller_mountains-1]) for (coord=island_tile_list([single_mountain_seeds[i]],tiles_per_mountain)) coord];  
vegetation_tiles= [for (i=[0:number_of_vegetation_ranges-1]) for (coord=island_tile_list([vegetation_seeds[i]],tiles_per_vegetation_range)) coord];  
   
landmass_tiles = concat(island_tiles,[for (continent=continent_tiles) for (coord=continent) coord]); 
coastal_waters = [for(coord=landmass_tiles) for (neighbor_tile=all_surrounding_tiles(coord)) is_in_vector(neighbor_tile,landmass_tiles)?[-1,-1]:neighbor_tile]; 
 
extra_coastal_waters_factor = .01; 
extra_coastal_waters = expand_coastal_waters(coastal_waters);
extra_coastal_waters2 = expand_coastal_waters(extra_coastal_waters); 
total_base_coastal_waters = concat(coastal_waters,extra_coastal_waters,extra_coastal_waters2);

deep_water_intrusion_factor = 2;
 
total_coastal_waters = [for(coord=total_base_coastal_waters) if(random_int(0,deep_water_intrusion_factor) != deep_water_intrusion_factor) coord]; 
     
landmass_pole_tiles = concat(landmass_tiles,pole_tiles);
effective_mountain_tiles = [for(coord=landmass_pole_tiles) if(is_in_vector(coord,smaller_mountain_tiles)) coord];  
hill_tiles =  [for(coord=landmass_pole_tiles) (is_in_vector(coord,effective_mountain_tiles) || (rand100() > hill_percentage))? [-1,-1]:coord];  
     
effective_vegetation_tiles = [for(coord=landmass_tiles) if(is_in_vector(coord,vegetation_tiles) && (!is_in_vector(effective_mountain_tiles))) coord];   
jungle_tiles =   [for(coord=effective_vegetation_tiles) if(coord[1]>yrange/2-yrange/10 && coord[1]<yrange/2+yrange/10 && (rand100() < jungle_percentage)) coord];     
forest_tiles =   [for(coord=effective_vegetation_tiles) if(!is_in_vector(jungle_tiles)) coord];     
    
equator = yrange/2;
function desert_percentage(latitude) = (100-log((latitude-equator)*(latitude-equator)+1))/3;
 

desert_tiles =   [for(coord=landmass_tiles) if(coord[1]>yrange/2-yrange/10 && coord[1]<yrange/2+yrange/10 && (rand100() < desert_percentage(coord[1]))) coord];   
snow_tiles =   [for(coord=landmass_tiles) if((coord[1]<3 || coord[1]>yrange-3) && (rand100() < snow_percentage)) coord];   
tundra_tiles =   [for(coord=landmass_tiles) if((coord[1]<6 || coord[1]>yrange-6) && (rand100() < snow_percentage)) coord];   
    

grassland_tiles =   [for(coord=landmass_tiles) if(rand100() < grassland_percentage) coord];     
//plains_tiles =   [for(coord=landmass_tiles) if(!is_in_vector(grassland_tiles)) coord];     
 
water_corners = [for (coord=total_base_coastal_waters) get_corners(coord[0],coord[1])];
    
function  pick_one(list) = list[floor(rands(0,len(list),1)[0])];

function next_corner(x,y,o,exclude=[-1,-1,0]) = 
    // get the three corner, discard the one you are coming from, pick one randomly
    [for (c=get_corners(x,y)) if (c!=exclude) c][rand100()%2];

echo(effective_mountain_tiles);
river_seeds = [for (i=[0:number_of_rivers]) pick_one(effective_mountain_tiles)];
echo(river_seeds);

function generate_river(coord) = generate_river_segment([coord[0],coord[1],0], [], old=[-1,-1,0]);

function generate_river_segment(corner, list, old=[-1,-1,0]) = 
    len(list)>10? list:
//        is_in_vector(corner,water_corners)? list: 
            generate_river_segment(next_corner(corner[0],corner[1],corner[2],exclude=old),concat(list,[corner]),old=corner);

test_river_corners = generate_river(river_seeds[0]);

echo(test_river_corners);

river(test_river_corners);

color_matrix=[ for (x = [ 0 : xrange ]) [ for (y = [ 0 : yrange ])  get_terrain([x,y])  ] ];
    
height_matrix=[ for (x = [ 0 : xrange ]) [ for (y = [ 0 : yrange ])  get_elevation([x,y])  ] ];
   
for (i=[0:xrange]){
    for (j=[0:yrange]){
        height = height_matrix[i][j];
        color_ = color_matrix[i][j];
        resource = get_resource([i,j],color_);
        hex(i,j,elevation=height,resource=resource,color_=color_);
    }
}


 
//river([[11,11,0],[12,12,1],[11,12,0],[13,12,1],[12,13,0],[13,13,1],[11,13,0]]);


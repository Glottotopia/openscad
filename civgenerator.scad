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

size = 2;
mapspecs = mapsizes[size];
xrange = mapspecs[0];
yrange = mapspecs[1];
number_of_continents = mapspecs[2];
number_of_islands = mapspecs[3];

surface_=(xrange+1)*(yrange+1);
percent_landmass = .25;
land_tiles = surface_*percent_landmass;


//number_of_mountain_ranges = number_of_continents; 

number_of_smaller_mountains = floor(number_of_islands/percent_landmass);
number_of_vegetation_ranges= floor(number_of_islands/percent_landmass);

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

module hex(x,y,elevation=.1){
    x_offset=x*1.5*long_diameter;  
    y_offset_coefficient = f_y_offsetc(x,y); 
    y_offset = y_offset_coefficient*short_diameter; 
//    color(color,.5)
    translate([x_offset,y_offset])
        {
        cylinder($fn=6,d1=long_diameter*1.95,d2=long_diameter/2,h=elevation);
//            scale([.1,.1]){                
//            translate([-6,3])
//            text(str(x));
//            translate([-6,-10])
//            text(str(y));
//            }
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
hill_tiles =  [for(coord=landmass_pole_tiles) (is_in_vector(coord,effective_mountain_tiles) || (rands(0,100,1)[0] > hill_percentage))? [-1,-1]:coord];  
     
effective_vegetation_tiles = [for(coord=landmass_tiles) if(is_in_vector(coord,vegetation_tiles) && (!is_in_vector(effective_mountain_tiles))) coord];   
jungle_tiles =   [for(coord=effective_vegetation_tiles) if(coord[1]>yrange/2-yrange/10 && coord[1]<yrange/2+yrange/10 && (rands(0,100,1)[0] < jungle_percentage)) coord];     
forest_tiles =   [for(coord=effective_vegetation_tiles) if(!is_in_vector(jungle_tiles)) coord];     
    
equator = yrange/2;
function desert_percentage(latitude) = (100-log((latitude-equator)*(latitude-equator)+1))/3;
 

desert_tiles =   [for(coord=landmass_tiles) if(coord[1]>yrange/2-yrange/10 && coord[1]<yrange/2+yrange/10 && (rands(0,100,1)[0] < desert_percentage(coord[1]))) coord];   
snow_tiles =   [for(coord=landmass_tiles) if((coord[1]<3 || coord[1]>yrange-3) && (rands(0,100,1)[0] < snow_percentage)) coord];   
tundra_tiles =   [for(coord=landmass_tiles) if((coord[1]<6 || coord[1]>yrange-6) && (rands(0,100,1)[0] < snow_percentage)) coord];   
    

grassland_tiles =   [for(coord=landmass_tiles) if(rands(0,100,1)[0] < grassland_percentage) coord];     
//plains_tiles =   [for(coord=landmass_tiles) if(!is_in_vector(grassland_tiles)) coord];     
echo(grassland_tiles);
    
echo(snow_tiles);
//echo(hill_tiles);
function get_terrain(coord) = 
    is_in_vector(coord,continent_seeds)?"red":
        is_in_vector(coord,snow_tiles) ?"#FFFFFF":
            is_in_vector(coord,pole_tiles) ?"#FFFFFF":
                is_in_vector(coord,effective_mountain_tiles)?"#555555":
                    is_in_vector(coord,jungle_tiles) ?"#449944":
                        is_in_vector(coord,forest_tiles) ?"#44ff44":
                            is_in_vector(coord,snow_tiles) ?"#FFFFFF":
                                is_in_vector(coord,tundra_tiles) ?"#cccccc":
                                    is_in_vector(coord,hill_tiles)?"#cc9999":
                                        is_in_vector(coord,desert_tiles)?"yellow":
                                            is_in_vector(coord,grassland_tiles)?"#aaffaa":
                                                is_in_vector(coord,landmass_tiles) ?"#bbaa88":
//            is_in_vector(coord,continent_tiles[2])?"black":
//                is_in_vector(coord,continent_tiles[3])?"black":
//                    is_in_vector(coord,island_tiles)?"black":
                        is_in_vector(coord,total_coastal_waters)?"#3333ff":
                            "blue"; 


function get_elevation(coord) = 
    is_in_vector(coord,effective_mountain_tiles) ? 1: 
        is_in_vector(coord,hill_tiles) ? .4:
            is_in_vector(coord,landmass_tiles) ? .03:
                .01;
    

color_matrix=[ for (x = [ 0 : xrange ]) [ for (y = [ 0 : yrange ])  get_terrain([x,y])  ] ];
    
height_matrix=[ for (x = [ 0 : xrange ]) [ for (y = [ 0 : yrange ])  get_elevation([x,y])  ] ];
   
for (i=[0:xrange]){
    for (j=[0:yrange]){
        height = height_matrix[i][j];
        color(color_matrix[i][j],.5) 
                hex(i,j,elevation=height);
    }
}

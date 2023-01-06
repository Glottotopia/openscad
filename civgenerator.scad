radius=1; 
long_diameter=2; 
short_diameter=2*sin(60)*radius;

//Duel:      40 x 25  (2 players, 4 city-states, 2 natural wonders)
//Tiny:      56 x 36  (4 players, 8 city-states, 3 natural wonders)
//Small:     66 x 42  (6 players, 12 city-states, 3 natural wonders)
//Standard:  80 x 52  (8 players, 16 city-states, 4 natural wonders)
//Large:    104 x 64  (10 players, 20 city-states, 6 natural wonders)
//Huge:     128 x 80  (12 players, 24 city-states, 7 natural wonders)

xrange=80;
yrange=52;


number_of_continents=4;


number_of_islands=10;

surface_=(xrange+1)*(yrange+1);
percent_landmass = .25;
land_tiles = surface_*percent_landmass;
tiles_per_continent = floor(land_tiles/number_of_continents)-1;
tiles_per_island = 20;
echo(tiles_per_continent);

module hex(x,y,color="blue"){
    x_offset=x*1.5*long_diameter;  
    y_offset_coefficient = f_y_offsetc(x,y); 
    y_offset = y_offset_coefficient*short_diameter; 
    color(color,.5)
    translate([x_offset,y_offset])
        {
        circle($fn=6,long_diameter);
            scale([.1,.1]){                
            translate([-6,3])
            text(str(x));
            translate([-6,-10])
            text(str(y));
            }
        }
}

function f_y_offsetc(x,y)=x%2==0?(y*2-x)+x:(y*2-x)+x+1;

//10 10 -- +-
//9 9 -+ ++
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
 
function random_int(bottom,top) = floor(rands(bottom,top+1,1)[0]);
 

function get_one_neighboring_tile(coord) = [
        coord[0]+floor(rands(-1,2,1)[0]),
        coord[1]+floor(rands(-1,2,1)[0])
];
    
function is_in (coord,list) = len(search(coord, list)) > 0 ? true:false;


function is_in_vector(c,v) = len(search(1,[ for (el = v)  c==el?1:0 ]))>0;
 
continent_seeds = [
random_coord(xrange*.1,yrange*.1,xrange*.4,yrange*.4),
random_coord(xrange*.6,yrange*.1,xrange*.9,yrange*.4),
random_coord(xrange*.1,yrange*.6,xrange*.4,yrange*.9),
random_coord(xrange*.6,yrange*.6,xrange*.9,yrange*.9)
];

island_seeds = [for (i=[1:number_of_islands]) random_coord(0,0,xrange,yrange)];

  

continent_tiles = [for (i=[0:number_of_continents-1]) continent_tile_list([continent_seeds[i]],tiles_per_continent)];    
   

island_tiles = [for (i=[0:number_of_islands-1]) for (coord=island_tile_list([island_seeds[i]],tiles_per_island)) coord];  
     
 
   
landmass_tiles = concat(island_tiles,[for (continent=continent_tiles) for (coord=continent) coord]); 
coastal_waters = [for(coord=landmass_tiles) for (neighbor_tile=all_surrounding_tiles(coord)) is_in_vector(neighbor_tile,landmass_tiles)?[-1,-1]:neighbor_tile]; 

//coastal_waters = [[8,18],[6,8],[7,8],[8,7],[6,8],[8,5],[8,10],[9,8],[7,7],[6,4]];
extra_coastal_waters_factor = .01;
//extra_coastal_waters_length = floor(len(coastal_waters*extra_coastal_waters_factor)); 

function expand_coastal_waters(list) = [for(i=[0:floor(len(coastal_waters*extra_coastal_waters_factor))+1])
                        get_one_neighboring_tile(
                                            list[random_int(0, len(list)-1)]
                                        )
                        ];

//echo(coastal_waters);
extra_coastal_waters = expand_coastal_waters(coastal_waters);
extra_coastal_waters2 = expand_coastal_waters(extra_coastal_waters);
//extra_coastal_waters3 = expand_coastal_waters(extra_coastal_waters2);



total_base_coastal_waters = concat(coastal_waters,extra_coastal_waters,extra_coastal_waters2);


//total_base_coastal_waters = coastal_waters;

deep_water_intrusion_factor = 2;

//echo(total_base_coastal_waters);
total_coastal_waters = [for(coord=total_base_coastal_waters) if(random_int(0,deep_water_intrusion_factor) != deep_water_intrusion_factor) coord];
//total_coastal_waters = coastal_waters;
 
//echo(total_coastal_waters);
 
function get_terrain(coord) = 
    is_in_vector(coord,continent_tiles[0])?"red":
        is_in_vector(coord,continent_tiles[1])?"green":
            is_in_vector(coord,continent_tiles[2])?"orange":
                is_in_vector(coord,continent_tiles[3])?"yellow":
                    is_in_vector(coord,island_tiles)?"#cccccc":
                        is_in_vector(coord,total_coastal_waters)?"#6666ff":
                            "blue"; 
    

color_matrix=[ for (x = [ 0 : xrange ]) [ for (y = [ 0 : yrange ])  get_terrain([x,y])  ] ];
     

for (i=[0:xrange]){
    for (j=[0:yrange]){
        hex(i,j,color_matrix[i][j]);
    }
}

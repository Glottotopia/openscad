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


number_of_islands=20;

surface_=(xrange+1)*(yrange+1);
percent_landmass = .25;
land_tiles = surface_*percent_landmass;
tiles_per_continent = floor(land_tiles/number_of_continents)-1;
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
            translate([-9,-4])
            text(str(x));
            translate([0,-4])
            text(str(y));
            }
        }
}

function f_y_offsetc(x,y)=x%2==0?(y*2-x)+x:(y*2-x)+x+1;
 
function get_one_more_tile(list) = 
    concat(list, [get_one_neighboring_tile(
        list[
            floor(rands(max(0,len(list)-6),len(list),1)[0])
//            floor(rands(0,len(list),1)[0])
            ])]
        );
             
function continent_tile_list(list,count) = count == 0 ? list : continent_tile_list(concat(get_one_more_tile(list)),count-1);
   
function random_coord(xbottom,ybottom,xtop,ytop)=[floor(rands(xbottom,xtop,1)[0]),floor(rands(ybottom,ytop,1)[0])];
 


function get_one_neighboring_tile(coord) = [
        coord[0]+floor(rands(-1,2,1)[0]),
        coord[1]+floor(rands(-1,2,1)[0])
];
    
function is_in (coord,list) = len(search(coord, list)) > 0 ? true:false;


function is_in_vector(c,v) = len(search(1,[ for (el = v)  c==el?1:0 ]))>0;

//continent_1_seed = random_coord(xrange/4,yrange/4,xrange/4,yrange/4);
//continent_2_seed = random_coord(xrange/4,yrange,xrange/4,4);
//continent_3_seed = random_coord(xrange,yrange/4,4,yrange/4);
//continent_4_seed = random_coord(xrange,yrange,4,4);

continent_seeds = [
random_coord(xrange*.1,yrange*.1,xrange*.4,yrange*.4),
random_coord(xrange*.6,yrange*.1,xrange*.9,yrange*.4),
random_coord(xrange*.1,yrange*.6,xrange*.4,yrange*.9),
random_coord(xrange*.6,yrange*.6,xrange*.9,yrange*.9)
];
 

//echo(continent_1_seed);
//echo(continent_2_seed);
  
//continent_1_tiles = continent_tile_list([continent_seeds[0]],tiles_per_continent);
//continent_2_tiles = continent_tile_list([continent_seeds[1]],tiles_per_continent);  
//continent_3_tiles = continent_tile_list([continent_seeds[2]],tiles_per_continent);  
//continent_4_tiles = continent_tile_list([continent_seeds[3]],tiles_per_continent);  

//continent_tiles = [continent_1_tiles,continent_2_tiles,continent_3_tiles,continent_4_tiles];

continent_tiles = [for (i=[0:number_of_continents-1]) continent_tile_list([continent_seeds[i]],tiles_per_continent)];     


//c1matrix = [ for (x = [ 0 : xrange ]) [ for (y = [ 0 : yrange ])  is_in_vector([x,y],continent_1_tiles)  ] ];
  

function get_terrain(coord) = 
    is_in_vector(coord,continent_tiles[0])?"red":
        is_in_vector(coord,continent_tiles[1])?"green":
            is_in_vector(coord,continent_tiles[2])?"orange":
                is_in_vector(coord,continent_tiles[3])?"yellow":
                    "blue"; 
    

color_matrix=[ for (x = [ 0 : xrange ]) [ for (y = [ 0 : yrange ])  get_terrain([x,y])  ] ];
     

for (i=[0:xrange]){
    for (j=[0:yrange]){
        hex(i,j,color_matrix[i][j]);
    }
}
radius=1; 
long_diameter=2; 
short_diameter=2*sin(60)*radius;

//Duel:      40 x 25  (2 players, 4 city-states, 2 natural wonders)
//Tiny:      56 x 36  (4 players, 8 city-states, 3 natural wonders)
//Small:     66 x 42  (6 players, 12 city-states, 3 natural wonders)
//Standard:  80 x 52  (8 players, 16 city-states, 4 natural wonders)
//Large:    104 x 64  (10 players, 20 city-states, 6 natural wonders)
//Huge:     128 x 80  (12 players, 24 city-states, 7 natural wonders)

xrange=40;
yrange=25;

//xrange=6;
//yrange=6;
number_of_continents=2;
surface_=(xrange+1)*(yrange+1);
percent_landmass = .1;
land_tiles = surface_*percent_landmass;
tiles_per_continent = floor(land_tiles/number_of_continents)-1;
echo(tiles_per_continent);

function f_y_offsetc(x,y)=x%2==0?(y*2-x)+x:(y*2-x)+x+1;

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

function random_coord(xrange,yrange,xoffset=0,yoffset=0)=[floor(rands(0,xrange,1)[0]+xoffset),floor(rands(0,yrange,1)[0]+yoffset)];

//function expand_continents(seed,extra_tiles) = [ for (x = [ 0 : extra_tiles ]) [ for (y = [ 0 : yrange ])  get_terrain([x,y])  ] ];

//function one_to_six = floor(rands(0,6,1)[0]);

function get_one_neighboring_tile(coord) = [coord[0]+floor(rands(-1,2,1)[0]),coord[1]+floor(rands(-1,2,1)[0])];
    
function is_in (coord,list) = len(search(coord, list)) > 0 ? true:false;

continent_1_seed = random_coord(xrange/4,yrange);
continent_2_seed = random_coord(xrange/4,yrange,xrange/2);
 

//echo(continent_1_seed);
//echo(continent_2_seed);

continent_1_tiles = [for (counter=[0:tiles_per_continent]) get_one_neighboring_tile(continent_1_seed)];
continent_2_tiles = [for (counter=[0:tiles_per_continent]) get_one_neighboring_tile(continent_2_seed)];
echo(continent_1_tiles);

function is_in_vector(c,v) = len(search(1,[ for (el = v)  c==el?1:0 ]))>0;

c1matrix = [ for (x = [ 0 : xrange ]) [ for (y = [ 0 : yrange ])  is_in_vector([x,y],continent_1_tiles)  ] ];

//continent_1_strings = str(continent_1_tiles);
//echo(continent_1_strings);
 
 

 

function get_terrain(coord) = 
    is_in_vector(coord,continent_1_tiles)?"red":
        is_in_vector(coord,continent_2_tiles)?"green":"blue"; 
    

color_matrix=[ for (x = [ 0 : xrange ]) [ for (y = [ 0 : yrange ])  get_terrain([x,y])  ] ];
    
//echo(color_matrix);


for (i=[0:xrange]){
    for (j=[0:yrange]){
        hex(i,j,color_matrix[i][j]);
    }
}
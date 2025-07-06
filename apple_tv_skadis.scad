include <BOSL2/std.scad>
include <ikea_skadis_pegs.scad>

// apple tv dimensions

width=93.5;
height=93.5;
depth=31;
corner=20;

ports_height=21;
ports_width=74;
ports_corner=4;

opening_sides = 15;
opening_width = width-opening_sides*2;
opening_height = height-opening_sides*2;
opening_corner = corner - opening_sides;

// wall size for the container and relative outside dimensions

wall=3;
out_width=width+wall*2;
out_height=height+wall*2;
out_depth=depth+wall*2;


// apple tv container

diff("remove")

cuboid([out_width,out_depth,out_height], rounding=corner, edges = "Y")
    tag("remove") {
        // emtpy apple tv
        position(CENTER) cuboid([width,depth,height], rounding=corner, edges = "Y", anchor=CENTER);
        // empty front opening
        back(wall+0.1) position(FRONT) cuboid([opening_width,wall+0.1,opening_height], rounding=opening_corner, edges = "Y", anchor=BACK);
        // empty top opening
        position(TOP) down(corner+wall) cube([out_width, out_depth, corner+wall], anchor=BOTTOM);
        // we make the whole twice as tall to make sure it cuts also where the enclosure bends
        position(BOTTOM) up(wall*2) cuboid([ports_width,ports_height,wall*2+0.1], rounding=ports_corner, edges = "Z", anchor=TOP);
    };

// skadis pegs
back(out_depth/2+skadis_support_d/2) skadis_peg_panel();
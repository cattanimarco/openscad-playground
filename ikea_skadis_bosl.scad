include <BOSL2/std.scad>

// skadis dimensions
skadis_h_space = 40;
skadis_v_space = 20;
skadis_row_offset = 20;

skadis_hole_w = 5;
skadis_hole_h = 15;
skadis_hole_radius = 2.5;
skadis_hole_fillet = 1;

skadis_panel_thickness = 5;

skadis_support_w = 3.6;
skadis_support_h = 10;
skadis_support_d = 6;
skadis_support_radius = skadis_support_w/2;

skadis_peg_w = 3.6;
skadis_peg_radius = skadis_peg_w/2;

skadis_peg1_h = 8;
skadis_peg1_d = 5.1;

skadis_peg2_h = 14;
skadis_peg2_d = 5.1;
skadis_peg2_radius = skadis_peg_w/2;

skadis_peg_offset = skadis_peg2_h - skadis_peg1_h;

skadis_peg1_support_offset = skadis_support_d - skadis_peg1_d;

module skadis_peg_panel(panel_size=[90,40])
{
    // central support
//cuboid(skadis_support_w,skadis_support_d,skadis_support_h], rounding=skadis_support_radius, edges = "Y");
//    total_h = skadis_h_space*(h_pegs-1)+skadis_peg_w;
    
    // duplicate peg over x axis
//    xcopies(skadis_h_space, n=h_pegs)
    grid_copies(spacing=[skadis_h_space,skadis_v_space], size=panel_size, stagger=true, axes="xz") 
        // single peg
        union() {
            cuboid([skadis_peg_w,skadis_peg1_d,skadis_peg1_h], rounding=skadis_peg_radius, edges = "Y")
                position(BACK+TOP) cuboid([skadis_peg_w,skadis_peg2_d,skadis_peg2_h], rounding=skadis_peg_radius, edges = [FRONT+BOTTOM, "Y"], anchor= FRONT+TOP);
        }

//    up(skadis_v_space) right(skadis_row_offset) fwd(skadis_peg1_support_offset/2) cuboid([skadis_peg1_w,skadis_peg1_d,skadis_peg1_h], rounding=skadis_peg1_radius, edges = "Y");
    
//    up(skadis_v_space-skadis_peg_offset/2) right(skadis_row_offset) back(skadis_peg1_d-skadis_peg1_support_offset/2) cuboid([skadis_peg2_w,skadis_peg2_d,skadis_peg2_h], rounding=skadis_peg2_radius, edges = [FRONT+BOTTOM, "Y"]);
    
//    
    // bottom supports
//    down(skadis_v_space) left(skadis_row_offset) cuboid([skadis_support_w,skadis_support_d, skadis_support_h], rounding=skadis_support_radius, edges = "Y");

//    down(skadis_v_space) right(skadis_row_offset) cuboid([skadis_support_w,skadis_support_d, skadis_support_h], rounding=skadis_support_radius, edges = "Y");
}

module skadis_pegs(panel_size=[90,40], anchor=CENTER, spin=0, orient=UP) {
    attachable(anchor,spin,orient, size=[panel_size[0],skadis_peg1_d+skadis_peg2_d,panel_size[1]]) {
        skadis_peg_panel(panel_size);
        children();
    }
}

module cubic_barbell(s=100, anchor=CENTER, spin=0, orient=UP) {
    attachable(anchor,spin,orient, size=[s*3,s,s]) {
        union() {
            xcopies(2*s) cube(s, center=true);
            xcyl(h=2*s, d=s/4);
        }
        children();
    }
}

skadis_pegs();// show_anchors(60);

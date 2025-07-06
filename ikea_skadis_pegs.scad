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

skadis_peg1_w = 3.6;
skadis_peg1_h = 8;
skadis_peg1_d = 5.1;
skadis_peg1_radius = skadis_peg1_w/2;

skadis_peg2_w = 3.6;
skadis_peg2_h = 14;
skadis_peg2_d = 5.1;
skadis_peg2_radius = skadis_peg2_w/2;

skadis_peg_offset = skadis_peg2_h - skadis_peg1_h;

skadis_peg1_support_offset = skadis_support_d - skadis_peg1_d;

module skadis_peg_panel()
{
    // central support
cuboid([skadis_support_w,skadis_support_d,skadis_support_h], rounding=skadis_support_radius, edges = "Y");

    // top pegs
up(skadis_v_space) left(skadis_row_offset) fwd(skadis_peg1_support_offset/2) cuboid([skadis_peg1_w,skadis_peg1_d,skadis_peg1_h], rounding=skadis_peg1_radius, edges = "Y");
    
    up(skadis_v_space-skadis_peg_offset/2) left(skadis_row_offset) back(skadis_peg1_d-skadis_peg1_support_offset/2) cuboid([skadis_peg2_w,skadis_peg2_d,skadis_peg2_h], rounding=skadis_peg2_radius, edges = [FRONT+BOTTOM, "Y"]);

    up(skadis_v_space) right(skadis_row_offset) fwd(skadis_peg1_support_offset/2) cuboid([skadis_peg1_w,skadis_peg1_d,skadis_peg1_h], rounding=skadis_peg1_radius, edges = "Y");
    
    up(skadis_v_space-skadis_peg_offset/2) right(skadis_row_offset) back(skadis_peg1_d-skadis_peg1_support_offset/2) cuboid([skadis_peg2_w,skadis_peg2_d,skadis_peg2_h], rounding=skadis_peg2_radius, edges = [FRONT+BOTTOM, "Y"]);
    
//    
    // bottom supports
    down(skadis_v_space) left(skadis_row_offset) cuboid([skadis_support_w,skadis_support_d, skadis_support_h], rounding=skadis_support_radius, edges = "Y");

    down(skadis_v_space) right(skadis_row_offset) cuboid([skadis_support_w,skadis_support_d, skadis_support_h], rounding=skadis_support_radius, edges = "Y");
}
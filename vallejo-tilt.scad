// preview[view:south, tilt:top]

// Number of holders in the X direction
holders_x = 3; // [1:100]
// Number of holders in the Y direction
holders_y = 1; // [1:100]

module paintmock(d=25, h=50, neck_d=20, neck_h=28) {
    cylinder(d=d, h=h, $fn=60);
    translate([0,0,neck_h]) cylinder(d=neck_d, h=50, $fn=60);
}

module rack(x, y = 1) { 
    for (j = [1:y])
    for (i = [1:x])
    translate([30*i,sin(70)*85*j,0])
    difference() {
        translate([-15,0,0])
        {
            cube([30, 15, 15]);
            cube([30, sin(70)*85, 3]);
            translate([0,sin(70)*63, 0])
                cube([30, 5, 35]);
        }
        translate([0,5,16])
            rotate([-70,0,0]) {
                paintmock();
            }
    }
}


rack(holders_x, holders_y);

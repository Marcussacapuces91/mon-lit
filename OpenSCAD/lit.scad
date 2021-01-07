
// Matelas
module full(ep = 20) {  // 120 x 190 cm
    translate([0,0,ep/2]) color("#DFF") cube([190,120,ep], center=true);
}

module standard(ep = 20) {  // 140 x 190 cm
    sp = 15;
    color("#dff") hull() for (x=[-190/2+sp/2,190/2-sp/2], y=[-140/2+sp/2,140/2-sp/2], z=[-ep/2+sp/2,ep/2-sp/2]) {
        translate([x,y,z+ep/2]) sphere(d=sp, $fn=40);
    }
}

module queen(ep = 20) {  // 160 x 200 cm
    translate([0,0,ep/2]) color("#DFF") cube([200,160,ep], center=true);
}

module king(ep = 20) {  // 180 x 200 cm
    translate([0,0,ep/2]) color("#DFF") cube([200,180,ep], center=true);
}

module kingXL(ep = 20) {  // 200 x 200 cm
    translate([0,0,ep/2]) color("#DFF") cube([200,200,ep], center=true);
}

module console(l = 40) {
    difference() {
        cube([40,l,30], center=true);
        for (a=[-1,1]) translate([0,0,a*7.0]) cube([45,l-2,30/2-1.5], center=true);
    }
}


// Matelas
standard();

lar = 140;
lon = 190;

// Sommier
color("#9405") translate([0,0,-2.5]) cube([lon,lar,5], center=true);

// Tête
color("#940") for (a=[0:4]) translate([-lon/2-2,0,a*20-13]) cube([2.8,lar+100,20], center=true);

// Pied
color("#940") translate([lon/2+2,0,-2.8]) cube([3,lar+7,20], center=true);

// Cotés
color("#940") for (a=[-lar/2-2,lar/2+2]) {
    translate([0,a,-3]) cube([lon+7, 2.8,20], center=true);
}

// Lattes en long support sommier 4 * 50x30xlon
for (a=[-1,1]) {
   translate([0,a*3/2,-5/2-5]) cube([lon,3,5], center=true);
   translate([0,a*(lar/2-3/2+0.5),-5/2-5]) cube([lon,3,5], center=true);
}

// Planches en large (2* 28x100xlarg+2)
for (x=[-25,50]) {
    translate([x,0,-11.6]) cube([10,lar+2,2.8], center=true);
    
    translate([x,0,-18]) cube([2.8,lar+2,10], center=true);
}

 color("#940") for (a=[-1,1]) translate([-75,a*95,2.5]) console();
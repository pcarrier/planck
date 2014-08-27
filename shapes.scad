// keys
translate([-(6*19)+(5/2), -(2*19)+(5/2)])
for(i = [0:3]) {
  for(j = [0:11]) {
	  if (i == 0 && j == 5) {
         // switch
         color([.2,.2,.2])
	    linear_extrude(11.6)
         translate([19*(j + .5),19*i]) square([14,14]);
         // cap
	    translate([-4.415/2,-4.415/2,-1.8+5+7.5])
	    #linear_extrude(9)
	    translate([19*j,19*i]) square([18.415*2 + .6,18.415]);
      } else if (i == 0 && j == 6) {
      } else {
         // switch
         color([.2,.2,.2])
	    linear_extrude(11.6)
         translate([19*j,19*i]) square([14,14]);
	    // cap
	    translate([-4.415/2,-4.415/2,-1.8+5+7.5])
	    #linear_extrude(9)
	    translate([19*j,19*i]) square([18.415,18.415]);
      }
  }
}

// PCB
color([0,.5,0])
translate([-223/2,-71/2,-1.6])
linear_extrude(1.6)
square([223,71]);

// Top plate
color([.5,.5,.5])
translate([-233/2,-81/2,-1.6+5])
linear_extrude(1.5)
square([233,81]);

// Bottom plate, 16.5mm total height estimate (1.5 + 1.5 + 13.5)
color([.5,.5,.5])
translate([-233/2,-81/2,-1.8+5-15])
linear_extrude(1.5)
square([233,81]);

// Teensy
translate([122.1 + (-233/2), -(81/2) + 17.12 + 17.76, -1.6 - 1.6 - 1.6])
linear_extrude(1.6)
square([30.84, 17.76]);

// Wood sandwich
%difference() {
  translate([-233/2,-81/2,-1.8+5-15+1.5])
  scale([233,81,13.5])
  cube();

  // intentionally too tall
  translate([-225/2,-73/2,-1.8+5-15+1.5-2.5])
  scale([225,73,20])
  cube();
}

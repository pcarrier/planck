translate([-(6*19)+(5/2), -(2*19)+(5/2)])
for(i = [0:3]) {
  for(j = [0:11]) {
	// keyswitch
	linear_extrude(11.6)
    translate([19*j,19*i]) square([14,14]);

	// keycap
    translate([-4.415/2,-4.415/2,-1.8+5+7.5])
    #linear_extrude(9)
    translate([19*j,19*i]) square([18.415,18.415]);
  }
}

// PCB
translate([-225/2,-73/2,-1.8])
linear_extrude(1.8)
square([225,73]);

// Top plate
translate([-233/2,-81/2,-1.8+5])
linear_extrude(1.5)
square([233,81]);

// Bottom plate, 16.5mm total height estimate
translate([-233/2,-81/2,-1.8+5-15])
linear_extrude(1.5)
square([233,81]);

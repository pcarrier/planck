

// keys
module m_switch(w, h) {
  color([.2,.2,.2])
    translate([0, 0, 11.6/2])
      scale([14,14,11.6])
        cube(center=true);
}

module m_cap(w, h, r = 2) {
  color([.9,.9,.9])
      linear_extrude(9,scale=.5/.75) {
        minkowski() {
          scale([w-2*r,h-2*r])
            square(center=true);
          circle(r, $fn=100);
        }
      }
}

module m_key(w, h) {
  // z fn
  translate([0, 0, -1.8+5+7.5])
    m_cap(w, h);
    m_switch(w, h);
}

module m_row(count) {
  for (i = [0:count]) {
    translate([0, 19*i])
      m_key(18.415, 18.415);
  }
}

for (x = [1:5]) {
  translate([19*(-.5-x),19*(-.5-1),0])
    m_row(3);
}
for (x = [2:6]) {
  translate([19*(-.5+x),19*(-.5-1),0])
    m_row(3);
}
translate([19*(-.5),19*(-.5),0])
  m_row(2);
translate([19*(-.5),19*(-.5),0])
  m_row(2);
translate([19*(-.5+1),19*(-.5),0])
  m_row(2);

translate([0,19*(-.5-1)])
  m_key(2*18.415+.6,18.415);

// PCB
color([0,.5,0])
  translate([-223/2,-71/2,-1.6])
    linear_extrude(1.6)
      square([223,71]);

transpplates = [.9,.9,.9,.2];

// Top plate 1
color(transpplates)
  translate([-233/2,-81/2,-1.6+5])
    scale([233,81,1.5])
      cube();

// Top plate 2
color(transpplates)
  translate([-233/2,-81/2,-1.6+2])
    scale([233,81,3])
      cube();

// Bottom plate
color(transpplates)
  translate([-233/2,-81/2,-1.6+.5-6])
    scale([233,81,1.5])
      cube();

// Teensy
translate([122.1 + (-233/2), -(81/2) + 17.12 + 17.76, -1.6 - 1.6 - 1.6])
  linear_extrude(1.6)
    square([30.84, 17.76]);

// Sandwich
color(transpplates)
difference() {
  translate([-233/2,-81/2,.4-6])
    scale([233,81,6])
      cube();

  // intentionally too tall
  translate([-225/2,-73/2,-10])
    scale([225,73,20])
      cube();
}

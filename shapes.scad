// keys
module m_switch(w, h) {
  color([.2,.2,.2,.8])
    translate([0, 0, 11.6/2])
      scale([14,14,11.6])
        cube(center=true);
}

module m_cap(w, h, r = 2) {
  color([.9,.9,.9,.8])
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
color([0,.5,0,.8])
  translate([-223/2,-71/2,-1.6])
    linear_extrude(1.6)
      square([223,71]);

// Top plate
color([.5,.5,.5,.8])
  translate([-233/2,-81/2,-1.6+5])
    linear_extrude(1.5)
      square([233,81]);

// Bottom plate, 15mm total height estimate (1.5 + 1.5 + 12)
color([.5,.5,.5,.8])
  translate([-233/2,-81/2,-1.6+5-13.5])
    linear_extrude(1.5)
      square([233,81]);

// Teensy
translate([122.1 + (-233/2), -(81/2) + 17.12 + 17.76, -1.6 - 1.6 - 1.6])
  linear_extrude(1.6)
    square([30.84, 17.76]);

// Wood sandwich
%difference() {
  translate([-233/2,-81/2,-1.6+5-13.5+1.5])
    scale([233,81,12])
      cube();

  // intentionally too tall
  translate([-225/2,-73/2,-1.6+5-15+1.5-2.5])
    scale([225,73,20])
      cube();
}

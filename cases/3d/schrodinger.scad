c_whiteish = [.9,.9,.9,];
c_darkish = [.2,.2,.2,];
c_fn = [ 0, 0, 1];
c_1x = 18.415;
c_angle = 20;

module m_switch(w, h) {
  color([.2,.2,.2])
    translate([0, 0, 11.6/2])
      scale([14,14,11.6])
        cube(center=true);
}

module m_cap(w, h, c, r = 2) {
  color(c)
      linear_extrude(9,scale=.5/.75) {
        minkowski() {
          scale([w-2*r,h-2*r])
            square(center=true);
          circle(r, $fn=100);
        }
      }
}

module m_key(w, h, c) {
  // z fn
  translate([0, 0, -1.8+5+7.5])
    m_cap(w, h, c);
    m_switch(w, h);
}

module m_row(end, thumb = true) {
  if (thumb)
    translate([0, 0])
      m_key(c_1x, c_1x, c_fn);
  for (i = [1:end]) {
    translate([1, 19*i])
      m_key(c_1x, c_1x, , c_whiteish);
  }
}

module m_hand() {
  translate([19*0,0])
    m_row(3);
  translate([19*1,4.75])
    m_row(3);
  translate([19*2,9])
    m_row(3);
  translate([19*3,9])
    m_row(3);
  translate([19*4,4.75])
    m_row(3, false);
}

module m_positioned_hand() {
  translate([30,-7])
    rotate([0, 0, c_angle])
      m_hand();
}

module m_pcb() {
  color([0,.5,0])
  translate([0,0,-.75])
  union() {
    translate([27.5,-26])
      rotate([0,0,c_angle])
        scale([111,91,1.5])
          cube();
    mirror([1,0,0])
      translate([27.5,-26])
        rotate([0,0,c_angle])
          scale([111,91,1.5])
            cube();
    translate([-55/2,-26.0,0])
    scale([55,60,1.5])
      cube();
  }
}

m_positioned_hand();
mirror([1,0,0])
  m_positioned_hand();
translate([0,-11])
  m_key(2*c_1x, c_1x, c_fn);


module teensy() {
  translate([0, -15, -1.5])
    scale([17.76, 30.84, 1.6])
      square(center = true);
}

translate([0, 30])
  teensy();
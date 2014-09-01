c_whiteish = [.95,.95,.95];
c_darkish = [.2,.2,.2];
c_fn = [0,.4,.8];
c_1x = 18.415;
c_angle = 14;

module m_switch(w, h) {
  color(c_darkish)
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

module m_row(end, fns = 1) {
  for (i = [0:fns - 1]) {
    translate([0, 19*i])
      m_key(c_1x, c_1x, , c_fn);
  }
  for (i = [fns:end]) {
    translate([0, 19*i])
      m_key(c_1x, c_1x, , c_whiteish);
  }
}

module m_hand() {
  translate([19*0,-15])
    m_row(4,3);
  translate([19*1,4.75])
    m_row(3);
  translate([19*2,12])
    m_row(3);
  translate([19*3,9])
    m_row(3);
  translate([19*4,0])
    m_row(3);

  translate([19*1,-60])
    m_key(2*c_1x, c_1x, c_fn);
  translate([19*3,-60])
    m_key(2*c_1x, c_1x, c_fn);
}

module m_positioned_hand() {
  translate([26,-7])
    rotate([0, 0, c_angle])
      m_hand();
}

m_positioned_hand();
mirror([1,0,0])
  m_positioned_hand();

translate([0,-7+19])
  m_key(c_1x, c_1x, c_fn);
translate([0,-7])
  m_key(1.5*c_1x, c_1x, c_fn);
translate([0,-7-19])
  m_key(2*c_1x, c_1x, c_fn);

translate([0, 30])
  teensy();


s.boot

// basic synth example

( f= { |freq=300, amp=0.1| SinOsc.ar(freq, mul:amp) ! 2} )
x = f.play( args:[freq:450]);
// x.free;

// basic HID

HID.findAvailable; // pull everything.

HID.postAvailable; // list it.

~myhid = HID.open(121, 6); // select generic usb joystick.

HID.openDevices; // show open devices.

~myhid.elements[6].action = { x.set(\amp, 0.1) }; // button one raises amp.

~myhid.elements[7].action = { x.set(\amp, 0) }; // button two kills it.
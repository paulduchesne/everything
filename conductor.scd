(
o = ServerOptions.new;
o.protocol_(\tcp);
t = Server.remote(\voice2, NetAddr("192.168.1.108", 57110), o); // set to correct address and port
t.addr.connect;
t.startAliveThread( 0 );
t.doWhenBooted({ "remote tcp server started".postln; t.notify; t.initTree

	// other stuff happens here?

});
)

// basic synth example

( f= { |freq=300, amp=0.1| SinOsc.ar(freq, mul:amp) ! 2} )
x = f.play(t, args:[freq:450]);
// x.free;

// basic HID

HID.findAvailable; // pull everything.

HID.postAvailable; // list it.

~myhid = HID.open(121, 6); // select generic usb joystick.

HID.openDevices; // show open devices.

~myhid.elements[6].action = { x.set(\amp, 0.1) }; // button one raises amp.

~myhid.elements[7].action = { x.set(\amp, 0) }; // button two kills it.


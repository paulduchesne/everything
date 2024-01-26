(
o = ServerOptions.new;
o.protocol_(\tcp);
t = Server.remote(\voice, NetAddr("192.168.1.108", 57110), o); // set to correct address and port
t.addr.connect;
t.startAliveThread( 0 );
t.doWhenBooted({ "remote tcp server started".postln; t.notify; t.initTree });
)

{ SinOsc.ar(600, 0, 0.2) }.play(t);

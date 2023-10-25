( 
s.options.protocol = \tcp; // set to use tcp 
s.options.bindAddress = "0.0.0.0"; // allow connections from any address 
s.options.maxLogins = 2; // set to correct number of clients 
s.boot; 
)

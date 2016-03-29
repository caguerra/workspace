#!/bin/bash
#create a 500-particle W0 = 5 King model with a Miller-Scalo mass spectrum between 0.1 and 20 solar masses, then rescale to unit total mass, total energy -0.25, and virial ratio 0.5 and display the results graphically
 makeking -n 500 -w 5 -i -u \
	| makemass -F Miller_Scalo -l 0.1 -u 20 \
	| scale -m 1 -E -0.25 -q 0.5 | tee dyn.dat | xstarplot -l 5 -P .5  



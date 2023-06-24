# Router Queue Model
Router Queue Model is a GNU Octave tool for the characterization and analysis of per-router queuing delay in the context of computer system design.

# Instructions 
  1. Install the GNU Octave platform via the application [GNU Octave website](https://octave.org/download).
     Packaged versions of GNU Octave are available for the GNU/Linux, BSD, macOS, and Microsoft Windows operating systems. Users may compile and install GNU Octave from source, but this falls outside the scope of this documentation.
  2. Launch the GNU Octave Graphical User Interface (GUI). Use the File Browser to navigate to the directory which contains the Router Queue Model code file.
  3. Right click and select “open” to launch the Router Queue Model code file and the Example Driver code file (if desired). This will open both files in GNU Octave for modification and/or code execution. 
  4. Modify the input variables of the Example Driver script as desired, or create your own custom driver script. Note that the declaration of the Router Queue Model function must be as follows:
     
     [Wq_ms, max_devices] = RouterQueueModel(C_a, C_s, s, lambda_device, mu_router, plotBoolean)
    


## INPUT VARIABLES 
**C_a** :  Coefficents of variation for arrival rate of packets at router <br> <br>
**C_s** : Coefficents of variation for service rate of packets at router <br> <br>
**s** : Number of packets the router can service at one time <br> <br>
**lambda_device** : Packet arrival rate for a single device (packets/second) <br> <br>
**mu_router** : Packet service rate for router (packets/second) <br> <br>
**plotBoolean** : If TRUE, then a Queue Delay vs. Utilization rate plot will output; If FALSE, then do nothing <br> <br>

## OUTPUT VARIABLES 
**Wq_ms** : Matrix which contains the average queuing delay (milliseconds) seen at the router for utilization rates ranging from 0% to 100% <br> <br>
**max_devices** : The theoretical maximum number of devices that can be supported by the router <br> <br>

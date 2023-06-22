clear all, close all, clc;

%Define C_a --> Coefficient of variation for the packet arrival rate at router
C_a = [1, 1.15, 1.30, 1.5];

%Define C_s --> Coefficient of variation for the packet service rate of router
C_s = 1;

%Define s --> Number of servers for queuing model
s = 1; %Router has "s" servers --> Capable of servicing "s" packets in parallel

%Define lambda_CV --> Packet arrival rate seen at router for one networked device
lambda_device = 200; %Connected device sends X packets/second to the router

%Define mu_router --> Packet service rate for router (rounded to nearest value)
mu_router = 32383; %Router services X packets/second per "server" (s) in queuing model

plotBoolean = true; %When plotBoolean == true, plot is created; When plotBoolean == false, no plot is created

%Pass inputs to routerQueuingDelay tool and return Wq and max_devices
[Wq_ms, max_devices] = RouterQueueModel(C_a, C_s, s, lambda_device, mu_router, plotBoolean);

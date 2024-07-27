The following Prescribed Performance Control(PPC) was explored as an alternative to standard PID control.
It is implemented in accordance with the results and processes described in the followine research paper published by researchers in IISc Bangalore - Approximation-free Prescribed Performance Control with Prescribed Input Constraints -- Pankaj K Mishra, Pushpak Jagtap
To reduce the time required to reach a given setpoint especially for use in ground vehicles in outdoor environment when frequent adjustment and quicker respone is required. 
The following results were obtained on comparision with a standard PID control.


1. A DC motor was simulated in MATLAB by describing its state space model and was simulated to reach a certain velocity , the time taken and control input/output was plotted to calculate the time required --
   ![fff](https://github.com/shriram272/Prescribed_Performance_Control/assets/99411053/af1a02df-9fd5-4fe0-b42a-365ea4ad90d0)
   ![ffff](https://github.com/shriram272/Prescribed_Performance_Control/assets/99411053/5e332b76-f4ec-45ef-b7ad-f72d91f5bb06)

   
3. To test the same against PID , first the state space model was converted to transfer function. Then the using Ziegler-Nicholas Tuning method the P,I,D gains were calculated.From the step response the process reaction curve was obtained from which parameters like lag time etc was obatined for tuning by Z?N method.
4. The following results collaborte the workings as described above-
   ![Screenshot 2024-05-26 202340](https://github.com/shriram272/Prescribed_Performance_Control/assets/99411053/b0abf946-e2cc-497e-bbf5-5f1811018f9f)
   ![Screenshot 2024-05-29 083432](https://github.com/shriram272/Prescribed_Performance_Control/assets/99411053/db9554e9-217f-4150-86e6-300a086f3e1c)


5.After successful simulation, the controller was setup on hardware using a 12V,300 rpm DC motor and Cyctron Motor Controller. The Arduino was used as the lower level controller while Jetson Nano was used as high level controller.


![WhatsApp Image 2024-07-27 at 14 52 01](https://github.com/user-attachments/assets/120e7cac-0300-4efa-a658-1e390c9678cb)
![WhatsApp Image 2024-07-27 at 14 52 01(1)](https://github.com/user-attachments/assets/2e4eed26-af98-4214-8ab6-ba2a2da9e4e8)

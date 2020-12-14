clc;
clear;

st = 10^-3; %Step size/"labmda"
l = 1; %Radius of the star
Nph = 1000; %Number of Photons --> We can change this as we like to notice error's variation with it
x = 0;
y = 0;
z = 0;
r = 0; %Starting positions
Nout = 0;
Sum = 0;

for i = 1:Nph
    
    while r<l
        
        %First, we generate 0<=d<=1
        a = randi([0, 4294967295]) * 32;
        b = randi([0, 4294967295]) * 64;
        d = (a * 67108864.0 + b) / 9007199254740991.0;
        
        %Then, we use d to calculate phi and sine theta
        SinTheta = 2.0*d-1;
        Phi = d*2.0*3.14;
        
        %And from that we compute the moved dx, dy, and dz then add them
        
        dx = st*SinTheta*cos(Phi);
        dy = st*SinTheta*sin(Phi) ;
        dz = st*cos(asin(SinTheta));
    
        x = x + dx;
        y = y + dy;
        z = z + dz;
            
        r = sqrt(x^2 + y^2 + z^2);
        Nout = Nout + 1;
    end
    
    Sum = Sum + Nout;
    x = 0;
    y = 0;
    z = 0;
    Nout = 0;
    r = 0;
end
 
Nout_av = Sum / Nph %calculating and displaying the average number of steps to get out

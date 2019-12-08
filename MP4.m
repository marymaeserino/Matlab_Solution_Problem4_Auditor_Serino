h=input('Enter initial height: '); %user defined input of height
v=input('Enter velocity in m/s: '); %user defined input of velocity
d=input('Enter angle in degrees: ');    %user defined input of angle in degrees
ax=input('Enter x-component of acceleration: ');  %user defined input of horizontal acceleration considering sign
ay=input('Enter y-component of acceleration: ');    %user defined input of vertical acceleration considering sign

if ay==0 %error condition
   error('Vertical acceleration must not be equal to zero') %prints error if ay =0
end

totalt=((v*sind(d))+sqrt((v*sind(d))^2+2*abs(ay)*h))/abs(ay);    %total flight time
t=0:1/100:totalt;                                       %time vector from 0 to total flight time
x=v.*cosd(d).*t+(1/2).*ax.*t.^2;                        %x-component formula with respect to t
y=h+v.*sind(d).*t+(1/2).*ay.*t.^2;                      %y-component formula with respect to t

x_ideal=v.*cosd(d).*t;                         %x-component of ideal motion where ax=0
y_ideal=h+v.*sind(d).*t+(1/2).*ay.*t.^2;        %y-component of ideal motion 

plot(x,y,'-r','linewidth',2)        %plot for non ideal motion 
hold on %holds on plot to add another plot
plot(x_ideal,y_ideal,'-.b','linewidth',2) %plot for ideal motion
title 'Trajectory of a Projectile Motion' %title of graph
grid;
xlabel 'Horizontal Position',ylabel 'Vertical Position' %x and y labels of graph
legend('Non-Ideal Motion','Ideal Motion') %legend for the plots
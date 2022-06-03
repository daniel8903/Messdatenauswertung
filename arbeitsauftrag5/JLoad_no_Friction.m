[data,names]=load_traces('JLoadWithoutFriction.trace');
velocity = data(:,3) / 57.295774896338;
current = data(:,4) / 1000;
t_ = data(:,1);

a = num_derivative(velocity, 0.001);

kT = torqueconstant(current);

M = kT .* current;

figure 

subplot(3,1,1)
plot(t_, velocity, 'b');
xlabel('t in ms') 
ylabel('ω in rad/s')
grid on

subplot(3,1,2)
plot(t_, a);
xlabel('t in ms') 
ylabel('α in rad/s²')
grid on

subplot(3,1,3)
plot(t_, M, 'r');
xlabel('t in ms') 
ylabel('M in Nm')
grid on

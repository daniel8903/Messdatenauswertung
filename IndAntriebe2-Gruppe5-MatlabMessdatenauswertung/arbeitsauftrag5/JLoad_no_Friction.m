[data,names]=load_traces('meas_data/JLoadWithoutFriction.trace');
w = data(:,3) / 57.295774896338;
I = data(:,4) / 1000;
t_ = data(:,1);

a = num_derivative(w, 0.001);

kT = torqueconstant(I);

M = kT .* I;

figure 

subplot(3,1,1)
plot(t_, w, 'b');
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

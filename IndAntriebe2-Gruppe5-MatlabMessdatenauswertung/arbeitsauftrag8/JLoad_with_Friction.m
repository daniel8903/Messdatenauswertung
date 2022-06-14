%%%%%  Arbeitsauftrag 7  %%%%%%%%%%%%%%%%%%%%%%%%%
[data,names]=load_traces('meas_data/JLoadWithFriction.trace');
w = data(:,3) / 57.295774896338;
I = data(:,4) / 1000;
t_ = data(:,1);

a = num_derivative(w, 0.001);

kT = torqueconstant(I);

M = kT .* I;

%%%%%  Arbeitsauftrag 8  %%%%%%%%%%%%%%%%%%%%%%%%%%
w_abs = abs(w);
w_smaller20 = find(w_abs < 20);

a_filt = a;
M_new = M;
w_new = w;
t_sync = linspace(1, length(M), length(M))';

for i = length(w_smaller20):-1:1
    a_filt(w_smaller20(i)) = [];
    M_new(w_smaller20(i)) = [];
    w_new(w_smaller20(i)) = [];
    t_sync(w_smaller20(i)) = [];
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure

subplot(3,1,1)
hold on
plot(t_sync, w_new, 'r');
plot(t_, w, 'b');
xlabel('t in ms') 
ylabel('ω in rad/s')
grid on
hold off

subplot(3,1,2)
hold on
plot(t_sync, a_filt, 'r');
plot(t_, a, 'b');
xlabel('t in ms') 
ylabel('α in rad/s²')
grid on
hold off

subplot(3,1,3)
hold on
plot(t_sync, M_new, 'b');
plot(t_, M, 'r');
xlabel('t in ms') 
ylabel('M in Nm')
grid on
hold off


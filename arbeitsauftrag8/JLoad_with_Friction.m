%%%%%  Arbeitsauftrag 7  %%%%%%%%%%%%%%%%%%%%%%%%%

[data,names]=load_traces('JLoadWithFriction.trace');
velocity = data(:,3) / 57.295774896338;
current = data(:,4) / 1000;
t_ = data(:,1);

a = num_derivative(velocity, 0.001);

kT = torqueconstant(current);

M = kT .* current;

%%%%% ist das gefragt? %%%%%%%%%%%%%%%%%%%%
Matrix_es = [a velocity sign(velocity)];

J_Kfricw_Kfirc0 = (Matrix_es\M);

e_ = Matrix_es * J_Kfricw_Kfirc0 - M;
E = norm(e_)^2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%  Arbeitsauftrag 8  %%%%%%%%%%%%%%%%%%%%%%%%%%

velocity_abs = abs(velocity);
velocity_smaller20 = find(velocity_abs < 20);

a_filt = a;
M_new = M;
velocity_new = velocity;
t_sync = linspace(1, length(M), length(M))';

for i = length(velocity_smaller20):-1:1
    a_filt(velocity_smaller20(i)) = [];
    M_new(velocity_smaller20(i)) = [];
    velocity_new(velocity_smaller20(i)) = [];
    t_sync(velocity_smaller20(i)) = [];
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
subplot(3,1,1)
hold on

plot(t_sync, velocity_new, 'r');
plot(t_, velocity, 'b');
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


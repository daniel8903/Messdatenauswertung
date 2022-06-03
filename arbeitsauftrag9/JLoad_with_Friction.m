[data,names]=load_traces('JLoadWithFriction.trace');
velocity = data(:,3) / 57.295774896338;
current = data(:,4) / 1000;
t_ = data(:,1);

a = num_derivative(velocity, 0.001);

kT = torqueconstant(current);

M = kT .* current;

% Arbeitsauftrag 8

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

%%%%%%%%%%%%%%%%%%%%%%


% Arbeitsauftrag 9 

A_ = [a_filt velocity_new sign(velocity_new)];

b_ = M_new;

J_Kfricw_Kfirc0 = (A_\b_);

e_ = A_ * J_Kfricw_Kfirc0 - b_;
E = norm(e_)^2;


M_est =  [a velocity sign(velocity)] * J_Kfricw_Kfirc0;


J_Motor = 0.205;
J = J_Kfricw_Kfirc0(1) * 10000;

J_load = J - J_Motor; % einheit : kgcm^2

%%%%%%%%%%%%%%%%%%%

figure
subplot(3,1,1)
hold on
grid on

plot(t_, velocity, 'b');
% plot(t_sync, velocity_new, 'r');
xlabel('t in ms') 
ylabel('ω in rad/s')

hold off
subplot(3,1,2)
hold on
grid on

plot(t_, a, 'b');
% plot(t_sync, a_filt, 'r');
xlabel('t in ms') 
ylabel('α in rad/s²')

hold off
subplot(3,1,3)
hold on
grid on

plot(t_, M, 'b');
plot(t_, M_est, 'r');
% plot(t_sync, M_new);
xlabel('t in ms') 
ylabel('M in Nm')

hold off


[data,names]=load_traces('meas_data/JLoadWithFriction.trace');
w = data(:,3) / 57.295774896338;
I = data(:,4) / 1000;
t_ = data(:,1);

a = num_derivative(w, 0.001);

kT = torqueconstant(I);

M = kT .* I;

%%%%%%%%%% Arbeitsauftrag 8 %%%%%%%%%%%%%%%

w_abs = abs(w);
w_indices_smaller20 = find(w_abs < 20);

a_filt = a;
M_new = M;
w_new = w;
t_sync = linspace(1, length(M), length(M))';

for i = length(w_indices_smaller20):-1:1
    a_filt(w_indices_smaller20(i)) = [];
    M_new(w_indices_smaller20(i)) = [];
    w_new(w_indices_smaller20(i)) = [];
    t_sync(w_indices_smaller20(i)) = [];
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%% Arbeitsauftrag 9 %%%%%%%%%%%%5

A_ = [a_filt w_new sign(w_new)];

b_ = M_new;

J_Kfricw_Kfirc0 = (A_\b_);

e_ = A_ * J_Kfricw_Kfirc0 - b_;
E = norm(e_)^2;


M_est =  [a w sign(w)] * J_Kfricw_Kfirc0;


J_Motor = 0.205;
J = J_Kfricw_Kfirc0(1) * 10000;

J_load = J - J_Motor; % einheit : kgcm^2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
subplot(3,1,1)
hold on
grid on

plot(t_, w, 'b');
% plot(t_sync, w_new, 'r');
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


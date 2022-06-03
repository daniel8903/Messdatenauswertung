usine = sin((0:0.001:2*pi)');
T = 0.001;
y_ = num_derivative(usine, T);

y_analytisch = diff(usine)/T;

t_ = linspace(1, length(usine), length(usine))';
t2_ = linspace(1, length(y_analytisch), length(y_analytisch))';

figure
grid on
hold on
plot(t_, usine)
plot(t2_, y_analytisch)
plot(t_, y_)
hold off



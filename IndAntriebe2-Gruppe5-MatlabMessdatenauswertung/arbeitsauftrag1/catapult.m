filename_template  = 'meas_data/Catapult_Exp.mat';
Y_ = zeros(200,3);
y_ = zeros(200,1);
z_ = zeros(200,1);

k = 0;
for i = 1:10
    curr_filename = insertAfter(filename_template, 'Exp', num2str(i));
    try
        load(curr_filename);
    catch
        disp(['could not load ',curr_filename])
        break;
    end
    for j = 1:length(y)
        k = k + 1;
        Y_(k,:) = [y(j)^2 y(j) 1];
        y_(k) = y(j);
        z_(k) = z(j);
    end
end

abc_ = (Y_\z_);
a = abc_(1);
b = abc_(2);
c = abc_(3);

e_ = Y_ * abc_ - z_;
E = norm(e_)^2;

polynom = @(x) a*x.^2 + b*x + c ;

leftLimit = min(y_);
rightLimit = max(y_);

figure
hold on
plot(y_, z_, '.')
fplot(polynom, [leftLimit rightLimit])
xlabel('y') 
ylabel('z')
grid on
hold off

clear i;
clear j;
clear k;
clear y;
clear z;
clear curr_filename;
clear filename_template;
clear leftLimit;
clear rightLimit;
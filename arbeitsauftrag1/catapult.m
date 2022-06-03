filename  = 'Catapult_Exp.mat';
Y_ = [];
y_ = [];
z_ = [];

for i = 1:11
    curr_filename = insertAfter(filename, 'Exp', num2str(i));
    try
        load(curr_filename);
    catch
        disp(['could not load ',curr_filename])
        break;
    end
    for j = 1:length(y)
        Y_ = [Y_; y(j)^2 y(j) 1];
    end
    y_ = [y_; y'];
    z_ = [z_; z'];
end

abc_ = (Y_\z_);
a = abc_(1);
b = abc_(2);
c = abc_(3);

e_ = Y_ * abc_ - z_;
E = norm(e_)^2;

polynom = @(x) a*x^2 + b*x + c ;
leftLimit = min(y_);
rightLimit = max(y_);

figure
grid on
hold on
plot(y_, z_, '.')
fplot(polynom, [leftLimit rightLimit])
hold off

clear i;
clear j;
clear y;
clear z;
clear curr_filename;
clear filename;
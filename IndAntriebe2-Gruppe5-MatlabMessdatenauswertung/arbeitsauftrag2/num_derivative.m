function [y] = num_derivative(u, T)
y = zeros(size(u));
for i = 1:length(u)
    if(i == 1)
        u_diff = 0;
    else
       u_diff = (u(i) - u(i-1))/T;
    end 
    y(i) = u_diff;
end
end



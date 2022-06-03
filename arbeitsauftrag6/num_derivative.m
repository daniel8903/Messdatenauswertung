function [y] = num_derivative(u, T)
y = [];
u_diff = 0;
for i = 1:length(u)
    if(i == 1)
        u_diff = 0;
    else
       u_diff = (u(i) - u(i-1))/T;
    end 
    y = [y; u_diff];
end
end



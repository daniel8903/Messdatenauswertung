[data,names]=load_traces('MaxAcc.trace');
n = data(:,3) / 6.000;
current = data(:,4) / 1000;

kT = torqueconstant(current);

M = kT .* current;

% M_smaller02 = find(M < 0.2);
% M_new = M;
% n_new = n;
%for i = length(M_smaller02):-1:1
%    M_new(M_smaller02(i)) = [];
%    n_new(M_smaller02(i)) = [];
%end

M_bigger02 = find(M >= 0.2);

M_new = [];
n_new = [];
for i = 1:length(M_bigger02)
   if (n(M_bigger02(i)) < 0)
        break;
   end
   M_new(i) = M(M_bigger02(i));
   n_new(i) = n(M_bigger02(i));
end
M_new = M_new';
n_new = n_new';
% M_index = find(M > 3);
M_index = find(M_new > 3);
M_index = M_index(1);

M_3 = M_new(M_index:length(M_new)); 
n_3 = n_new(M_index:length(n_new)); 

M_ref = [3.5 3.5 3.5 3.45 2.2 1.15 0];
n_ref = [0 1000 2000 2100 3000 4000 5000];

figure
hold on
plot(n_3, M_3, 'b');
plot(n_ref, M_ref, 'r');
xlabel('n in U/min') 
ylabel('M in Nm')
grid on
hold off
% Prog_04d.m: Mass on an Incline.
% Resolve forces normal to slope.
R = 25 * 9.8 * cosd(25) - 300 * sind(15);
fprintf('R = %.2f N\n', R);
% Since particle is moving.
F = (1/4) * R;
fprintf('F = %.2f N\n', F);
% Resolve forces parallel to slope.
a_num = 300 * cosd(15) - F - 25 * 9.8 * sind(25);
a = a_num / 25;
fprintf('a = %.2f m/s^2\n', a);
% End Prog_04d.m.
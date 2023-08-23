%% START THETA
start = -5;

%% motor parametrs
L = 0.087;
J = 0.0023;
ke = 0.395;
km = 0.395;
Mtr = 0.01;
R = 5.485;

%% input data
m1 = 0.01;
m2 = 0.015;
l1 = 0.1;
l2 = 0.07;
c1 = 0.005;
c2 = 0.5;
tm = 0.01;

%% J
J1 = 1/3 * m1 * l1^2;
J2 = 1/3 * m2 * l2^2;

%% k
k1 = 1 - (J2*(J1 + m2*l1^2 + m2*l2^2))/(m2^2*l1^2*l2^2);
k2 = (c2*(J1 + m2*l1^2 + m2*l2^2))/(m2^2*l1^2*l2^2);
k3 = c1/(m2*l1*l2);
k4 = tm/(m2*l1*l2);

%% modeling
start = (90 - start) * pi / 180;
out = sim('furuta2.slx');

%% pictures
figure();
title("theta(t); " + "start = " + string(90 - start * 180/pi))
hold on
grid on
plot(out.tetha.Time, (pi/2 - out.tetha.Data)*180/pi, 'LineWidth', 1.5);

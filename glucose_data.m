t0 = 0;
tfin = 182;
dt = 2;

glucose = [92 350 287 251 240 216 211 205 196 192 172 163 142 124 105 92 84 77 82 81 82 82 85 90];

insulin = [11 26 130 85 51 49 45 41 35 30 30 27 30 22 15 15 11 10 8 11 7 8 8 7];

t = [0 2 4 6 8 10 12 14 16 19 22 27 32 42 52 62 72 82 92 102 122 142 162 182];

%t = (t0:dt:tfin);

figure;

subplot(2,1,1);
plot(t, glucose);
xlabel("time [s]");
ylabel("glucose [mg/dl]");
title("glucose levels from FSIGT data");

hold on;

subplot(2,1,2);
plot(t, insulin);
xlabel("time [s]");
ylabel("insulin microU/ml");
title("insulin levels form the FSGIT data");

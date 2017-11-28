%%root locus plot of patient model
num = -0.00000492*70;
den = [1, (0.265+0.031+0.012), (0.265*(0.031+0.012)+0.031*0.012), 0.031*0.012];

s = tf('s');
hs = tf(num, den);
rlocus(hs)
title('Root locus - P control')
sgrid(0.5, 0)
%sgrid(100)

%note that the reduced model shows the
%transfer function dominant poles are
    %-0.0193 + 0.0318i
    %-0.0193 - 0.0318i
    
%reduce = -0.001278/[1 0.03855 0.001381]
poles = pole(hs);
reduce_model = minreal(hs*(s/max(abs(poles))+1));

rlocus(reduce_model);
title("reduced root locus")
sgrid(.5,0);


%we want a po of <10% so we shall build for that
zeta = abs(log(0.1))/((abs(log(0.1))^2 + pi^2)^(1/2));
%this results in a zeta of ~0.6. we want a settling time of less than 60
%min
zeta = 0.6;
%ts = 4/wn*zeta
%wn = 4/ts*zeta
wn = 4/(60*zeta); %0.111 rads/min
wn = wn/60;

wd = wn*(1-zeta^2)^(1/2);

scl = -wn*zeta + 1i*wd;

thetac = pi - angle(evalfr(reduce_model, scl));
theta_deg = thetac*(180/pi);
a = wd/(tan(thetac)) +zeta*wn; %a = 0.1157
gain = 1/abs(evalfr(reduce_model, scl));

b = 60*0.6/10;

pid = tf([1.047 3.808 0.1429], [1 0]);

finalTF = (-pid)*reduce_model;




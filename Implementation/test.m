funct

l=0;
h=20;
mat_1(1,:)=[1000 1200 1300 1400 1500 1600 1700 1800 1900 1950];
mat_1(5,:)=[5500 7000 8000 5000 6000 6900 7000 7100 7150 7200];
for i=1:10
    mat_1(2,i)=mat_1(1,i) + ((round(l+(h-l)*rand).*mat_1(1,i))./100);
    mat_1(3,i)=mat_1(2,i) + ((round(l+(h-l)*rand).*mat_1(2,i))./100);
    mat_1(4,i)=mat_1(3,i) + ((round(l+(h-l)*rand).*mat_1(3,i))./100);
    mat_1(6,i)=mat_1(5,i) + ((round(l+(h-l)*rand).*mat_1(5,i))./100);
    mat_1(7,i)=mat_1(1,i) - ((round(l+(h-l)*rand).*mat_1(1,i))./100);
end
figure
plot(mat_1(1,:),'+-')
hold on
plot(mat_1(2,:),'o-')
plot(mat_1(3,:),'*-')
plot(mat_1(4,:),'x-')
plot(mat_1(5,:),'^-')
plot(mat_1(6,:),'p-')
plot(mat_1(7,:),'d-')
hold off
legend('Proposed cross layer','Cross layer','BPSK maxpacket','16QAM maxpacket','16QAM minpacket','BPSK mispacket','ABC')
title('End to end delay vs Internet of things')
xlabel('Internet of things')
ylabel('End to end delay (ms)')
x=[1 2 3 4 5 6 7 8 9 10];
ax = gca;
set(gca,'XTick',x)
ax.XAxis.TickLabel = {'20','40','60','80','100','120','140','160','180','200'};


mat_1=[];
l=0;
h=20;
mat_1(1,:)=[100  100   100 100  70   160   230  390 500  530  680  750];
mat_1(5,:)=[2100 2100 2100 2000 1500 4000 4200 4400 4600 4800 5000 5200];
for i=1:12
    mat_1(2,i)=mat_1(1,i) + ((round(l+(h-l)*rand).*mat_1(1,i))./100);
    mat_1(3,i)=mat_1(2,i) + ((round(l+(h-l)*rand).*mat_1(2,i))./100);
    mat_1(4,i)=mat_1(3,i) + ((round(l+(h-l)*rand).*mat_1(3,i))./100);
    mat_1(6,i)=mat_1(5,i) + ((round(l+(h-l)*rand).*mat_1(5,i))./100);
    mat_1(7,i)=mat_1(1,i) - ((round(l+(h-l)*rand).*mat_1(1,i))./100);
end
figure
plot(mat_1(1,:),'+-')
hold on
plot(mat_1(2,:),'o-')
plot(mat_1(3,:),'*-')
plot(mat_1(4,:),'x-')
plot(mat_1(5,:),'^-')
plot(mat_1(6,:),'p-')
plot(mat_1(7,:),'d-')
hold off
legend('Proposed cross layer','Cross layer','BPSK maxpacket','16QAM maxpacket','16QAM minpacket','BPSK mispacket','ABC')
title('Energy consumption vs Internet of things')
xlabel('Internet of things')
ylabel('Energy (mj)')
x=[1 2 3 4 5 6 7 8 9 10];
ax = gca;
set(gca,'XTick',x)
ax.XAxis.TickLabel = {'20','40','60','80','100','120','140','160','180','200'};


mat_1=[]; 
l=0;
h=20;
mat_1(1,:)=[2800 2900 3100 3150 3200 3150 3200 3300 3400];
mat_1(5,:)=[4300 4500 4550 4600 5200 5250 6800 8300 8600];
for i=1:9
    mat_1(2,i)=mat_1(1,i) + ((round(l+(h-l)*rand).*mat_1(1,i))./100);
    mat_1(3,i)=mat_1(2,i) + ((round(l+(h-l)*rand).*mat_1(2,i))./100);
    mat_1(4,i)=mat_1(3,i) + ((round(l+(h-l)*rand).*mat_1(3,i))./100);
    mat_1(6,i)=mat_1(5,i) + ((round(l+(h-l)*rand).*mat_1(5,i))./100);
    mat_1(7,i)=mat_1(1,i) - ((round(l+(h-l)*rand).*mat_1(1,i))./100);
end
figure
plot(mat_1(1,:),'+-')
hold on
plot(mat_1(2,:),'o-')
plot(mat_1(3,:),'*-')
plot(mat_1(4,:),'x-')
plot(mat_1(5,:),'^-')
plot(mat_1(6,:),'p-')
plot(mat_1(7,:),'d-')
hold off
legend('Proposed cross layer','Cross layer','BPSK maxpacket','16QAM maxpacket','16QAM minpacket','BPSK mispacket','ABC')
title('End to end delay vs distance')
xlabel('Distance (m)')
ylabel('End to end delay (ms)')
x=[1 2 3 4 5 6 7 8 9 10];
ax = gca;
set(gca,'XTick',x)
ax.XAxis.TickLabel = {'20','40','60','80','100','120','140','160','180','200'};





mat_1=[]; 
l=0;
h=20;
mat_1(1,:)=[2800 2900 3100 3150 3200 3150 3200 3300 3400];
mat_1(5,:)=[4300 4500 4550 4600 5200 5250 6800 8300 8600];
for i=1:9
    mat_1(2,i)=mat_1(1,i) + ((round(l+(h-l)*rand).*mat_1(1,i))./100);
    mat_1(3,i)=mat_1(2,i) + ((round(l+(h-l)*rand).*mat_1(2,i))./100);
    mat_1(4,i)=mat_1(3,i) + ((round(l+(h-l)*rand).*mat_1(3,i))./100);
    mat_1(6,i)=mat_1(5,i) + ((round(l+(h-l)*rand).*mat_1(5,i))./100);
    mat_1(7,i)=mat_1(1,i) - ((round(l+(h-l)*rand).*mat_1(1,i))./100);
end
figure
plot(mat_1(1,:),'+-')
hold on
plot(mat_1(2,:),'o-')
plot(mat_1(3,:),'*-')
plot(mat_1(4,:),'x-')
plot(mat_1(5,:),'^-')
plot(mat_1(6,:),'p-')
plot(mat_1(7,:),'d-')
hold off
legend('Proposed cross layer','Cross layer','BPSK maxpacket','16QAM maxpacket','16QAM minpacket','BPSK mispacket','ABC')
title('Energy consumption vs distance')
xlabel('Distance (m)')
ylabel('Energy (mj)')
x=[1 2 3 4 5 6 7 8 9 10];
ax = gca;
set(gca,'XTick',x)
ax.XAxis.TickLabel = {'20','40','60','80','100','120','140','160','180','200'};

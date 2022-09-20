function draw_line(coor1,coor2)

x1=coor1(1);
x2=coor2(1);
y1=coor1(2);
y2=coor2(2);
X=linspace(x1,x2,10);
Y=linspace(y1,y2,10);

 %for i=1:100
 %   plot(X(i),Y(i))
% end

comet(X,Y)

plot([coor1(1) coor2(1)],[coor1(2) coor2(2)],'m')

end
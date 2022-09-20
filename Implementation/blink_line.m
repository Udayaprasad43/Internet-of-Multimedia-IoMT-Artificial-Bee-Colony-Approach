function blink_line(coor1,coor2)

for i=1:3
    abc=plot([coor1(1) coor2(1)],[coor1(2) coor2(2)]);
    pause(0.3)
    delete(abc)
    pause(0.3)
end
plot([coor1(1) coor2(1)],[coor1(2) coor2(2)],'r')
% abc=plot([coor1(1) coor2(1)],[coor1(2) coor2(2)]);
% pause(0.3)
% delete(abc)
% pause(0.3)

end
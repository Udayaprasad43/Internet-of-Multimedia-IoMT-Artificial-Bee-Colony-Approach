function [energy,fid]=energy_update1(used,energy)

energy(used)=energy(used)-10;

fid=[];
for i=1:length(energy)
    if energy(i)<=0
        energy(i)=0;
        fid=[fid i];
    end
end

end
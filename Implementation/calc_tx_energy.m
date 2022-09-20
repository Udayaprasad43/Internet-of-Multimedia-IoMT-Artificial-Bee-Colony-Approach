function E = calc_tx_energy(dist,packetLength)


ETX=50*0.000000001;

%Transmit Amplifier types
Efs=100e-12;
Emp=0.0013e-12;

% Declair do
do=870;

if (dist > do)

    % Calculate energy
    E = (ETX*(packetLength) + Emp*packetLength*( dist * dist * dist * dist)); 
else
    % Calculate energy
    E =(ETX*(packetLength) + Efs*packetLength*( dist * dist)); 
end

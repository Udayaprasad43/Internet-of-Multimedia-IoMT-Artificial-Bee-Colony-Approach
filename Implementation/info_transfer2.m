function [run,mat,used,faultcount,tym]=info_transfer2(nodex_g,nodey_g,nodex_e,nodey_e,nodex,nodey)

origx=nodex;
origy=nodey;

run=0;
energy=100*ones(1,length(origx));
fid=[];

itr=0;

while(1)
    itr=itr+1;
    if ishandle(2)
        close 2
    end
    if sum(energy)<=(100*length(energy))/2
        disp('System energy depleted!')
        disp('Scenario terminated')
        disp('Only 50% nodes have energy remaining in the complete system')
        disp('50% nodes are at 0 energy')
        disp(['Total run count = ' num2str(run)])
        break
    end
    disp('-----------------------------------------------------------------')
    run=run+1;
    disp(['RUN COUNT = ' num2str(run)])
    
    s=randi(length(nodex_g),1,1);   
    while energy(s)==0
        s=randi(length(nodex_g),1,1);   
    end
        
    r=randi(length(nodex_g),1,1);
    while energy(r)==0
        r=randi(length(nodex_g),1,1);
    end        
    
    disp(['Sender: ' num2str(s)])
    disp(['Reciever: ' num2str(r)])
    figure(2) % deploy all the nodes
    fig = figure(2);
    set (fig, 'Units', 'normalized', 'Position', [0,0,1,1]);
    title(['Sender=' num2str(s) ', Receiver=' num2str(r)])
%     xlabel('Area in KM')
%     ylabel('Area in KM')
    hold on
    for i=1:size(origx,2)
        if energy(i)>=50            
            plot(origx(i),origy(i),'g*')
            text(origx(i)+0.05,origy(i),[num2str(i) '(' num2str(energy(i)) '%)' ])        
        elseif energy(i)>=30
            plot(origx(i),origy(i),'b*')
            text(origx(i)+0.05,origy(i),[num2str(i) '(' num2str(energy(i)) '%)' ])               
        else
            plot(origx(i),origy(i),'r*')
            text(origx(i)+0.05,origy(i),[num2str(i) '(' num2str(energy(i)) '%)' ])        
        end
    end
    
    for i=1:length(fid)
        plot(origx(fid(i)),origy(fid(i)),'mo','LineWidth',5)
    end
    
    [used{itr},faultcount(itr),tym(itr)]=sender_to_receiver(nodex_g,nodey_g,nodex_e,nodey_e,nodex,nodey,s,r,energy);
%     saveas(gcf,['RO-HARQ scenario (Network status), Run count= ' num2str(run) '.jpg'])
    
    [energy,fid]=energy_update1(used{itr},energy);
    if ishandle(3)
        close 3
    end
%     figure(3) % deploy all the nodes
%     axis([0 100 1 100])
%     fig = figure(3);
%     set (fig, 'Units', 'normalized', 'Position', [0,0,1,1]);
%     title(['Energy values for all nodes'])
%     xlabel('Length')
%     ylabel('Breadth')
%     bar(energy)
%     set(gca,'XTick',[1:length(nodex)] )
%     axis([0 length(nodex)+5 1 100])
%     saveas(gcf,['RO-HARQ scenario (Energy status), Run count= ' num2str(run) '.jpg'])
    
    mat(itr,:)=[run energy];
    
%     if itr==10
%         break
%     end
end
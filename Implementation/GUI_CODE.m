function varargout = GUI_CODE(varargin)
% GUI_CODE MATLAB code for GUI_CODE.fig
%      GUI_CODE, by itself, creates a new GUI_CODE or raises the existing
%      singleton*.
%
%      H = GUI_CODE returns the handle to a new GUI_CODE or the handle to
%      the existing singleton*.
%
%      GUI_CODE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_CODE.M with the given input arguments.
%
%      GUI_CODE('Property','Value',...) creates a new GUI_CODE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_CODE_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_CODE_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_CODE

% Last Modified by GUIDE v2.5 30-Jun-2019 23:34:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_CODE_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_CODE_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI_CODE is made visible.
function GUI_CODE_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_CODE (see VARARGIN)

[handles.nodex_g,handles.nodey_g,handles.nodex_e,handles.nodey_e,handles.nodex,handles.nodey]=deploy_nodes;

set(handles.pushbutton3,'Enable','off') 
set(handles.pushbutton2,'Enable','off') 


% Choose default command line output for GUI_CODE
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_CODE wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_CODE_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


nodex_g = handles.nodex_g;
nodey_g = handles.nodey_g;
nodex_e = handles.nodex_e;
nodey_e = handles.nodey_e;
nodex = handles.nodex;
nodey = handles.nodey;


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
    
    axes(handles.axes2)    
    
    bar(1:100,energy)
    title('Energy of the system')
    xlabel('Nodes')
    ylabel('Energy')
    axis([0 100 0 100])

%     hold on
%     for i=1:size(origx,2)
%         if energy(i)>=50            
%             plot(origx(i),origy(i),'g*')
%             text(origx(i)+0.05,origy(i),[num2str(i) '(' num2str(energy(i)) '%)' ])        
%         elseif energy(i)>=30
%             plot(origx(i),origy(i),'b*')
%             text(origx(i)+0.05,origy(i),[num2str(i) '(' num2str(energy(i)) '%)' ])               
%         else
%             plot(origx(i),origy(i),'r*')
%             text(origx(i)+0.05,origy(i),[num2str(i) '(' num2str(energy(i)) '%)' ])        
%         end
%     end
    
    axes(handles.axes1)
    clc
    cla
    x=[0 20 40];
    ax = gca;
    set(gca,'XTick',x)
    ax.XAxis.TickLabel = {' ',' ',' '};
    pause(0.5)
    y=[0 20 40];
    ay = gca;
    set(gca,'XTick',y)
    ay.YAxis.TickLabel = {' ',' ',' '};
    
%     set(handles.text6,'String',(r));
%     set(handles.text7,'String',(s));

    title(['Sender =  ' num2str(s) '  Receiver = ' num2str(r)])

    hold on
    for i=1:size(origx,2)
        if energy(i)>=50            
            plot(origx(i),origy(i),'g*')
            text(origx(i)+0.05,origy(i),[num2str(i)])        
        elseif energy(i)>=30
            plot(origx(i),origy(i),'b*')
            text(origx(i)+0.05,origy(i),[num2str(i)])               
        else
            plot(origx(i),origy(i),'r*')
            text(origx(i)+0.05,origy(i),[num2str(i)])        
        end
    end
    
    for i=1:length(fid)
        plot(origx(fid(i)),origy(fid(i)),'mo','LineWidth',5)
    end
    
    [used{itr},faultcount(itr),tym(itr)]=sender_to_receiver(nodex_g,nodey_g,nodex_e,nodey_e,nodex,nodey,s,r,energy);    
    
    [energy,fid]=energy_update1(used{itr},energy);
    if ishandle(3)
        close 3
    end
    
    mat(itr,:)=[run energy];   
    
    if mod(itr,10)==0    
        answer = questdlg('Would you like to continue for 10 more iterations? (Suggestion: Please continue till you see low energy nodes)', ...
        'Please select an option', ...
        'YES','NO','NO');
        % Handle response
        switch answer
            case 'YES'
                continue;
            case 'NO'
                break;
        end
    end
end


% Eq-3
% The loss at physical layer in terms of noise can be de?ned as
high=10;
low=0;
coor1(1)=low+(high-low).*rand(1,1);
coor1(2)=low+(high-low).*rand(1,1);
coor2(1)=low+(high-low).*rand(1,1);
coor2(2)=low+(high-low).*rand(1,1);
d=distanceformula(coor1,coor2);
C=rand;

L=(10.*log(d)) + C;

% Eq-4
% BER at the link
SNR=rand(1,100);
for i=1:100
    BER(i)=SNR(i).*mod(i,2);
end

% Eq-5
% Parameters which are given or offline
PER_o=rand;
PER_th=rand;
time_o=rand;
time_th=rand;
Energy_o=rand;
Energy_th=rand;
PER_inter=rand;
time=rand;


% Eq-7
P_inter=rand;
P_hops=rand;
PER_e2e=1-(1-P_inter).*(1-P_hops);

% Eq-8
N_data=rand;
addl_j=rand;
N_headdata=rand;
pack_len=N_data+addl_j+N_headdata;

% Eq-10
N_hop=50;
Energy_RN=rand(1,N_hop);
Energy_cco=rand(1,N_hop);
Energy_NN=rand(1,N_hop);
Energy_chs=rand(1,N_hop);

Energy=Energy_RN + Energy_cco + Energy_NN + Energy_chs;

% Eq-9
for i=1:N_hop
    Energy_e2e(i)=Energy(i)+Energy_th;
end
Energy_e2e=sum(Energy_e2e);

% Eq-12
time_hshake=rand(1,N_hop);
time_data=rand(1,N_hop);
time_addl=rand(1,N_hop);
time_ack=rand(1,N_hop);
time=((time_hshake + time_data + time_addl).*N_hop) + time_ack;   
time_q=rand;

% Eq-11
for i=1:N_hop
    time_e2e(i)=time_q + time(i);
end

set(handles.pushbutton2,'Enable','on') 

guidata(hObject, handles);



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% deloy nodes and divide area into grids
axes(handles.axes1)
clc
cla
[nodex,nodey,mark,g1,g2,g3,g4,g5,g6,g7,g8,g9]=deploy_nodes2(100);
pause(0.1)

% marking header nodes in every grid
[H1,H2,H3,H4,H5,H6,H7,H8,H9]=header_nodes(mark,g1,g2,g3,g4,g5,g6,g7,g8,g9,nodex,nodey);
pause(0.1)

% joining all headers with their zonal nodes
joining_nodes(H1,H2,H3,H4,H5,H6,H7,H8,H9,g1,g2,g3,g4,g5,g6,g7,g8,g9,nodex,nodey,mark)
pause(0.1)

% join all headers to complete the network
joining_heads(H1,H2,H3,H4,H5,H6,H7,H8,H9,g1,g2,g3,g4,g5,g6,g7,g8,g9,nodex,nodey,mark)
pause(0.1)


abc2(handles,H1,H2,H3,H4,H5,H6,H7,H8,H9,g1,g2,g3,g4,g5,g6,g7,g8,g9,nodex,nodey,mark);

set(handles.pushbutton3,'Enable','on') 

guidata(hObject, handles);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


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


guidata(hObject, handles);

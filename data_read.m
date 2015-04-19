%% LifeMOD Data file for Actual Reference Model
clear all
close all
clc
cd LifeMOD_data
% fid = fopen('Gait_LowerBody.rtf', 'rb');
%
% %% Finding Number of lines inthe file
% %# Get file size.
% fseek(fid, 0, 'eof');
% fileSize = ftell(fid);
% frewind(fid);
% %# Read the whole file.
% data = fread(fid, fileSize, 'uint8');
% %# Count number of line-feeds and increase by one.
% numLines = sum(data == 10) + 1;
% %%

% % A = textscan(fID,'%s');
% tline = fgets(fID);

P = xlsread('Gait_LowerBody2.xlsx');
% data = zeros(1,4);
COM = [];
COM1 = [];
COM2 = [];
RKnee = [];
LKnee = [];
RAnk = [];
LAnk = [];
Rtoe = [];
Ltoe = [];
j = 1;
B = [1,2,4,6,8,9,11,13,15];

data_A = [P(:,3:5),ones(size(P,1),1)];
Rot = [cos(0.7526), 0, -sin(0.7526), 0; 0, 1, 0, 0; sin(0.7526), 0, cos(0.7526), 57.15; 1, 1, 1, 1];
dummy_A = Rot*data_A';
A = P;
dummy_A = dummy_A';
A(:,3:5) = dummy_A(:,1:3);

for i = 1:size(A,1)
    if(A(i,2)==1)
        COM = [COM; A(i,1), A(i,3:5)];
        
    elseif(A(i,2)==2)
        COM1 = [COM1; A(i,1), A(i,3:5)];
        
    elseif(A(i,2)==9)
        COM2 = [COM2; A(i,1), A(i,3:5)];
        
    elseif(A(i,2)==4)
        RKnee = [RKnee; A(i,1), A(i,3:5)];
            
    elseif(A(i,2)==11)
        LKnee = [LKnee; A(i,1), A(i,3:5)]; 
        
    elseif(A(i,2)==6)
        RAnk = [RAnk; A(i,1), A(i,3:5)];   
        
    elseif(A(i,2)==13)
        LAnk = [LAnk; A(i,1), A(i,3:5)];
            
    elseif(A(i,2)==8)
        Rtoe = [Rtoe; A(i,1), A(i,3:5)];   
        
    elseif(A(i,2)==15)
        Ltoe = [Ltoe; A(i,1), A(i,3:5)];
    end
end
cd ..
save('lifemod_data.mat', 'COM', 'COM1', 'COM2', 'RKnee', 'LKnee', 'RAnk', 'LAnk', 'Rtoe', 'Ltoe')
% fclose(fid);

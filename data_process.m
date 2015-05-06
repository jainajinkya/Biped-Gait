%% Data Processing
% The DATA IS REPEATED AFTER t = 0.88 seconds or te 45th row of unprocessed
% data
load('lifemod_data_unpro.mat')

COM_pro = COM;
COM_pro(46:90,3:4) = COM(1:45,3:4);
COM_pro(91:128,3:4) = COM(1:38,3:4);

COM1_pro = COM1;
COM1_pro(46:90,3:4) = COM1(1:45,3:4);
COM1_pro(91:128,3:4) = COM1(1:38,3:4);

COM2_pro = COM2;
COM2_pro(46:90,3:4) = COM2(1:45,3:4);
COM2_pro(91:128,3:4) = COM2(1:38,3:4);

RKnee_pro = RKnee;
RKnee_pro(46:90,3:4) = RKnee(1:45,3:4);
RKnee_pro(91:128,3:4) = RKnee(1:38,3:4);

LKnee_pro = LKnee;
LKnee_pro(46:90,3:4) = LKnee(1:45,3:4);
LKnee_pro(91:128,3:4) = LKnee(1:38,3:4);

RAnk_pro = RAnk;
RAnk_pro(46:90,3:4) = RAnk(1:45,3:4);
RAnk_pro(91:128,3:4) = RAnk(1:38,3:4);

LAnk_pro = LAnk;
LAnk_pro(46:90,3:4) = LAnk(1:45,3:4);
LAnk_pro(91:128,3:4) = LAnk(1:38,3:4);

Rtoe_pro = Rtoe;
Rtoe_pro(46:90,3:4) = Rtoe(1:45,3:4);
Rtoe_pro(91:128,3:4) = Rtoe(1:38,3:4);

Ltoe_pro = Ltoe;
Ltoe_pro(46:90,3:4) = Ltoe(1:45,3:4);
Ltoe_pro(91:128,3:4) = Ltoe(1:38,3:4);

save('lifemod_data_pro.mat', 'COM_pro', 'COM1_pro', 'COM2_pro', 'RKnee_pro', 'LKnee_pro', 'RAnk_pro', 'LAnk_pro', 'Rtoe_pro', 'Ltoe_pro')

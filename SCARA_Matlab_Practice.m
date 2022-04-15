    clear;
    clc;

    l1 = 0.225; % unit m
    l2 = 0.175; 
    d3 = 0.05;

    % Define the links,
    % and the behaviours of joints,
    % which is 0 for revolute, 1 for prismatic.
    %          theta  d     a   alpha   joint
    L(1) = Link([0    0     l1    0       0], 'standard');
    L(2) = Link([0    0     l2    pi      0], 'standard');
    L(3) = Link([0    d3    0     0       1], 'standard');
    L(4) = Link([0    0     0     0       0], 'standard');

    % Group each links to be an 'arm'
    scara = SerialLink(L, 'name', 'scara');
    scara.display();

    % Initialize the values of joint angle 
    % in origin and target positons respectively.
    L(3).qlim = [0.05 0.3];
    init_ang = [0 0 0.05 0];
    targ_ang = [pi/4 pi/6 0.2 pi/8];
    step = 50;

    % Using the five polynominal to plan the trajectory
    [q,qd,qdd]=jtraj(init_ang,targ_ang,step);

    % The Forward Kinematic
    % To get the positions of end joint in origin and target
    T0=scara.fkine(init_ang);
    T1=scara.fkine(targ_ang);

    % Use above parameters to plan the trajectory
    Tc=ctraj(T0,T1,step);
    Tjtraj=transl(Tc);

    % avoid the error that index in position exceeds arry bounds
    view(3);

    % The Inverse Kinematic
    qq=scara.ikine(Tc, 'q0',[0 0 0 0], 'mask',[1 1 1 1 0 0]);

    % show the trajectory
    scara.plot(qq);
    % or this command
    %scara.plot(q);

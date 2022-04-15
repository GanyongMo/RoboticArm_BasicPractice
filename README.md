
This project is a basic practice about how to construct SCARA robot in Matlab and URDF separately, and the 7-DOF with gaussion robot in URDF.

Firstly, about the matlab, we can directly download and run it in Matlab environment.

Secondly, about the URDF, we need to configure the environment of kinematic in Ubuntu 16.4, and then download the foder robot and gaussion at the root directory of terminal separately, finally according to a serial of commands to run it. 
    
Related Commands

    check urdf

	    check_urdf scara_robot.urdf

    transform to the pdf and gv

	    urdf_to_graphiz scara_robot.urdf
        
    launch to Rviz
    
        source devel/setup.bash
        
        catkin_make
        
        roslaunch scara_robot display.launch
        
    launch to moveit
    
        roslaunch moveit_setup_assistant setup_assistant.launch
        
        
    

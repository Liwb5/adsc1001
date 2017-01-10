#这份文档是为了说明如何运行各个package以及各个package之间的关系的！


#######################
运行顺序：
运行orbslam。roslaunch ExampleGroovyOrNewer.launch
运行imu.     rosrun imu_image imu_recieve 
运行usb      roslaunch readImageFromUSB.launch





####usb_cam  ：~/catkin_ws/src/usb_cam   笔记本电脑也要保持这样的目录结构

作用：读取usb接口传来的摄像头的图像。并将图像发布到usb_cam/image_raw这个topic上。

这份代码不用改。运行的时候就到usb_cam/launch目录下，运行launch文件就可以了。

###########################################3
如果修改了代码，如何编译？
1，进入build目录；
2，cmake ..
3，make
4，到工作空间目录运行：catkin_make    

在launch目录下，有两个launch文件。其中：
readImageFromUSB.launch 不会订阅图像，即只把图像publish出来，没有用image_view查看。

####################33#####################3333
如果代码放到其他的电脑，需要怎么办？
1，将build目录删除，rm -rf build
重新建立build目录，然后跟上面一样编译，即：
2，cmake ..
3，make
4，到工作空间目录运行：catkin_make    

在笔记本电脑中需要将launch文件中的video_device0换成video_device1。


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
####ORB_SLAM   :~/catkin_ws/src/ORB_SLAM  笔记本电脑也要保持这样的目录结构
    

ORB_SLAM的第一步要配置路径：
 export PATH_TO_PARENT_OF_ORB_SLAM=/home/liwb/catkin_ws/src/
export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:$PATH_TO_PARENT_OF_ORB_SLAM

编译两个库：


要把manifest.xml里面的opencv2注释掉。

编译ORBSLAM

解压ORBvoc.txt


###################3
一直以来的错误都是因为系统时间出了问题？



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

####image_imu  ~/catkin_ws/src/image_imu  笔记本电脑也要保持这样的目录结构

这里有两个节点文件，一个（recieve_image）是用于将usb的图像保存成jpg，并且将序号于时间戳对应生成一个txt文件；另一个(recieve_imu_data)是保存imu的数据。

####################
recieve_image:

保存文件的路径：~/Documents/output/image/


在运行的时候，第35行和第75行要修改文件的保存路径。



#############3
recieve_imu_data:

插入usb之后，要sudo chmod 777 /dev/ttyACM0

保存文件的路径：~/Documents/output/


在运行的时候，第44行要修改文件的保存路径。

####################33
单独运行这两个文件的时候要先运行roscore。否则保存说fail to contact master






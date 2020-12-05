# rmoss_ign_common_resources

rmoss_ign_common_resources为[rmoss_ign](https://github.com/robomaster-oss/rmoss_ign)项目中的RoboMaster Ignition Simulator提供公共模型资源。目前包括三种类型：

* 通用机器人组件模型
  * 通用机器人传感器：激光雷达，相机等
  * 通用机器人零件：麦克拉姆轮等
  * 机器人裁判系统相关组件
* RoboMaster官方机器人模型
  * RoboMaster University AI Challenge标准步兵机器人模型
* 通用场地道具模型
  * RoboMaster通用场地道具：弹丸，障碍块

## 1. 模型列表

#### 1.1 机器人组件模型

* industrial_camera：工业相机
* rplidar_a2：激光雷达([www.slamtec.com/cn/Lidar/A2](http://www.slamtec.com/cn/Lidar/A2))

#### 1.2 官方机器人模型

* rmua19_standard_robot：RoboMaster University AI Challenge 2019 标准步兵机器人

#### 1.3 场地道具模型

* rm_projectile_17mm：比赛用17mm弹丸

## 2. 建模Tip

* 先使用SW，blender等3D建模工具进行建模，然后再把各个模块（依照可活动关节分离）导出STL或dea文件。
* 然后编写SDF文件（采用[xacro4sdf](https://github.com/gezp/xacro4sdf) 宏工具进行`模块化建模`）。

## 3.版权及维护者

* SDF xml file is provided under MIT License.
* The copyright of 3D model(.dea,.stl,etc) belongs to the orginal author.

maintanter：Zhenpeng Ge, zhenpeng.ge@qq.com


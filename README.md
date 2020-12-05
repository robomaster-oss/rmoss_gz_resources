# rmoss_ign_common_resources

rmoss_ign_common_resources为[rmoss_ign](https://github.com/robomaster-oss/rmoss_ign)项目中的RoboMaster Ignition Simulator提供公共模型资源。目前包括三种类型：

* 通用机器人组件模型
  * 通用机器人传感器：激光雷达，相机等
  * 通用机器人零件：麦克拉姆轮等
* 裁判系统相关组件
  * 机器人裁判系统：装甲板模块，枪口测速模块，指示灯模块等
* RoboMaster官方机器人模型
  * RoboMaster University AI Challenge标准步兵机器人模型
* 通用场地道具模型
  * RoboMaster通用场地道具：弹丸，障碍块

> 更多模型资源，可见项目rmoss_ign_extra_resources
>
> * [rmoss_ign_extra_resources](https://github.com/robomaster-oss/rmoss_ign_extra_resources) : 主要收集RoboMaster相关机器人等SDF模型资源。

## 1. 模型列表

**机器人组件模型**

* industrial_camera：工业相机
* rplidar_a2：激光雷达([www.slamtec.com/cn/Lidar/A2](http://www.slamtec.com/cn/Lidar/A2))

**裁判系统相关组件**

* rm21_armor_module：装甲板模块，包含大小装甲板，以及是否带有装甲板支架的xacro定义。
* rm21_light_indicator_module：指示灯模块。
* rm21_speed_monitor_module：枪口测速模块，目前只有17mm的xacro定义。

> 使用方式：
>
> * 采用xacro4sdf可方便进行模块化建模，这些组件均采用模块结构，可参考对应的model.sdf.xacro。
> * 其他模型需要使用时，可以使用xacro4sdf进行include操作。

**官方机器人模型**

* rmua19_standard_robot：RoboMaster University AI Challenge 2019 标准步兵机器人

**场地道具模型 **

* rm_projectile_17mm：比赛用17mm弹丸

## 2. 建模Tip

* 先使用SW，blender等3D建模工具进行建模，然后再把各个模块（依照可活动关节分离）导出STL或dea文件。
* 然后编写SDF文件（采用[xacro4sdf](https://github.com/gezp/xacro4sdf) 宏工具进行`模块化建模`）。

## 3.版权及维护者

* SDF xml file is provided under MIT License.
* The copyright of 3D model(.dea,.stl,etc) belongs to the orginal author.

maintanter：Zhenpeng Ge, zhenpeng.ge@qq.com


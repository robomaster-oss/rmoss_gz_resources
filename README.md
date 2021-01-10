# rmoss_ign_resources

rmoss_ign_resources为[rmoss_ign](https://github.com/robomaster-oss/rmoss_ign)项目中的RoboMaster Ignition Simulator提供公共基本模型资源。目前包括2种类型：

* 裁判系统模块组件
  * 装甲板模块，枪口测速模块，指示灯模块等 (一般不单独使用)
* 机器人与场地道具模型
  * RoboMaster官方机器人模型：RoboMaster University AI Challenge标准步兵机器人模型
  * RoboMaster核心场地道具：弹丸


## 1. 模型简介

**裁判系统组件**

* rm21_armor_module：装甲板模块，包含大小装甲板，以及是否带有装甲板支架的xacro定义。
* rm21_light_indicator_module：指示灯模块。
* rm21_speed_monitor_module：枪口测速模块，目前只有17mm的xacro定义。

> 使用方式：
>
> * 采用xacro4sdf可方便进行模块化建模，这些组件均采用模块结构，可参考对应的model.sdf.xacro。
> * 其他模型需要使用时，可以使用xacro4sdf进行include操作。

**rmua19_standard_robot模型** ：RoboMaster University AI Challenge 2019 标准步兵机器人

 * 模型图纸来自官方[RoboMaster产品/ 机器人 / AI 机器人](https://www.robomaster.com/zh-CN/products/components/detail/1839)资料，使用[xacro4sdf](https://github.com/gezp/xacro4sdf)进行SDF建模
 * 支持麦克拉姆轮地盘，使用[rmoss_ign](https://github.com/robomaster-oss/rmoss_ign)中的[麦克拉姆轮插件](https://github.com/robomaster-oss/rmoss_ign/tree/main/rmoss_ign_plugins/src/mecanum_drive)，支持里程计(模拟里程计，无nosie)
 * 支持云台（pitch,yaw）角度控制，使用Ignition官方插件`JointPositionController`
 * 具有装甲板灯条发光效果，可测试自瞄等识别算法。

**弹丸模型**

* rm_projectile_17mm，rm_projectile_42mm：比赛用17/42mm弹丸
* rm_fluorescent_projectile_17mm，rm_fluorescent_projectile_42mm：比赛用17/42mm荧光弹丸

## 2. 建模Tip

* 先使用SW，blender等3D建模工具进行建模，然后再把各个模块（依照可活动关节分离）导出STL或dea文件。
* 然后编写SDF文件（采用[xacro4sdf](https://github.com/gezp/xacro4sdf) 宏工具进行`模块化建模`）。

## 3.版权及维护者

* SDF xml file is provided under MIT License.
* The copyright of 3D model(.dea,.stl,etc) belongs to the orginal author.

maintanter：Zhenpeng Ge, zhenpeng.ge@qq.com


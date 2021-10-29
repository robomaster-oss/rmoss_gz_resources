# rmoss_ign_resources

rmoss_ign_resources为[rmoss_ign](https://github.com/robomaster-oss/rmoss_ign)项目中的RoboMaster Ignition Simulator提供公共基本模型资源，包括以下3种类型：

* 裁判系统模块组件：装甲板模块，枪口测速模块，指示灯模块等
* 标准射击弹丸：17mm荧光弹，42mm荧光弹
* 标准机器人：RoboMaster University AI Challenge2019标准步兵机器人模型

采用[xmacro](https://github.com/gezp/xmacro)方式定义了宏模块，可以方便的被复用。在机器人SDF模型模块化构建中，遵循`控制器分离原则`，即对于SDF模型，将3D模型部分与控制器（也就是插件）不耦合在一起，这样可以更换使用自己的控制器，使用更加灵活。

## 模型简介

#### 裁判系统组件

RoboMaster2021赛季裁判系统

* rm21_light_indicator_module（灯条模块）： `light_indicator`
* rm21_armor_module（装甲板模块）：`small_armor`, `large_armor`, `small_armor_with_support`, `large_armor_with_support`
* rm21_light_indicator_module（灯条指示模块）：`light_indicator` 
* rm21_speed_monitor_module（枪口测速模块）：`speed_monitor_17mm`, `speed_monitor_42mm`(TODO)

* rm21_video_transmitter_module（图传模块）：`video_transmitter` (TODO)

* rm21_rfid_interaction_module（RFID模块）：暂不考虑，需要等待Ignition Gazebo的支持。

RoboMaster2022赛季裁判系统

* rm22_armor_module, rm22_light_indicator_module, rm22_speed_monitor_module

> 对于RM2022赛季，裁判系统变化不大，但由于考虑到命名一致性，应使用`rm22_*`系列模块，使用方式不发生变化，即`xmacro_block`的name保持不变。


在xmacro文件中，可直接使用这些模块，在每一个模块下，都定义了一个使用样例`model.sdf.xmacro`可以参考。同时也可以使用多个模块，例如在`models/rmua19_standard_robot/rmua19_standard_robot.def.xmacro`中。

```xml
<!--首先需要include相应模块定义 -->
	<xmacro_include uri="model://rm21_armor_module/rm21_armor_module.def.xmacro" />
    <xmacro_include uri="model://rm21_light_indicator_module/rm21_light_indicator_module.def.xmacro" />
    <xmacro_include uri="model://rm21_speed_monitor_module/rm21_speed_monitor_module.def.xmacro" />       
<!--然后使用相应模块即可 -->
    <!--front armors -->
   <xmacro_block name="small_armor_with_support" suffix="_0" parent="chassis"  
            sticker_uri="${armor_sticker_map_uri}" pose="0.197 0 0.061 0 0 0"/>
    <!--left armors -->
    <xmacro_block name="small_armor_with_support" suffix="_1" parent="chassis" 
            sticker_uri="${armor_sticker_map_uri}" pose="0 0.116 0.061 0 0 1.5708"/>
    <!--rear armors -->
    <xmacro_block name="small_armor_with_support" suffix="_2" parent="chassis" 
            sticker_uri="${armor_sticker_map_uri}" pose="-0.197 0 0.061 0 0 3.14"/>
    <!--right armors -->
    <xmacro_block name="small_armor_with_support" suffix="_3" parent="chassis" 
            sticker_uri="${armor_sticker_map_uri}" pose="0 -0.116 0.061 0 0 -1.5708"/>
    <!--light_indicator-->
    <xmacro_block name="light_indicator" suffix="" parent="chassis" pose="-0.207 0 0.1 0 0 0"/>
    <!--speed_monitor_17mm-->
    <xmacro_block name="speed_monitor_17mm" suffix="" parent="gimbal_pitch" pose="0.07 0 0 0 0 0"/>
```

#### rmua19_standard_robot模型

RoboMaster University AI Challenge 2019 标准步兵机器人

 * 模型图纸来自官方[RoboMaster产品/ 机器人 / AI 机器人](https://www.robomaster.com/zh-CN/products/components/detail/1839)资料，使用[xmacro](https://github.com/gezp/xmacro) 进行SDF建模
 * 支持麦克拉姆轮地盘，使用[rmoss_ign](https://github.com/robomaster-oss/rmoss_ign)中的[麦克拉姆轮插件](https://github.com/robomaster-oss/rmoss_ign/tree/main/rmoss_ign_plugins/src/mecanum_drive2).
 * 支持云台（pitch,yaw）角度控制，使用Ignition官方插件`JointPositionController`.
 * 具有装甲板灯条发光效果，需使用插件，可测试自瞄等识别算法。

在标准机器人上可以加上自己的相机构建相应模块构建自己的机器人模型，例如

```xml
<sdf version="1.7">   
	<xmacro_include uri="model://rplidar_a2/model.sdf.xmacro" />
    <xmacro_include uri="model://industrial_camera/model.sdf.xmacro" />
    <xmacro_include uri="model://rmua19_standard_robot/rmua19_standard_robot.def.xmacro" />
	<xmacro_define_value name="global_armor_sticker_num1" value="model://rm21_armor_module/materials/textures/armor_sticker_num1.png" />
    <!--rmua19_standard_robot B model-->
    <model name="rmua19_standard_robot_b">
        <pose>0 0 0.15 0 0 0</pose>
        <xmacro_block name="rmua19_standard_robot" armor_sticker_map_uri="${armor_sticker_map_uri}"/>
        <!--rplidar a2-->
        <xmacro_block name="rplidar_a2" prefix="front_" parent="chassis" pose="0.155 0 0.1 0 0 0"
                update_rate="10" samples="400" visualize="true"/>
        <!--industrial camera-->
        <xmacro_block name="industrial_camera" prefix="front_" parent="gimbal_pitch" pose="0.1 0 0.045 0 0 0"
                            update_rate="30" horizontal_fov="1" width="640" height="480"/>
    </model>
</sdf>
```

* 这里只包含机器人3D模型，不包含控制插件，可自行选择合适的控制插件（如射击插件，麦轮插件，云台控制插件，灯条插件等）。

## 建模Tip

* 先使用SW，blender等3D建模工具进行建模，然后再把各个模块（依照可活动关节分离）导出STL或dea文件。
* 然后编写SDF文件（采用[xmacro](https://github.com/gezp/xmacro) 宏工具进行`模块化建模`），模块之间的相对位姿可以在建模工具中直接得到。
* 尽可能简化模型，对于碰撞形状，可采用简单元素，减小仿真计算量。

## 版权及维护者

* SDF xml file is provided under Apache License 2.0.
* The copyright of 3D model(.dea,.stl,etc) belongs to the orginal author.

maintanter：Zhenpeng Ge, zhenpeng.ge@qq.com


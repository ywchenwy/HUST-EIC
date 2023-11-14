- Model 文件夹内是线圈的初始建模，**model.m脚本直接运行即可**

- Space_Field 文件夹是求距离线圈不同距离的表面上的磁场分布
	- **Space_Field.m** 文件 可以通过更改**sampleRate** 可以改变取样点数，更改**xylen**可以更改相对应的要求的磁场的范围，**Space_Field.m脚本文件，运行即可**
	
	- **Coil_Field.m** 文件 其中**num**可以更改，比如将其改为1即可得到单个线圈的磁场
- Z_Field 文件夹是对Z轴上的磁场来进行分析和计算
	- **Zaxis_Field.m** 文件 可以修改z的范围获取轴不同范围的磁场强度，**Zaxis_Field.m脚本文件运行即可**

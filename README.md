# GuitarTUI

**GuitarTUI** is a user interface designed for guitar string sound tuning.

## User Instructions

**Step 1.** Chose the guitar string type at menu *string type*.

**Step 2.** Click *ImportSound* to input the sound (A sound sample file ->Sound Sample.wav is uploaded). What follows is a sound spectrogram. The frequency (calculated from the FFT) is shown in *input frequency*.

**Step 3.** Now you may need some force measuring equipment to measure the force on the guitar string (if not you can apply other methods :)), type the force value on the *output force* blank（Newton） 

**Step 4.** Click *getforce*, you may obatin ΔF, ΔL, Directions (CW -> clockwise || DW -> anti-clockwise), Turn number (rounds). 

**Step 5.** Click *outfile*，results obtained. 


Written by Shanzhou Diao ([Email](coder_vanir@163.com)), Editted by [Hanfeng Zhai](hanfengzhai.net).



***

# 中文版使用说明

**1.** 在下拉列表string type选中吉他弦型号.

**2.** 点击‘ImportSound’导入音频，此时出现频谱图，在input frequency出现通过傅里叶变换获得的频率。

**3.** 由于没有测力计，在‘output force’下方手动输入F（单位：N）

**4.** 点击getforce,可以获得ΔF、ΔL、Direction(转动方向，CW顺时针，DW逆时针)、Turn number(圈数)

**5.** 点击outfile，可以画图.

作者：刁山洲([邮件](coder_vanir@163.com))；翟晗锋负责修改，原始项目[智能钢琴调音设备探究与设计](http://gjcxcy.bjtu.edu.cn/NewLXItemListForStudentDetail.aspx?ItemNo=422368&year=2019&type=student)负责人。

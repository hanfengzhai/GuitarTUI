# GuitarTUI
**GuitarTUI** is a user interface designed for guitar string sound tuning.

## User Tutorial

1.在下拉列表string type选中吉他弦型号
2.点击‘ImportSound’导入音频，此时出现频谱图，在input frequency出现通过傅里叶变换获得的频率。
3.由于没有测力计，在‘output force’下方手动输入F（单位：N）
4.点击getforce,可以获得 $\Delta$ F、\delta L、Direction(转动方向，CW顺时针，DW逆时针)、Turn number(圈数)
5.点击outfile，可以画图

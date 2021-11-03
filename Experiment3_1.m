format compact
clc,clear,ep=1e-4;
fun=@(x) sin(x.^2)./x;  %被积函数定义，sin(x^2)/x,函数，非方程
[t,T]=Experiment3_Romberg(fun,ep,1,ep);%调用龙贝格求积函数，获得T表和积分结果
disp('龙贝格求积T表如下:');
digits(7);B=vpa(T);%T表中每个数据保留7位有效数字
disp(B);%输出保留7位有效数字的T表
y1=vpa(t);  %积分结果保留7位有效数字
y2=vpa(integral(fun,0,1));%作为精确值参考
disp('龙贝格求积公式求积结果:');
fprintf('%c', 8); %删除disp的换行
disp(y1);
disp('            精确值参考:');fprintf('%c', 8);
disp(y2);

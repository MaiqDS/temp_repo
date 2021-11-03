%实验1-1,文件名experiment1_1.m，绝对误差、误差限及有效数字位数
clc
format compact
x=223/71;  %得到的一个可当做精确值的近似值，x=355/113
fprintf('π的近似值取：%.13f\n',x);
%disp(['π的近似值取',num2str(x)]); %disp函数，另一种输出方法
%求绝对误差,理论上有正负，但一般只取正。
e=abs(x-pi);  %根据定义求绝对误差(理论上),其中圆周率用pi表示
fprintf('绝对误差e≈%.13f\n',e); %根据定义得到，注意绝对误差往往没有精确值
a=eval(vpa(e,6));   %四舍五入保留6位有效数字，并转为数值

 %求绝对误差的误差限，比绝对误差大，同时尽可能小
if a>=e
epsilon=a;
end
if a<e    %如果a的值小于e，则把最后一位增加1，保证大于e
   b=num2str(a,6);   %转为字符串，用于计算小数后最后一位的位数
   %找到是否有等于e或.的项
   if (isempty(find(b=='e',1))&&~isempty(find(b=='.',1)))%此处的e是科学计算法里的e
      weishu= length(b)-find(b=='.');
   end
   if(~isempty(find(b=='e',1))) %e+n(10^n)5
      ff=b(find(b=='e')+2:end); %从n后一位开始取
      str2num(ff);
      weishu=str2num(ff)+(find(b=='e')-3); %减去+ n .
   end
   if (isempty(find(b=='e',1))&&isempty(find(b=='.',1)))%无小数点和e，表明是整数
      weishu= 0;
   end
   epsilon=a+10^-weishu;  %将绝对误差近似值a的最后一位增加1，以保证大于绝对误差
end
fprintf('绝对误差限ε可取%.13f\n',epsilon);

%计算有效数字的位数
m=0;    %根据定义，填入m的取值
% m为从左到右第一个非0取值位数
%m=CalculateM(x);  %也可用函数实现计算m的值
n=m+1-fix(log10(2*e)); %有效数字位数n<=m+1-lg(2e),提示fix函数
disp(['有效数字位数是：',num2str(n)]);

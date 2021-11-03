function [t,T]=Experiment3_Romberg(fname,a,b,e)
% t=romberg(fname,a,b,e) fname 为被积函数,a,b为积分上下限,e为精度(默认值为1e-4)
format long
if nargin<4,e=1e-4;end
i=1;j=1;h=b-a;
T(i,1)=h/2*(fname(a)+fname(b)); %一个梯形面积的计算，即 
T(i+1,1)=T(i,1)/2+sum(feval(fname,a+h/2:b-h/2+0.001*h))*h/2;  %0.001*h,此处是为了避免在计算过程中取不到b-h/2点，因为计算是有误差的
T(i+1,j+1)=4^j*T(i+1,j)/(4^j-1)-T(i,j)/(4^j-1);
while abs(T(i+1,i+1)-T(i,i))>e
    i=i+1;h=h/2;
    T(i+1,1)=T(i,1)/2+sum(feval(fname,a+h/2:h:b-h/2+0.001*h))*h/2;
    for j=1:i
        T(i+1,j+1)=4^j*T(i+1,j)/(4^j-1)-T(i,j)/(4^j-1);%教材112页，公式4.11
    end
end
t=T(i+1,j+1);

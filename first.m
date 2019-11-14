function [img] = first(iH, iW)
img = zeros(iH, iW);
img = uint8(img);
% 设置图片的背景
img(:, :, 1)=255;
img(:, :, 2)=255;
img(:, :, 3)=255;
x=0:2*pi/(iW-1):2*pi;
% 给出y的函数表达式
redy=sin(x);
greeny=cos(x);
bluey=x.^2;
% 把x映射到图片的宽
x=int32(x/2/pi*iW);
% 把y映射到图片的高
redy=int32(iH/30*29-round(redy*iH/30));
greeny=int32(iH/30*29-round(greeny*iH/30));
bluey=int32(iH/30*29-round(bluey*iH/30));
% 遍历数据渲染图片
for i=1:iW
    if x(i)==0
        x(i)=x(i)+1;
    end
    if redy(i)>0 && redy(i)<=iH
        img(redy(i),x(i),2)=0;
        img(redy(i),x(i),3)=0;
    end
    if greeny(i)>0 && greeny(i)<=iH
        img(greeny(i),x(i),3)=0;
        img(greeny(i),x(i),1)=0;
    end
    if bluey(i)>0 && bluey(i)<=iH
        img(bluey(i),x(i),1)=0;
        img(bluey(i),x(i),2)=0;
    end
end
% 绘制黑色坐标轴
img(:,1,:)=0;
img(round(iH/30*29),:,:)=0;
imshow(img);
end
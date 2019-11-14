function [img] = first(iH, iW)
img = zeros(iH, iW);
img = uint8(img);
% ����ͼƬ�ı���
img(:, :, 1)=255;
img(:, :, 2)=255;
img(:, :, 3)=255;
x=0:2*pi/(iW-1):2*pi;
% ����y�ĺ������ʽ
redy=sin(x);
greeny=cos(x);
bluey=x.^2;
% ��xӳ�䵽ͼƬ�Ŀ�
x=int32(x/2/pi*iW);
% ��yӳ�䵽ͼƬ�ĸ�
redy=int32(iH/30*29-round(redy*iH/30));
greeny=int32(iH/30*29-round(greeny*iH/30));
bluey=int32(iH/30*29-round(bluey*iH/30));
% ����������ȾͼƬ
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
% ���ƺ�ɫ������
img(:,1,:)=0;
img(round(iH/30*29),:,:)=0;
imshow(img);
end
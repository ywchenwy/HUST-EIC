function [X,Y,Z] = R2xyz(R,Th,Ph)
% ������ϵ��ֱ������ϵת��

X = sin(Th)*cos(Ph)*R;
Y = sin(Th)*sin(Ph)*R;
Z = cos(Th)*R;

end

function [X,Y,Z] = R2xyz(R,Th,Ph)
% 球坐标系到直角坐标系转化

X = sin(Th)*cos(Ph)*R;
Y = sin(Th)*sin(Ph)*R;
Z = cos(Th)*R;

end

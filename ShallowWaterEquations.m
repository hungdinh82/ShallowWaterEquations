clf;
clear all;
% define the grid s = 50 size
n=100;
dt = 0.05;
dx = 1;
dy = 1;
g = 9.8;
U = ones(n+2,n+2); % displacement matrix (this is what gets drawn)
F = zeros(n+2,n+2); % x velocity
G = zeros(n+2,n+2); % y velocity
% draw the mesh
grid = surf(U);
axis([1 n 1 n 0.5 3]);
hold all;
% create initial displacement
[x,y] = meshgrid( linspace(-3,3,10) );
R = sqrt(x.^2 + y.^2) + eps;
Z = (sin(R)./R);
Z = max(Z,0);
R2 = sqrt(x.^2 + y.^2) + eps;
Z2 = (sin(R2)./R2);
Z2 = max(Z2,0);
% add displacement to the height matrix
w = size(Z,1);
i = 40:w+39;
j = 40:w+39;
U(i,j) = U(i,j) + Z;
w2 = size(Z2,1);
i2 = 10:w2+9;
j2 = 10:w2+9;
U(i2,j2) = U(i2,j2) + Z2;
% empty matrix for half-step calculations
Ux = zeros(n+1,n+1);
Uy = zeros(n+1,n+1);
Fx = zeros(n+1,n+1);
Fy = zeros(n+1,n+1);
Gx = zeros(n+1,n+1);
Gy = zeros(n+1,n+1);
while 1==1
 % redraw the mesh
 set(grid, 'zdata', U);
 drawnow
 % blending the edges keeps the function stable
 U(:,1) = U(:,2);
 U(:,n+2) = U(:,n+1);
 U(1,:) = U(2,:);
 U(n+2,:) = U(n+1,:);

 % reverse direction at the x edges
 F(1,:) = -F(2,:);
 F(n+2,:) = -F(n+1,:);

 % reverse direction at the y edges
 G(:,1) = -G(:,2);
 G(:,n+2) = -G(:,n+1);

 % First half step
 i = 1:n+1;
 j = 1:n+1;

 % height
 Ux(i,j) = (U(i+1,j+1)+U(i,j+1))/2 - dt/(2*dx)*(F(i+1,j+1)-F(i,j+1));
 Uy(i,j) = (U(i+1,j+1)+U(i+1,j))/2 - dt/(2*dy)*(G(i+1,j+1)-G(i+1,j));

 % x momentum

 Fx(i,j) = (F(i+1,j+1)+F(i,j+1))/2 - ...
 dt/(2*dx)*( F(i+1,j+1).^2./U(i+1,j+1) - F(i,j+1).^2./U(i,j+1) + ...
 g/2*U(i+1,j+1).^2 - g/2*U(i,j+1).^2 ...
 );

 Fy(i,j) = (F(i+1,j+1)+F(i+1,j))/2 - ...
 dt/(2*dy)*( (G(i+1,j+1).*F(i+1,j+1)./U(i+1,j+1)) - (G(i+1,j).*F(i+1,j)./U(i+1,j)) );

 % y momentum
 Gx(i,j) = (G(i+1,j+1)+G(i,j+1))/2 - ...
 dt/(2*dx)*((F(i+1,j+1).*G(i+1,j+1)./U(i+1,j+1)) - ...
 (F(i,j+1).*G(i,j+1)./U(i,j+1)));

 Gy(i,j) = (G(i+1,j+1)+G(i+1,j))/2 - ...
 dt/(2*dy)*((G(i+1,j+1).^2./U(i+1,j+1) + g/2*G(i+1,j+1).^2) - ...
 (G(i+1,j).^2./U(i+1,j) + g/2*U(i+1,j).^2));
 % Second half step
 i = 2:n+1;
 j = 2:n+1;
 % height
 U(i,j) = U(i,j) - (dt/dx)*(Fx(i,j-1)-Fx(i-1,j-1)) - ...
 (dt/dy)*(Gy(i-1,j)-Gy(i-1,j-1));
 % x momentum
 F(i,j) = F(i,j) - (dt/dx)*((Fx(i,j-1).^2./Ux(i,j-1) + g/2*Ux(i,j-1).^2) - ...
 (Fx(i-1,j-1).^2./Ux(i-1,j-1) + g/2*Ux(i-1,j-1).^2)) ...
 - (dt/dy)*((Gy(i-1,j).*Fy(i-1,j)./Uy(i-1,j)) - ...
 (Gy(i-1,j-1).*Fy(i-1,j-1)./Uy(i-1,j-1)));
 % y momentum
 G(i,j) = G(i,j) - (dt/dx)*((Fx(i,j-1).*Gx(i,j-1)./Ux(i,j-1)) - ...
 (Fx(i-1,j-1).*Gx(i-1,j-1)./Ux(i-1,j-1))) ...
 - (dt/dy)*((Gy(i-1,j).^2./Uy(i-1,j) + g/2*Uy(i-1,j).^2) - ...
 (Gy(i-1,j-1).^2./Uy(i-1,j-1) + g/2*Uy(i-1,j-1).^2));
end

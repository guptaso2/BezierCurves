function plot_curve(Px, Py, Dx, Dy)
    
    N = length(Px);
    
    controlX = zeros(N, 4);
    controlY = zeros(N, 4);
    
    % initialize start and end points
    controlX(1,1) = Px(1);
    controlX(1,2) = Dx(1);
    controlX(1,3) = Dx(1)/2 + Dx(2)/2;
    controlX(1,4) = Px(2);

    controlY(1,1) = Py(1);
    controlY(1,2) = Dy(1);
    controlY(1,3) = Dy(1)/2 + Dy(2)/2;
    controlY(1,4) = Py(2);
    
    % plot the beginning!
    Funct_Bezier(controlX(1,:),controlY(1,:),100);
    
    controlX(N,1) = Px(N-1);
    controlX(N,2) = Dx(N-1)/2 + Dx(N)/2;
    controlX(N,3) = Dx(N);
    controlX(N,4) = Px(N);

    controlY(N,1) = Py(N-1);
    controlY(N,2) = Dy(N-1)/2 + Dy(N)/2;
    controlY(N,3) = Dy(N);
    controlY(N,4) = Py(N);
    
    % plot the end!
    Funct_Bezier(controlX(N,:),controlY(N,:),100);

    
    for i = 3:N-1
        controlX(i,1) = Px(i-1);
        controlX(i,2) = (2/3)*Dx(i-1) + (1/3)*Dx(i);
        controlX(i,3) = (1/3)*Dx(i-1) + (2/3)*Dx(i);
        controlX(i,4) = Px(i);
        
        controlY(i,1) = Py(i-1);
        controlY(i,2) = (2/3)*Dy(i-1) + (1/3)*Dy(i);
        controlY(i,3) = (1/3)*Dy(i-1) + (2/3)*Dy(i);
        controlY(i,4) = Py(i);
        
        Funct_Bezier(controlX(i,:),controlY(i,:),100);
    end
        
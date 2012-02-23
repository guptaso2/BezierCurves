function [dPoints] = nokEC(coords)
    num_points = length(coords);
    dimSize = num_points - 4
    
    A = sign(conv2(eye(dimSize),ones(2),'same')) + diag(3*ones(1,dimSize));
    sol2 = 6*coords(3) + coords(1)/6 - (4/3)*coords(2) + coords(3)/6;
    soln_2 = 6*coords(num_points-2) + coords(num_points-2)/6 - (4/3)*coords(num_points-1) + coords(num_points)/6;
    B = [sol2 6*coords(4:num_points-3) soln_2];
    
    dPoints = (B/A);
    d0 = (7/18)*coords(1) + (8/9)*coords(2) + (7/18)*coords(3) - (2/3)*dPoints(1);
    d1 = (-1/6)*coords(1) + (4/3)*coords(2) - coords(3)/6;
    dn_1 = (-1/6)*coords(num_points-2) + (4/3)*coords(num_points-1) - coords(num_points)/6;
    dn = (7/18)*coords(num_points-2) + (8/9)*coords(num_points-1) + (7/18)*coords(num_points) - (2/3)*dPoints(length(dPoints));
    dPoints = [d0 d1 dPoints dn_1 dn];
function [dPoints] = naturalEC(coords)
    num_points = length(coords);
    dimSize = num_points - 2;
    
    A = sign(conv2(eye(dimSize),ones(2),'same')) + diag(3*ones(1,dimSize));
    B = [(6*coords(2)-coords(1)) 6*coords(3:num_points-2) (6*coords(num_points-1) - coords(num_points))];
    
    dPoints = (B/A);
    d0 = (2/3)*coords(1) + (1/3)*dPoints(1);
    dn = (1/3)*dPoints(length(dPoints)) + (2/3)*coords(num_points);
    dPoints = [d0 dPoints dn];
    
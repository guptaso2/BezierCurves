function [dPoints] = quadEC(coords)
    num_points = length(coords);
    dimSize = num_points - 2;
    
    A = sign(conv2(eye(dimSize),ones(2),'same')) + diag([4 3*ones(1,dimSize-2) 4]);
    B = [(7*coords(2)-coords(1)) 6*coords(3:num_points-2) (7*coords(num_points-1) - coords(num_points))];
    
    dPoints = (B/A);
    d0 = dPoints(1) + (2/3)*coords(1) - (2/3)*coords(2);
    dn = dPoints(length(dPoints)) + (2/3)*coords(num_points) - (2/3)*coords(num_points-1);
    dPoints = [d0 dPoints dn];
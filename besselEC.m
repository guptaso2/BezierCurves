function [dPoints] = besselEC(coords)
    num_points = length(coords);
    dimSize = num_points - 2;
    
    d0 = coords(1)/2 + (coords(2) + (coords(2) - coords(3))/3)/2;
    dn = (coords(num_points-1) + (coords(num_points-1) - coords(num_points-2))/3)/2 + coords(num_points)/2;
    
    A = sign(conv2(eye(dimSize),ones(2),'same')) + diag([(7/2 -1 ) 3*ones(1,dimSize-2) (7/2 - 1)]);
    B = [(6*coords(2) - 3*d0/2)  6*coords(3:num_points-2) (6*coords(num_points-1) - 3*dn/2)];
    
    dPoints = (B/A);
    dPoints = [d0 dPoints dn];

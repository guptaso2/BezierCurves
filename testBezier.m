function testBezier
    Xcoord = [1 2 3 4 5 5];
    Ycoord = [1 1 5 6 10 3];
    
    dX = naturalEC(Xcoord);
    dY = naturalEC(Ycoord);
    
    subplot(2,2,1)
    plot_curve(Xcoord, Ycoord, dX, dY);
    title('Natural End Condition');

    dX = quadEC(Xcoord);
    dY = quadEC(Ycoord);
    
    subplot(2,2,2)
    plot_curve(Xcoord, Ycoord, dX, dY);
    title('Quadratic End Condition')
    
    dX = nokEC(Xcoord);
    dY = nokEC(Ycoord);
    
    subplot(2,2,3)
    plot_curve(Xcoord, Ycoord, dX, dY);
    title('Not a Knot End Condition');
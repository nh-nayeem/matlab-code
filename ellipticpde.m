function Laplace_gauss
    tic
    Nx=5; 
    Ny=5; 
    tol=1E-6;
    err=1; 
    k=0; 
    u=[50 100 100 100 50
           0 0 0 0 0
           0 0 0 0 0
           0 0 0 0 0
           0 0 0 0 0];
       v=u;
    ukpl=u;
    fprintf('Standard five point: \n' );
    fprintf('  k  |')
    for j=1:Ny-2
        for i=1:Nx-2
            fprintf(' u(%1i,%1i)  |',j,i)
        end
    end
    fprintf(' error\n')
    while err>tol
        k=k+1;
        fprintf('%4i |',k)
        for j=2:Ny-1
            u=ukpl;
            for i=2:Nx-1
                ukpl(j,i)=0.25*(u(j+1,i)+u(j,i+1)+u(j-1,i)+u(j,i-1));
                fprintf('%8.6f  |', ukpl(j,i))
            end
        end
        err=sqrt(sum(sum(ukpl-u).^2));
        fprintf('% 8.6f \n', err)
           
    end
    figure(1)
    surfc(u)
    figure(2)
    mesh(u)
    xlabel('X'); ylabel('Y'); zlabel('T')
    
    figure(3)
    contour(u)
    xlabel('X'); ylabel('Y');
    
    tol=1E-6;
    err=1; 
    k=0;
    vkpl=v;
    fprintf('Diagonal five point: \n');
    fprintf('  k  |')
    for j=1:Ny-2
        for i=1:Nx-2
            fprintf(' u(%1i,%1i)  |',j,i)
        end
    end
    fprintf(' error\n')
    while err>tol
        k=k+1;
        fprintf('%4i |',k)
        for j=2:Ny-1
            v=vkpl;
            for i=2:Nx-1
                vkpl(j,i)=0.25*(v(j+1,i-1)+v(j+1,i+1)+v(j-1,i-1)+v(j-1,i+1));
                fprintf('%8.6f  |', vkpl(j,i))
            end
        end
        err=sqrt(sum(sum(vkpl-v).^2));
        fprintf('% 8.6f \n', err)
           
    end
    figure(4)
    surfc(v)
    figure(5)
    mesh(v)
    xlabel('X'); ylabel('Y'); zlabel('T')
    
    figure(6)
    contour(v)
    
    xlabel('X'); ylabel('Y');
    
    toc
end

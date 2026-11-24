function d = lab_figdir(folder)
    if isdir(folder + "../report") then
        d = folder + "../report/figures/";
    else
        d = folder + "figures/";
    end
    if ~isdir(d) then
        mkdir(d);
    end
endfunction

function lab_plot(id,n,S,titles,d,name)
    scf(id); clf();
    f = gcf();
    m = size(S,1);
    f.figure_size = [850, max(460, 300*m)];
    for k = 1:m
        if m > 1 then
            subplot(m,1,k);
        end
        s = S(k,:);
        lo = min([0 s]); hi = max([0 s]);
        pad = max(0.2, 0.1*(hi-lo));
        plot2d(n',s',style=-4,rect=[min(n)-1,lo-pad,max(n)+1,hi+pad]);
        for j = 1:length(n)
            xpoly([n(j),n(j)],[0,s(j)]);
        end
        xgrid();
        xtitle(titles(k),"n","Amplitude");
    end
    drawnow();
    xs2png(f,d+name);
endfunction

function lab_check(a,b,name)
    e = max(abs(a-b));
    tol = 1e-8*max([1 abs(matrix(b,1,-1))]);
    if e > tol then
        error(msprintf("FAIL %s: %.12g",name,e));
    end
    mprintf("PASS %s, max error = %.3e\n",name,e);
endfunction

function y = lab_rec(x,b,a,initial)
    // a(1) = 1; initial = [y(-1), y(-2), ...]
    y = zeros(1,length(x));
    for k = 1:length(x)
        v = 0;
        for j = 1:length(b)
            if k-j+1 >= 1 then
                v = v+b(j)*x(k-j+1);
            end
        end
        for j = 2:length(a)
            idx = k-j+1;
            if idx >= 1 then
                v = v-a(j)*y(idx);
            else
                v = v-a(j)*initial(1-idx);
            end
        end
        y(k) = v;
    end
endfunction

function y = lab_conv(x,h)
    y = zeros(1,length(x)+length(h)-1);
    for k = 1:length(x)
        for j = 1:length(h)
            y(k+j-1) = y(k+j-1)+x(k)*h(j);
        end
    end
endfunction

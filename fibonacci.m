function f = fibonacci(x)
f = zeros(1,x);
for i=1:x
    if i == 1
        f(i) = 0;
    else if i == 2
            f(i) = 1;
        else if i == 3
                f(i) = 1;
            else
                f(i) = f(i-1)+f(i-2);
            end
        end
    end
end
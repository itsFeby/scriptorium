% File ini untuk GNU Octave

f = @(x) x^3 - x - 2;
a = 1;
b = 2;
tol = 1e-5;
max_iter = 100;

for i = 1:max_iter
    c = (a + b) / 2;
    if abs(f(c)) < tol
        break;
    elseif f(a) * f(c) < 0
        b = c;
    else
        a = c;
    end
end

fprintf("Akar mendekati: %.5f\n", c);

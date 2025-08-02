# heat_equation_1d.jl
using DifferentialEquations, Plots

# Definisi PDE: ∂u/∂t = α ∂²u/∂x²
function heat_equation!(du, u, p, t)
    α, dx = p
    N = length(u)
    for i in 2:N-1
        du[i] = α * (u[i+1] - 2u[i] + u[i-1]) / dx^2
    end
    du[1] = du[end] = 0  # Syarat batas Neumann (∂u/∂x = 0)
end

# Parameter simulasi
α = 0.1       # Koefisien difusivitas
L = 10.0      # Panjang domain
N = 100       # Jumlah grid
dx = L / N    # Spasi grid
x = range(0, L, length=N)
u0 = exp.(-(x .- L/2).^2)  # Kondisi awal: Gaussian peak di tengah

# Solusi numerik
tspan = (0.0, 5.0)  # Waktu simulasi
p = (α, dx)
prob = ODEProblem(heat_equation!, u0, tspan, p)
sol = solve(prob, Tsit5(), saveat=0.1)

# Animasi hasil
anim = @animate for t in 0:0.1:tspan[2]
    plot(x, sol(t), title="Persamaan Panas 1D (t = $(round(t, digits=1))", 
         xlabel="Posisi (x)", ylabel="Suhu (u)", label="", ylims=(0, 1), lw=2)
end
gif(anim, "heat_equation_1d.gif", fps=10)

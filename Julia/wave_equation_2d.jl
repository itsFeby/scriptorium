# wave_equation_2d.jl
using DifferentialEquations, Plots

# Definisi PDE: ∂²u/∂t² = c²(∂²u/∂x² + ∂²u/∂y²)
function wave_equation!(du, u, p, t)
    c, dx, dy = p
    Nx, Ny = size(u)
    for i in 2:Nx-1, j in 2:Ny-1
        du[i,j] = c^2 * (
            (u[i+1,j] - 2u[i,j] + u[i-1,j])/dx^2 +
            (u[i,j+1] - 2u[i,j] + u[i,j-1])/dy^2
        )
    end
end

# Parameter simulasi
c = 1.0       # Kecepatan gelombang
Lx, Ly = 10.0, 10.0  # Dimensi domain
Nx, Ny = 50, 50      # Jumlah grid
dx, dy = Lx/Nx, Ly/Ny
u0 = zeros(Nx, Ny)
u0[Nx÷2, Ny÷2] = 1.0  # Pulsa awal di tengah domain

# Solusi numerik
tspan = (0.0, 5.0)
p = (c, dx, dy)
prob = ODEProblem(wave_equation!, u0, tspan, p)
sol = solve(prob, Tsit5(), saveat=0.5)

# Plot hasil di t = 5.0
heatmap(sol(5.0), title="Persamaan Gelombang 2D (t = 5)", 
       xlabel="x", ylabel="y", c=:viridis)
savefig("wave_equation_2d.png")

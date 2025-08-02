# 1D Heat Equation Simulation

A numerical solution to the partial differential equation (PDE) describing heat diffusion in a 1D medium using Julia.

## 📌 Description

### Theoretical Background
The 1D Heat Equation is a partial differential equation (PDE) that describes how heat (or temperature distribution) propagates through a one-dimensional medium (e.g., a thin rod) over time. This equation serves as a fundamental example of diffusion equations with wide applications in physics, engineering, and applied mathematics.

### Mathematical Formulation
\[
\frac{\partial u}{\partial t} = \alpha \frac{\partial^2 u}{\partial x^2}
\]

**Variables:**
- \( u(x,t) \): Temperature at position \( x \) and time \( t \)
- \( \alpha \): Thermal diffusivity coefficient (determines heat propagation speed)
- \( x \): Position in 1D domain (\( 0 \leq x \leq L \))
- \( t \): Time

**Derivatives:**
- \( \frac{\partial u}{\partial t} \): Temperature change over time
- \( \frac{\partial^2 u}{\partial x^2} \): Second spatial derivative (rate of temperature gradient change)

### Physical Interpretation
- **Heat Diffusion**: Heat flows from high to low temperature regions
- **Fourier's Law**: Derived from \( q = -k \frac{\partial u}{\partial x} \) (q = heat flux, k = thermal conductivity)

### Boundary Conditions
1. **Initial Condition**:
   \[
   u(x,0) = f(x) \quad \text{(e.g., } f(x) = e^{-(x-L/2)^2} \text{)}
   \]
2. **Boundary Conditions**:
   - Dirichlet: Fixed temperature (e.g., \( u(0,t) = 0 \))
   - Neumann: Zero flux (e.g., \( \frac{\partial u}{\partial x}\big|_{x=0} = 0 \)) - used in this simulation

## 📋 Prerequisites
- [Julia](https://julialang.org/download/) (version ≥ 1.6)
- Required packages:
  ```julia
  ] add DifferentialEquations Plots

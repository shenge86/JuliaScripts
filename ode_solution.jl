# ============================================================
#  Solving dy/dt = -1000y + 3000 - 2000*exp(-t),  y(0) = 0
#
#  Analytical solution:
#    y(t) = 3 - (2000/999)*exp(-t) - (997/999)*exp(-1000t)
#
#  We also solve numerically with DifferentialEquations.jl
#  using a stiff-aware solver (Rodas5), then compare both.
# ============================================================

using DifferentialEquations
using Plots

# ----------------------------------------------------------
# 1. Define the ODE right-hand side
# ----------------------------------------------------------
function ode!(du, u, p, t)
    du[1] = -1000*u[1] + 3000 - 2000*exp(-t)
end

# ----------------------------------------------------------
# 2. Set up and solve numerically
#    Rodas5 is an excellent stiff solver (5th-order Rosenbrock)
# ----------------------------------------------------------
u0    = [0.0]           # initial condition y(0) = 0
tspan = (0.0, 0.01)     # transient dies out very fast (rates 1 and 1000)
prob  = ODEProblem(ode!, u0, tspan)
sol   = solve(prob, Rodas5(), reltol=1e-10, abstol=1e-12)

# ----------------------------------------------------------
# 3. Analytical solution
# ----------------------------------------------------------
y_exact(t) = 3.0 - (2000/999)*exp(-t) - (997/999)*exp(-1000*t)

# Dense time grid for a smooth analytical curve
t_dense  = range(0.0, 0.01, length=1000)
y_dense  = y_exact.(t_dense)

# ----------------------------------------------------------
# 4. Plot
# ----------------------------------------------------------
p1 = plot(
    t_dense, y_dense,
    label  = "Analytical y(t)",
    lw     = 2.5,
    color  = :royalblue,
    xlabel = "t",
    ylabel = "y(t)",
    title  = "dy/dt = -1000y + 3000 - 2000·exp(-t),   y(0) = 0",
    legend = :bottomright,
    grid   = true,
    framestyle = :box,
)

plot!(p1,
    sol.t, first.(sol.u),
    label      = "Numerical (Rodas5)",
    lw         = 1.5,
    linestyle  = :dash,
    color      = :crimson,
    markershape = :circle,
    markersize  = 3,
)

hline!(p1, [3.0],
    label     = "Steady state y = 3",
    lw        = 1.2,
    linestyle = :dot,
    color     = :gray40,
)

# ----------------------------------------------------------
# 5. Zoom-in: show the ultra-fast initial transient
# ----------------------------------------------------------
t_zoom  = range(0.0, 0.002, length=500)
y_zoom  = y_exact.(t_zoom)

p2 = plot(
    t_zoom, y_zoom,
    label  = "Analytical (zoomed)",
    lw     = 2.5,
    color  = :royalblue,
    xlabel = "t",
    ylabel = "y(t)",
    title  = "Initial transient (t ∈ [0, 0.002])",
    legend = :bottomright,
    grid   = true,
    framestyle = :box,
)

hline!(p2, [3.0],
    label     = "Steady state y = 3",
    lw        = 1.2,
    linestyle = :dot,
    color     = :gray40,
)

# ----------------------------------------------------------
# 6. Combine and save
# ----------------------------------------------------------
fig = plot(p1, p2, layout = (2, 1), size = (800, 700), dpi = 150)
savefig(fig, "ode_solution.png")

println("Plot saved to ode_solution.png")
println()
println("Verification — exact solution at selected points:")
println("  y(0)     = ", round(y_exact(0.0),     digits=8), "  (should be 0)")
println("  y(0.001) = ", round(y_exact(0.001),   digits=8))
println("  y(0.005) = ", round(y_exact(0.005),   digits=8))
println("  y(0.01)  = ", round(y_exact(0.01),    digits=8))
println("  y(∞) ≈   ", round(y_exact(1.0),      digits=8), "  (→ 3)")

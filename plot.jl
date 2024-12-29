using Plots



function my_function(x)

   return x^2

end



x_vals = range(-2, 2, length=100)

y_vals = my_function.(x_vals)

display(plot(x_vals, y_vals, title="Plot of x^2"))
#savefig("myplot.png")
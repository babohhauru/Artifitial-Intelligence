library(FuzzyR)
library(shiny)
fis <- newfis('final.fis')

# Adds an input or output variable to a fis object.
fis <- addvar(fis, 'input', 'T', c(35, 42))
fis <- addvar(fis, 'input', 'H', c(0, 10))
fis <- addvar(fis, 'output', 'U', c(0, 100))  

# Adds a membership function input 1 : T
fis <- addmf(fis, 'input', 1, 'low', 'trapmf', c(35.0,35.0,36.5,36.5))
fis <- addmf(fis, 'input', 1, 'normal', 'trapmf', c(36.5,36.5,37.5,37.5))
fis <- addmf(fis, 'input', 1, 'high', 'trapmf', c(37.5,37.5,42.0,42.0))


# Adds a membership function input 2 : H
fis <- addmf(fis, 'input', 2, 'very mild', 'gaussmf', c(1.0, 0.0))
fis <- addmf(fis, 'input', 2, 'mild', 'gaussmf', c(0.6, 3.0))
fis <- addmf(fis, 'input', 2, 'moderate', 'gaussmf', c(0.5, 5.0))
fis <- addmf(fis, 'input', 2, 'severe', 'gaussmf', c(0.6, 7.0))
fis <- addmf(fis, 'input', 2, 'very severe', 'gaussmf', c(1.0, 10.0))

# Adds a membership function output : U
fis <- addmf(fis, 'output', 1, 'very low', 'gaussmf', c(10.0, 0.0))
fis <- addmf(fis, 'output', 1, 'low', 'gaussmf', c(5.0, 20.0))
fis <- addmf(fis, 'output', 1, 'medium', 'gaussmf', c(10.0, 50.0))
fis <- addmf(fis, 'output', 1, 'emergency', 'gaussmf', c(5.0, 80.0))
fis <- addmf(fis, 'output', 1, 'top emergency', 'gaussmf', c(10.0, 100.0))

# Adds a rule to a fis object.
rl <- rbind(c(1,1,2,1,1),c(1,2,3,1,1), c(1,3,4,1,1),c(1,4,5,1,1),c(1,5,5,1,1),
            c(2,1,1,1,1),c(2,2,1,1,1),c(2,3,3,1,1),c(2,4,3,1,1),c(2,5,4,1,1),
            c(3,1,3,1,1),c(3,2,3,1,1),c(3,3,3,1,1),c(3,4,5,1,1),c(3,5,5,1,1))
fis <- addrule(fis, rl)

writefis(fis, fileName = "final.fis")
# Show a GUI to display MFs plots for input and output, rules and evaluate the fis.
showGUI(fis)

import nigui      
import std/strutils   
import hydro

# Basic app settings
let applicationName = "Der Hydrator"
let appWidth = 500
let appHeight = 250
#let wIconPath = "flour.ico"

# INITIALIZE THE APPLICATION
app.init()


# Create a window with a title that appears in the title bar
var window = newWindow(applicationName)
# Set the window size (scaleToDpi adjusts for high-DPI displays)
window.width = appWidth.scaleToDpi
window.height = appHeight.scaleToDpi
# Set window icon TODO: doesnt work unless the ico is next to the file!
# window.iconPath=wIconPath


# CREATE A LAYOUT CONTAINER
# In NiGui, you can't add widgets directly to the window.
# You need a container first. Layout_Vertical stacks widgets vertically.
# (Use Layout_Horizontal if you want widgets side-by-side)
var container = newLayoutContainer(Layout_Vertical)
# Add the container to the window - this is required!
window.add(container)

# Creating Labels and text boxes
## Mehl
var label1 = newLabel("Mehl in Gramm:")
container.add(label1)  # Add it to the container

var mehlTextBox = newTextBox()
mehlTextBox.text = "0"  # Set a default value
container.add(mehlTextBox)  # Add it to the container
## Wasser
var label2 = newLabel("Wasser in Gramm (oder ml):")
container.add(label2) 

var wasserTextBox = newTextBox()
wasserTextBox.text = "0"  
container.add(wasserTextBox)  
## Hydration
var label3 = newLabel("Hydration in Prozent")
container.add(label3)
var HydrationTextBox = newTextBox()
HydrationTextBox.text="0"
container.add(HydrationTextBox)

# Buttons
## horizontal container for the buttons
var horizontalcontainer = newLayoutContainer(Layout_Horizontal)
## actual buttons
var wasserButton = newButton("Wasser berechnen")
var mehlButton = newButton("Mehl berechnen")
var HydrationButton = newButton("Hydration berechnen")

## adding them with a loop this time
for button in [mehlButton,wasserButton,HydrationButton]:
    horizontalcontainer.add(button)

container.add(horizontalcontainer)

# error label
# Add label for input error warnings
var errorField = newLabel()
container.add(errorField)

# report generic error message
proc reportError() =
  errorField.text = "Achtung, nur natürliche Zahlen erlaubt!"

# Gesamtmenge berechnen:
proc masseGesamt():int =
  parseInt(wasserTextBox.text) + parseInt(mehlTextBox.text)

# clear error on successful calc and replace with total mass info
proc clearError() =
  errorField.text = "Gesamte Masse (Mehl + Wasser) = " & $masseGesamt() & "g"




# making it functional:
wasserButton.onClick= proc(event: ClickEvent) =
  try:
    wasserTextBox.text = $wasserRechnung(parseInt(mehlTextBox.text), parseInt(HydrationTextBox.text))
    clearError()
  except:
    reportError()

HydrationButton.onClick = proc(event: ClickEvent) =
  try:
    HydrationTextBox.text =  $hydration(parseInt(wasserTextBox.text), parseInt(mehlTextBox.text))
    clearError()
  except:
    reportError()

mehlButton.onClick = proc(event: ClickEvent) =
  try:
    mehlTextBox.text = $mehlrechnung(parseInt(wasserTextBox.text), parseInt(HydrationTextBox.text))
    clearError()
  except:
    reportError()



# SHOW THE WINDOW AND START THE APPLICATION
# Make the window visible on screen
window.show()
# Start the event loop - this keeps the app running and responsive
# The program will stay here until the window is closed
app.run()
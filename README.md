# PSU_Trendline
Powershell Universal Trend Line custom component based on react-trend


## What parameters did you add?

  So here is the function which runs this component, and from this you will be able to see all the parameters I included for this component, and what they do, as I have added a comment-line to each parameter.  I also advise you reading the npmjs page for this component as that is the official page if any of these parameters should not make sense.

## Parameters Used

```
function New-UDTrendLine {
    param(
        [Parameter()]
        [string]$Id = (New-Guid).ToString(), #Allows you to specify an ID for the component
        [Parameter()]
        [switch]$Smooth, #Switch to defines if the trendline should be smooth or have points
        [Parameter()]
        [switch]$AutoDraw, #Switch needs to be included to animated the trendline
        [Parameter()]
        [int]$Duration, #Integer value in milliseconds to define animation length 3000 = 3seconds
        [Parameter()]
        [ValidateSet('linear','ease','ease-in','ease-out','ease-in-out','step-start','step-end')]
        [string]$AnimationType = 'ease-out', #A validated choice set of animations
        [Parameter(Mandatory = $true)]
        [array]$Data, #This parameter is mandatory and is an array of numbers
        [Parameter()]
        [array]$Gradient = @('#f72047', '#ffd200', '#1feaea'), #Colours for your trendline
        [Parameter()]
        [decimal]$Radius = 12.3, #A decimal value to specify the radius
        [Parameter()]
        [decimal]$StrokeWidth = 2.2, #A decimal value to specify the width of the trendline stroke
        [Parameter()]
        [ValidateSet('butt','square','round')]
        [string]$StrokeEnd = 'square' #Validated set of how the end of the trendlines should look
    )

```

## So how do I use it in my dashboard?

Here is some demo code to show this working in a PSU dashboard
```
New-UDTrendLine -ID "TRENDLINE" -AutoDraw -Radius 4.5 -StrokeWidth 1.1 -Duration 5000 -Data @(3,33,4,45,7,77,5,34) -Gradient @('purple', 'violet')

```
![placeholder](https://raw.githubusercontent.com/psDevUK/ud-flix/master/assets/img/tl1.PNG "Demo")

The nice thing about this component is it accepts, both named colours, and HTML colour codes.  The other nice thing about this component is it looks great in either light or dark themed dashboards. 

![placeholder](https://raw.githubusercontent.com/psDevUK/ud-flix/master/assets/img/t2.PNG "Demo2")


Or to use the same **-data** but different parameters to get a totally different look:-

```
New-UDTrendLine -ID "TRENDLINE" -AutoDraw -Smooth -StrokeWidth 2.1 -Duration 5000 -Data @(3,33,4,45,7,77,5,34)
```
![placeholder](https://raw.githubusercontent.com/psDevUK/ud-flix/master/assets/img/t3.PNG "Demo3")

Once again this same **data** trendline looks great in either light or dark mode

![placeholder](https://raw.githubusercontent.com/psDevUK/ud-flix/master/assets/img/t4.PNG "Demo4")

 It's simple but has a really nice effect on the page, and automatically resizes to the page width, I did not include the height and width parameters for this component, as mentioned on the component page, you can control this by the size of the container you put it in.  As in you create a new coloumn choose the size of that column and nest the component inside that. 
  I am personally thinking about using this trendline component to display the amount of times the user has actually visited the dashboard, as I think that would be a nice feature to add to any dashbaord. 
   

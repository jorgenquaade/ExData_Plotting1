## plot 1 script including reading in and subsetting the data

## Read in the full dataset and have a look at it.

household_power_consumption <- read.csv("~/DataScience/Exploratory/assignment1/household_power_consumption.txt",
                                        sep=";", na.strings="?")
View(household_power_consumption)

## convert Date column from factor to date

household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")


## Subsetting

hpc <- subset( household_power_consumption, household_power_consumption$Date >= as.Date("2007-02-01")
               &  household_power_consumption$Date <= as.Date("2007-02-02") )

## Convert the time column from factor to time

hpc$Time <- strptime(hpc$Time, format = "%H:%M:%S")

View(hpc)

## "main" refer to the title of the plot and "xlab" to the label on the x-axis.

hist(hpc$Global_active_power, col = 'red', main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Copying it to a file

dev.copy(png, file = "plot1.png")

## And remembering to close the file

dev.off()


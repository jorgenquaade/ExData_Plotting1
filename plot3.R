## plot 3 script including reading in and subsetting the data

## Read in the full dataset and have a look at it.

household_power_consumption <- read.csv("~/DataScience/Exploratory/assignment1/household_power_consumption.txt",
                                        sep=";", na.strings="?")
View(household_power_consumption)

## convert Date column from factor to date in order to subset

household_power_consumption$Date <- as.Date(household_power_consumption$Date, format="%d/%m/%Y")

## Subsetting

hpc <- subset( household_power_consumption, household_power_consumption$Date >= as.Date("2007-02-01")
               &  household_power_consumption$Date <= as.Date("2007-02-02") )

## convert the Date column to a proper Date includng the time

hpc$Date <- paste(hpc$Date, hpc$Time, sep = " ")

## Add the Date column to the Time column to create proper Posix time column

hpc$Time <- strptime(hpc$Date, format = "%Y-%m-%d %H:%M:%S")

## Draw the plot
## Please NOTE that language settings make thu, fre, sat come out as the Danish equivalents to, fr, lø.
## It is likely possible to modify the point descriptions, but as this is an exploratory analysis
## where graphs are created quickly I have not attempted renaming.

plot(hpc$Time, hpc$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(hpc$Time, hpc$Sub_metering_2, col = "red")
lines(hpc$Time, hpc$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(1,1,1), col=c("black", "red", "blue") )

## Copying it to a file.

dev.copy(png, file = "plot3.png")

## And remembering to close the file

dev.off()

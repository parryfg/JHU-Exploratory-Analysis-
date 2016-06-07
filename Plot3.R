##Read in data 

        setwd(paste("C:/Users/Parry_2/Google Drive/Data Analytics/",
                    "Coursera - John Hopkins DS Specialization/",
                    "04 Exploratory Analysis/Assignments/Assignment1/",
                    "exdata-data-household_power_consumption/", sep=""))

        power <- read.csv("household_power_consumption.txt",
                                  sep = ";", na.string = "?")
        
        #Convert "Date" variable to a date format in r
        power$Date <- as.Date(power$Date, format="%d/%m/%Y")
        
        #Make a new date variable (date2) with day/month/year hour:minute:second         
        power$date2 = paste(power$Date, power$Time)         
        power$date2 <- strptime(power$date2, "%Y-%m-%d %H:%M:%S")
        power$date2 <- as.POSIXct(power$date2)
        
        #Subset the data for just Feb 1st and 2nd (2007)
        power2 <- subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")

#PLOT 3
        
        #Plot data
        plot(power2$Sub_metering_1~power2$date2,
             type = "n",
             ylab = "Energy sub metering",
             xlab = "",
             xaxt='n')
        axis.POSIXct(side=1, x=power2$date2, format="%a", labels = TRUE)
        lines(power2$Sub_metering_1 ~ power2$date2)
        lines(power2$Sub_metering_2 ~ power2$date2, col = "red")
        lines(power2$Sub_metering_3 ~ power2$date2, col = "blue")
        legend("topright", lty = 1, lwd = 4,col = c("black", "red", "blue"),  
               legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"),
               cex = 1, pt.lwd = 1, y.intersp = 0.3)
        
#Copy to .PNG file
        dev.copy(png, file = "plot3.png", height =480, width=480)
        dev.off()
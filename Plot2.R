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

#PLOT 2
        
        #Plot data
        plot(power2$Global_active_power~power2$date2,
             type = "l",
             main = "Global Active Power", 
             ylab = "Global Active Power (kilowatts)",
             xlab = "",
             xaxt='n')
        axis.POSIXct(side=1, x=power2$date2, format="%a", labels = TRUE)
       
#Copy to .PNG file
        dev.copy(png, file = "plot2.png", height =480, width=480)
        dev.off()
        
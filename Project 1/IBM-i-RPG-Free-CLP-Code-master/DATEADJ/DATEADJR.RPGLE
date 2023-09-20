import java.text.SimpleDateFormat;
import java.util.Date;

public class Main {

    public static void main(String[] args) {
        
        String piInDate; // input date parameter
        int piAdj; // adjustment amount parameter 
        String piAdjType; // adjustment type parameter
        String piInFmt; // input date format parameter
        String piOutFmt; // output date format parameter
        
        SimpleDateFormat inFormat;
        SimpleDateFormat outFormat;
        
        String jobFmt; // job date format
        String sysFmt; // system date format
        
        Date inputDate; // parsed input date
        Date newDate; // calculated new date
        
        // get job and system date formats if needed
        if (piInFmt.equals("*JOBFMT")) {
            jobFmt = getJobDateFormat();
            piInFmt = jobFmt;
        }
        if (piOutFmt.equals("*JOBFMT")) {
            jobFmt = getJobDateFormat();
            piOutFmt = jobFmt;
        }
        if (piInFmt.equals("*SYSTEM")) {
            sysFmt = getSystemDateFormat();
            piInFmt = sysFmt;
        }
        if (piOutFmt.equals("*SYSTEM")) {
            sysFmt = getSystemDateFormat();
            piOutFmt = sysFmt;
        }
        
        // set output format to input if *INFMT
        if (piOutFmt.equals("*INFMT")) {
            piOutFmt = piInFmt;
        }
        
        // handle special input date values
        if (piInDate.equals("*SYSTEM")) {
            inputDate = new Date(); // use current system date
        } else if (piInDate.equals("*JOBDATE")) {
            inputDate = getJobDate(); // use job date
        } else {
            // parse input date string
            inFormat = new SimpleDateFormat(piInFmt);
            inputDate = inFormat.parse(piInDate);
        }
        
        // calculate new date
        if (piAdjType.equals("D")) {
            // adjust days
            newDate = addDays(inputDate, piAdj);
        } else if (piAdjType.equals("M")) {
            // adjust months
            newDate = addMonths(inputDate, piAdj);
        } else if (piAdjType.equals("Y")) {
            // adjust years
            newDate = addYears(inputDate, piAdj);
        }
        
        // format output date
        outFormat = new SimpleDateFormat(piOutFmt);
        String outputDate = outFormat.format(newDate);
        
        // handle errors and invalid values
        if (...) {
            sendEscapeMessage(...);
        }
        
        // return output date string
        return outputDate;
        
    }
    
    // date calculation utility methods
    
    public static Date addDays(Date date, int days) {
        ...
    }
    
    public static Date addMonths(Date date, int months) {
        ...
    }
    
    public static Date addYears(Date date, int years) {
        ...
    }
    
}
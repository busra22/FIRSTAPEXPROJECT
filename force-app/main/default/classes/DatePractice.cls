public  class DatePractice {
    //check for date2 is within the next 30 days of date1
    public Boolean dateWithin30Days(Date date1, Date date2){
        Boolean result ;
        Date date30Days = date1.addDays(30);
        if(date1 >date2){
            result = false;
        }else if(date2 >= date30Days){
            result = false;
        }else{
            result= true;
        }
        return result;
    }
    
    public Date checkDates(Date date1, Date date2){
    	Date date30Days = date1.addDays(30);
    	if(date30Days<=date1){
            return date1;
        }else{
            return Date.newInstance(date1.year(),date1.month()+1,1)-1;
        }
    }
}
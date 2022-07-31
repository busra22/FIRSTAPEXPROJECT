public class AirplaneTicket {
    public String departureCity;
    public String arrivalCity;
    public String flightCity;
    public String seatNumber;

    public void printTicket(){
        system.debug('This ticket for the journey from '+departureCity+ ' to'+arrivalCity+'. Your flight Number Is '+flightCity+ 
                        ' end Seat Number is '+seatNumber);
    //Call the future method
    futureSendEmail(departureCity,arrivalCity,flightCity,seatNumber);

    }
    /*Create a future method in airline Ticket class to send the copy of airline ticket to the given email.*/
    @future
    public static void futureSendEmail(String departureCity, String arrivalCity,
                                        String flightCity,String seatNumber){
        List<Messaging.SingleEmailMessage> emailMsgs = new List<Messaging.SingleEmailMessage>();
            Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
            List<String> emailAddress = new List<String>();
            emailAddress.add(UserInfo.getUserEmail());
            emailMsg.setToAddresses(emailAddress);
            emailMsg.setSubject('Welcome to travel with Us!');
            String body ='Please find your ticket details below, '+ '\n\n' +
            'Departure(From) : '+ departureCity + '\n' + 'Arrival(To) : '+arrivalCity +
            '\n'+ 'Flight Number: '+ flightCity + '\n' + 'Seat Number: ' + seatNumber +'\n\n' +
            'Have a wonderful Journey!';
            emailMsg.setPlainTextBody(body);
            emailMsgs.add(emailMsg);            
        
        Messaging.sendEmail(emailMsgs);       
        
    }
}
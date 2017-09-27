public class CaseHandler_ValidationService extends CaseHandler{

    public override string salesProfileValidations(List<Case> caseList){
        return 'No errrors. is Valid for sales profile';
        /*try{
            //Keep Logic here
        }catch(Exception e){
            system.debug('Error message: '+e.getMessage());
            Create a record for Error logging.
        }*/
    }

    public override string adminProfileValidations(List<Case> caseList){
        return 'No errrors. is Valid for admin profile';
        /*try{
            //Keep Logic here
        }catch(Exception e){
            system.debug('Error message: '+e.getMessage());
            Create a record for Error logging.
        }*/
    }
}
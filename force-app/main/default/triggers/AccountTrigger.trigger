trigger AccountTrigger on Account (before delete) {
    List<Account> accList = [SELECT Id, Name FROM Account 
                             WHERE Id IN (SELECT AccountId FROM Opportunity WHERE AccountId IN :Trigger.Old)];
    for (Account acc : accList) {
        System.debug(acc);
        //acc.addError('The account cannot be deleted because it has opportunities associated!!!');
    }
}
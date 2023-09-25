@isTest()
public class AccountTest {
    
    @isTest() static void queryAccount(){
        AccountOpeartions.getAccounts('Customer - Channel','Consulting',null);
        AccountOpeartions.getAccounts('Customer - Channel',null, 'Web');
        Map<String, String> typePicklist = AccountOpeartions.getAccountPicklistValue('Type');
        System.assertEquals('Customer - Channel', typePicklist.get('Customer - Channel'));
        Map<String, String> industryPicklist = AccountOpeartions.getAccountPicklistValue('Industry');
        System.assertEquals('Consulting', industryPicklist.get('Consulting'));
        Map<String, String> sourcePicklist = AccountOpeartions.getAccountPicklistValue('Source');
        System.assertEquals('Web', sourcePicklist.get('Web'));
    }
    
    @isTest() static void updateAccount(){
        Account sampleAccount = [select id from Account where name = 'Test-Account'];
        Account updatedAccount = new Account(id=sampleAccount.id,Active__c ='Yes');
        AccountOpeartions.updateAccount(new List<Account>{updatedAccount});
        try{
        Account updatedAccount1 = new Account(id=sampleAccount.id,Active__c ='Yess');
        AccountOpeartions.updateAccount(new List<Account>{updatedAccount1});
        }
        Catch(AuraHandledException e){
            sampleAccount = [select id,Active__c from Account where name = 'Test-Account'];
        	System.assertEquals(sampleAccount.Active__c,'Yes');
        }
    }
    
    @testSetup static void createAccount(){
        
        Account sampleAccount = new Account(name = 'Test-Account', Type='Customer - Channel',Industry='Consulting', Source__c='Web', Active__c = 'No');
        insert sampleAccount;
    }
    
}
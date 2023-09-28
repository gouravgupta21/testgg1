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
    @testSetup static void createAccount(){
        
        Account sampleAccount = new Account(name = 'Test-Account', Type='Customer - Channel',Industry='Consulting', Source__c='Web', Active__c = 'No');
        insert sampleAccount;
    }
    
}
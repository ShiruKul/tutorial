global with sharing class TestBatchClass implements Database.Batchable<sObject>, Database.Stateful {
    global integer recordproccessed = 0;
    global database.QueryLocator start(database.BatchableContext aa){
        
        string query = 'select id, name from account';
        return database.getQueryLocator(query);
        
    }
    
    global void execute (database.BatchableContext aa, list<account> acclist){
        for(account acc: acclist){
            acc.industry = 'Banking';
            recordproccessed  = recordproccessed + 1;
        }
        try {
            update acclist;
        }
        
        catch(exception e){
            system.debug(e);
        }
    }
    
    global void finish (database.BatchableContext aa){
        system.debug(recordproccessed + 'Record proccessed!!!');
        
    }
}

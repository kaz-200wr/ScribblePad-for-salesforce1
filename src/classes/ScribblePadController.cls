public with sharing class ScribblePadController {
    public Transient String sigData{set;get;}

    public ScribblePadController() {        
    }
    
    public PageReference saveScribblePad(){ 
        trySaveScribblePad();
        return null;
    }
    
    private void trySaveScribblePad(){
        try {
            Id pId=ApexPages.currentPage().getParameters().get('Id');
            FeedItem post = new FeedItem();
            post.ParentId = pId;
            post.Body = '';
            post.ContentData = EncodingUtil.base64Decode(sigData.split(',', 2)[1]);  // data
            post.ContentFileName = 'memo-' + UserInfo.getName() + '-' + String.valueof(datetime.now()) + '.png';
           
            insert post;
        }catch(System.Exception ex){
            System.debug(ex.getMessage());
        }
    }
}
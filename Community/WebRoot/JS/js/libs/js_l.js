
var lastFaqClick=null;
window.onload=function(){
  
  var faq=document.getElementById("faq");
  var dls=faq.getElementsByTagName("dl");
  for (var i=0,dl;dl=dls[i];i++){
    var dt=dl.getElementsByTagName("dt")[0];
     dt.id = "faq_dt_"+(Math.random()*100);
     dt.onclick=function(){
       var p=this.parentNode;
        if (lastFaqClick!=null&&lastFaqClick.id!=this.id){
          var dds=lastFaqClick.parentNode.getElementsByTagName("dd");
          for (var i=0,dd;dd=dds[i];i++)
            dd.style.display='none';
        }
        lastFaqClick=this;
        var dds=p.getElementsByTagName("dd");
        var tmpDisplay='none';
        if (gs(dds[0],'display')=='none')
          tmpDisplay='block';
        for (var i=0;i<dds.length;i++)
          dds[i].style.display=tmpDisplay;
      }
  }
  page = new Page(10,'table_page','group_one');
}
function gs(d,a){
  if (d.currentStyle){
    var curVal=d.currentStyle[a]
  }else{
    var curVal=document.defaultView.getComputedStyle(d, null)[a]
  }
  return curVal;
}



function Page(iAbsolute,sTableId,sTBodyId)
{
this.absolute = iAbsolute; 
this.tableId = sTableId;
this.tBodyId = sTBodyId;
this.rowCount = 0;
this.pageCount = 0;
this.pageIndex = 0;
this.__oTable__ = null;
this.__oTBody__ = null;
this.__dataRows__ = 0;
this.__oldTBody__ = null;
this.__init__(); 
};

Page.prototype.__init__ = function(){
this.__oTable__ = document.getElementById(this.tableId);
this.__oTBody__ = this.__oTable__.tBodies[this.tBodyId];
this.__dataRows__ = this.__oTBody__.rows;
this.rowCount = this.__dataRows__.length;
try{
this.absolute = (this.absolute <= 0) || (this.absolute>this.rowCount) ? this.rowCount : this.absolute;
this.pageCount = parseInt(this.rowCount%this.absolute == 0
? this.rowCount/this.absolute : this.rowCount/this.absolute+1);
document.getElementById("PageCount").innerHTML=this.pageCount;
}catch(exception){}

this.__updateTableRows__();
};

Page.prototype.nextPage = function(){
if(this.pageIndex + 1 < this.pageCount){
this.pageIndex += 1;
this.__updateTableRows__();

}
};

Page.prototype.prePage = function(){
if(this.pageIndex >= 1){
this.pageIndex -= 1;

this.__updateTableRows__();
}
};

Page.prototype.firstPage = function(){
if(this.pageIndex != 0){
this.pageIndex = 0;

this.__updateTableRows__();
}
};

Page.prototype.lastPage = function(){
if(this.pageIndex+1 != this.pageCount){
this.pageIndex = this.pageCount - 1;
this.__updateTableRows__();
}
};

Page.prototype.aimPage = function(iPageIndex){
var iPageIndex=document.getElementById("current_page").value-1;
if(iPageIndex > this.pageCount-1){
this.pageIndex = this.pageCount - 1;
}else if(iPageIndex < 0){
this.pageIndex = 0;
}else{
this.pageIndex = iPageIndex;
}
this.__updateTableRows__();
};

Page.prototype.__updateTableRows__ = function(){
document.getElementById("my_iPageIndex").innerHTML=this.pageIndex+1;
var iCurrentRowCount = this.absolute * this.pageIndex;
var iMoreRow = this.absolute+iCurrentRowCount > this.rowCount ? this.absolute+iCurrentRowCount - this.rowCount : 0;
var tempRows = this.__cloneRows__();

var removedTBody = this.__oTable__.removeChild(this.__oTBody__);
var newTBody = document.createElement("TBODY");
newTBody.setAttribute("id", this.tBodyId);

for(var i=iCurrentRowCount; i < this.absolute+iCurrentRowCount-iMoreRow; i++){
newTBody.appendChild(tempRows[i]);
}
this.__oTable__.appendChild(newTBody);

this.__dataRows__ = tempRows;
this.__oTBody__ = newTBody;


};

Page.prototype.__cloneRows__ = function(){
var tempRows = [];
for(var i=0; i<this.__dataRows__.length; i++){

tempRows[i] = this.__dataRows__[i].cloneNode(1);
}
return tempRows;
};
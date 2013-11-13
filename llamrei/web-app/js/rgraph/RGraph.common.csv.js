/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 10/23/13
 * Time: 3:33 PM
 * To change this template use File | Settings | File Templates.
 */

if(typeof(RGraph)=='undefined')RGraph={isRGraph:true,type:'common'};RGraph.CSV=function(url,func)
{this.url=url;this.ready=func;this.data=null;this.numrows=null;this.numcols=null;this.seperator=arguments[2]||',';this.endofline=arguments[3]||/\r?\n/;this.fetch=function()
{var sep=this.seperator;var eol=this.endofline;var obj=this;if(this.url.substring(0,3)=='id:'){var data=document.getElementById(this.url.substring(3)).innerHTML.replace(/(\r?\n)+$/,'');obj.data=data.split(eol);obj.numrows=obj.data.length;for(var i=0,len=obj.data.length;i<len;i+=1){var row=obj.data[i].split(sep);if(!obj.numcols){obj.numcols=row.length;}
    for(var j=0;j<row.length;j+=1){if((/^[0-9.]+$/).test(row[j])){row[j]=parseFloat(row[j]);}
        obj.data[i]=row;}}
    obj.ready(obj);}else{RGraph.AJAX.getString(this.url,function(data)
{data=data.replace(/(\r?\n)+$/,'');obj.data=data.split(eol);obj.numrows=obj.data.length;for(var i=0,len=obj.data.length;i<len;i+=1){var row=obj.data[i].split(sep);if(!obj.numcols){obj.numcols=row.length;}
    for(var j=0;j<row.length;j+=1){if((/^[0-9.]+$/).test(row[j])){row[j]=parseFloat(row[j]);}
        obj.data[i]=row;}}
    obj.ready(obj);});}}
    this.getRow=function(index)
    {var row=[];var start=arguments[1]||0;for(var i=start;i<this.numcols;i+=1){row.push(this.data[index][i]);}
        return row;}
    this.getCol=this.getColumn=function(index)
    {var col=[];var start=arguments[1]||0;for(var i=start;i<this.numrows;i+=1){col.push(this.data[i][index]);}
        return col;}
    this.fetch();}
 package com.dv.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.rosuda.JRI.RFactor;
import org.rosuda.JRI.Rengine;

import com.dv.action.base.DataMiningBaseAction;
import com.dv.util.Export_excelBean;
import com.dv.util.Export_imageBean;
import com.dv.util.StaticData;
import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("serial")
public class Association extends DataMiningBaseAction {
    private String ids;
    private String lift;
    private String conf;
    private String matrixcols;//二维数组的各个属性名
    private String colsnum;//二维数组的各个属性名拥有的数量
    private String savaPath;
    private String imagename;
    private String[] deleteData;
    private List<Export_excelBean> excellist = null;
    private List<Export_imageBean> imagelist = null;
    private String result;
    private String[] allrules = null;
    private double aprinfo[][] = null;

    @SuppressWarnings("deprecation")
    public String getSavaPath() {
        return ServletActionContext.getRequest().getRealPath(savaPath);
    }

    public void setSavaPath(String savaPath) {
        this.savaPath = savaPath;
    }

    public String Apriori() {
        String imagepath = getSavaPath().replace("\\", "//") + "//";
        imagename = "result" + new Date().getTime() + ".png";
        StaticData sd = StaticData.getInstance();
        sd.setAr();
        
        Rengine c = sd.re;
        Map<String, Object> session = ActionContext.getContext().getSession();
        String coltypes[] = (String[]) session.get("coltypes");
        System.out.println(ids);
        String colids[] = ids.split(",");
        int[] col = new int[colids.length];
        for(int i=0;i<colids.length;i++){
        	col[i] = Integer.parseInt(colids[i])-1;
        }
        String colnames[] = (String[]) session.get("colnames");
        String index="";
        int cou=0;
        
        for(int i=0;i<col.length;i++){
        	System.out.println(i);
        	System.out.println(coltypes[i]);
        	if(coltypes[col[i]]=="S"){
        		
        		continue;
        	}
        	else{
        		System.out.println(coltypes[col[i]]);
        		
        			
        		
        		
        		//index +=","+(i+1);
        		cou++;
        	}
        }
        deleteData = new String [cou];
        int num =0;
        int[] delete= new int[cou];
        for(int i=0;i<col.length;i++){
        	if(coltypes[col[i]]=="S"){
        		
        		continue;
        	}
        	else{
        		delete[num] = col[i];
        		deleteData[num] = colnames[col[i]];
        		System.out.println(deleteData[num]);
        		num++;
        	}
        }
        //c.eval("data=data[,c("+index+")]");
        for(int i=0;i<colids.length;i++){
        	col[i] = Integer.parseInt(colids[i]);
        }
        for(int i=0;i<col.length;i++){
        	for(int j=0;j<delete.length;j++){
        		if(col[i]==(delete[j]+1)){
        			col[i]=0;
        			break;
        		}
        		
        	}
        }
        String idscopy  = ids;
        ids ="";
        int notZero =0;
        for(int i=0;i<col.length;i++){
        	if(col[i]!=0){
        		ids+=col[i]+",";
        		notZero++;
        	}
        }
        if(ids.length()==0){
        	result="该数据集不存在可以进行该分析的变量，请重新选择数据集";
        	return "apriori";
        }
        ids=ids.substring(0, ids.length()-1);
        System.out.println(ids);
        if(notZero<=1){
        	result="该数据集符合关联分析的变量过少无法执行，请重新选择数据集";
        	return "apriori";
        }
        c.eval("rules<-apriori(data[,c(" + ids + ")],parameter = list(minlen=2,support = " + lift + ",confidence = " + conf + "))");
        //System.out.println(c.eval("rules<-apriori(data[,c(" + ids + ")],parameter = list(minlen=2,support = " + lift + ",confidence = " + conf + "))"));
        if(c.eval("length(rules)").asInt()==0){
        	result="该数据集的变量之间不存在关联规则";
        	System.out.println(result);
        	c.eval("rm('rules')");
        	return "apriori";
        }
        else {
        	if(ids.equals(idscopy)){
        		result = "成功";
        	}
        	else {
        		result="其他符合要求变量已成功加入分析算法中，结果如下";
        	}
        	//result=""
        	c.eval("{" +
                    "setwd('" + imagepath + "');" +
                    "png(file='" + imagename + "',width=1000,height=1000);" +
                    "plot(rules, method='graph', control=list(type='items'));" +
                    "dev.off();" +
                    "}");
            System.out.println(c.eval("dim(rules)"));
        	result="成功";
        }
        c.eval("allrules<-as(rules,'data.frame')");
        
        
        
        
        matrixcols = "";
        colsnum = "";
        String[] namestemp;
       
        System.out.println(coltypes.length);
        
        //System.out.println(deleteData.length);
        System.out.println(index);
        int[] numtemp;
        for (int i = 0; i < colnames.length; i++) {
            namestemp = c.eval("names(table(data[," + (i + 1) + "]))").asStringArray();//获取各个属性名
            numtemp = c.eval("table(data[," + (i + 1) + "])").asIntArray();//获取各个属性拥有的数量
            for (int j = 0; j < numtemp.length; j++) {
                matrixcols += namestemp[j] + "&";
                colsnum += numtemp[j] + "&";
            }
        }
        matrixcols = matrixcols.substring(0, matrixcols.length() - 1);
        colsnum = colsnum.substring(0, colsnum.length() - 1);
        RFactor rf = c.eval("allrules[,1]").asFactor();
        allrules = new String[rf.size()];
        for (int i = 0; i < rf.size(); i++) {
            allrules[i] = rf.at(i);
            System.out.println(i+":"+allrules[i]);
        }///allrules存储关联结果
        aprinfo = c.eval("as.matrix(allrules[,c(2,3,4)])").asDoubleMatrix();///获取aprinfo数据数组
        c.eval("rm('rules')");
        c.eval("rm('allrules')");
        return "apriori";
    }


    public String getIds() {
        return ids;
    }

    public void setIds(String ids) {
        this.ids = ids;
    }

    public String getImagename() {
        return imagename;
    }

    public void setImagename(String imagename) {
        this.imagename = imagename;
    }

    public String[] getAllrules() {
        return allrules;
    }

    public void setAllrules(String[] allrules) {
        this.allrules = allrules;
    }

    public double[][] getAprinfo() {
        return aprinfo;
    }

    public void setAprinfo(double[][] aprinfo) {
        this.aprinfo = aprinfo;
    }

    public String getLift() {
        return lift;
    }

    public void setLift(String lift) {
        this.lift = lift;
    }

    public String getConf() {
        return conf;
    }

    public void setConf(String conf) {
        this.conf = conf;
    }

    public String getMatrixcols() {
        return matrixcols;
    }

    public void setMatrixcols(String matrixcols) {
        this.matrixcols = matrixcols;
    }

    public String getColsnum() {
        return colsnum;
    }

    public void setColsnum(String colsnum) {
        this.colsnum = colsnum;
    }

	public String[] getDeleteData() {
		return deleteData;
	}

	public void setDeleteData(String[] deleteData) {
		this.deleteData = deleteData;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
    
}

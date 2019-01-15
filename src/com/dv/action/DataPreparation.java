package com.dv.action;

import com.dv.action.base.DataMiningBaseAction;
import com.dv.util.FileDatasetDetailBean;
import com.dv.util.QuickSort;
import com.dv.util.StaticData;
import com.opensymphony.xwork2.ActionContext;

import org.apache.struts2.ServletActionContext;
import org.rosuda.JRI.Rengine;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


@SuppressWarnings("serial")
public class DataPreparation extends DataMiningBaseAction {
    private String ids;
    private String method;
    private String starts;
    private String[][] start;
    private String ends;
    private String[][] end;
    private String indexs;
    private String[] index;
    private String numbers;
    private int[] number;
    private int totalrow;
    private String[] deleteData;
    private String result;
    private List<FileDatasetDetailBean> fddBeans = new ArrayList<FileDatasetDetailBean>();
    private List<double[]> statdata = new ArrayList<double[]>();//条形图、折线图数据
    private List<double[][]> scatterdata = new ArrayList<double[][]>();//散点图、箱线图数据
    private List<double[][]> scatterdata3d = new ArrayList<double[][]>();//散点图3d
    private List<double[][]> outlier = new ArrayList<double[][]>();//箱线图数据异常值
    private List<int[]> varname = new ArrayList<int[]>();//散点图横、纵坐标名称
    private String[] colors;
    private List<String[]> missdata = new ArrayList<String[]>();
    private String missinput;
    private String hasmissing;
    private String dataStart;
    private String dataEnd;
    private String[][] datashow;
    private String[] datacolnames;
    public String chooseData(){
    	HttpServletRequest request = ServletActionContext.getRequest();
    	StaticData sd = StaticData.getInstance();
    	sd.setAr();
        Rengine c = sd.re;
        c.eval("dataCopy<-data");
        System.out.println(c.eval("dim(data)"));
        System.out.println("晒选后");
        totalrow = c.eval("length(data[,1])").asInt();
        System.out.println(method);
    	if(method.equals("random")){
    		int start = (int)(Integer.parseInt(dataStart)/100.0*totalrow);
    		System.out.println("进来了");
    		System.out.println("start"+start);
    		c.eval("index<-sample(1:nrow(data),"+ start +")");
    		System.out.println(c.eval("dim(index)"));
    		c.eval("data<-data[index,]");
    		
    	}else if(method.equals("index")){
    		int start = Integer.parseInt(dataStart);
    		int end = Integer.parseInt(dataEnd);
    		
    		c.eval("data<-data["+ start +":"+ end +",]");
    		
    	}else if(method.equals("index")){
    		int start = (int)(totalrow*(Integer.parseInt(dataStart))/100.0);
    		int end = (int)(totalrow*(Integer.parseInt(dataEnd))/100.0);
    		c.eval("data<-data["+start+":"+end+",]");
    	}
    	c.eval("{rcolname<-names(data);dim(rcolname)<-c(length(names(data)))}");
        String colnames[] = c.eval("rcolname").asStringArray();

    	datacolnames = new String[colnames.length + 1];
        for (int i = 0; i <= colnames.length; i++) {
            if (i == 0) {
                datacolnames[i] = "序号";
            } else {
                datacolnames[i] = colnames[i - 1];
            }
        }
        System.out.println(c.eval("dim(data)"));
                totalrow = c.eval("length(data[,1])").asInt();
        datashow = new String[totalrow][colnames.length];
        for (int i = 0; i < totalrow ; i++) {
            for (int j = 0; j < colnames.length; j++) {
                datashow[i][j] = c.eval("as.character(data[" + (i + 1) + "," + (j + 1) + "])").asString();
                System.out.println(c.eval("as.character(data[" + (i + 1) + "," + (j + 1) + "])"));
                //as.character 转化为字符
            }
            
        }
        Map<String, Object> session = ActionContext.getContext().getSession();

        session.remove("totalrow");
        session.put("totalrow",totalrow);
    	return SUCCESS;
    }
    public String choosebydata(){
    	HttpServletRequest request = ServletActionContext.getRequest();
    	StaticData sd = StaticData.getInstance();
    	Map<String, Object> session = ActionContext.getContext().getSession();
    	sd.setAr();
        Rengine c = sd.re;
        c.eval("dataCopy<-data");
        String coltypes[] = (String[]) session.get("coltypes");
        String colnames[] = c.eval("rcolname").asStringArray();
    	System.out.println(colnames[0]);
        index  = indexs.substring(0, indexs.length()).split(",");
    	int id[] = new int[index.length];
    	String kind[] = new String[index.length];
    	for(int i=0;i<index.length;i++){
    		System.out.println(index[i]);
    		System.out.println(i);
    		for(int j=0;j<coltypes.length;j++){
    			System.out.println(colnames[j]);
    			if(index[i].equals(colnames[j])){
    				id[i] = j+1;
    				kind[i] = coltypes[j];
    				System.out.println(kind[i]);
    				break;
    			}
    		}
    	}
    	
    	String num[] = numbers.substring(0, numbers.length()).split(",");
    	String S[] = starts.substring(0, starts.length()).split(",");
    	String E[] = ends.substring(0, ends.length()).split(",");
    	number = new int[num.length];
    	for(int i=0;i<num.length;i++)
    	{
    		number[i] = Integer.parseInt(num[i]);
    	}
    	start = new String[index.length][];
    	end = new String[index.length][];
    	int s=0;
    	int e=0;
    	for(int i=0;i<index.length;i++){
    		start[i] = new String[number[i]];
    		end[i] = new String[number[i]];
    		for(int j=0;j<number[i];j++){
    			if(kind[i].equals("N")){
    				if(Double.parseDouble(E[e])<Double.parseDouble(S[s])){
    					String sw = E[e];
    					E[e] = S[s];
    					S[s] = sw;
    				}
    				end[i][j] = E[e++];
    			}
    			start[i][j] = S[s++];
    		}
    	}
    	for(int i=0;i<start.length;i++){
    		String el = "index<-which(";
    		for(int j=0;j<start[i].length;j++){
    			if(kind[i].equals("S")){
    				if(j==0){
    					el+="(data[,"+id[i]+"]==\""+start[i][j]+"\")";
    				}
    				else{
    					el+="|"+"data[,"+id[i]+"]==\""+start[i][j]+"\"";
    				}
    			}
    			else{
    				if(start[i][j].equals(end[i][j])){
    					el+=("(data[,"+id[i]+"]=="+start[i][j]+")");
    				}
    				else{
    					
    				}
    				el+="(data[,"+id[i]+"]>="+start[i][j]+"&data[,"+id[i]+"]<="+end[i][j]+")";
    			}
    			
    		}
    		el+=")";
    		c.eval(el);
    		c.eval("data<-data[index,]");
    		System.out.println(el);
    	}
    	c.eval("{rcolname<-names(data);dim(rcolname)<-c(length(names(data)))}");
        

    	//datacolnames = new String[colnames.length + 1];
    	datacolnames = new String[colnames.length + 1];
        for (int i = 0; i <= colnames.length; i++) {
            if (i == 0) {
                datacolnames[i] = "序号";
            } else {
                datacolnames[i] = colnames[i - 1];
            }
        }
        System.out.println(c.eval("dim(data)"));
        totalrow = c.eval("length(data[,1])").asInt();
        datashow = new String[totalrow][colnames.length];
        for (int i = 0; i < totalrow ; i++) {
            for (int j = 0; j < colnames.length; j++) {
                datashow[i][j] = c.eval("as.character(data[" + (i + 1) + "," + (j + 1) + "])").asString();
                System.out.println(c.eval("as.character(data[" + (i + 1) + "," + (j + 1) + "])"));
                //as.character 转化为字符
            }
        }
        session.remove("totalrow");
        session.put("totalrow",totalrow);
    	return SUCCESS;
    }
    public String updateMissing() {
        StaticData sd = StaticData.getInstance();
        sd.setAr();
        Rengine c = sd.re;
        String rowids[] = ids.substring(0, ids.length() - 1).split(",");
        Map<String, Object> session = ActionContext.getContext().getSession();
        String colnames[] = (String[]) session.get("colnames");
        String coltypes[] = (String[]) session.get("coltypes");
        int missingnum[] = new int[colnames.length];
        double missingratio[] = new double[colnames.length];
        totalrow = c.eval("length(data[,1])").asInt();
        String[] missarray = missinput.split(";");
        System.out.println(missinput);
        for (int i = 0; i < rowids.length; i++) {
            for (int j = 0; j < colnames.length; j++) {
                if (c.eval("is.factor(data[" + rowids[i] + "," + (j + 1) + "])").asBool().equals("FALSE")) {
                    c.eval("data[" + rowids[i] + "," + (j + 1) + "]=" + missarray[i * colnames.length + j] + "");
                } else {
                    c.eval("data[" + rowids[i] + "," + (j + 1) + "]='" + missarray[i * colnames.length + j] + "'");
                }

            }
        }

        DecimalFormat df = new DecimalFormat("##.##");
        for (int i = 0; i < colnames.length; i++) {
            missingnum[i] = c.eval("sum(is.na(data[," + (i + 1) + "]))").asInt();
            missingratio[i] = (double) missingnum[i] / (double) totalrow;
        }
        for (int i = 0; i < colnames.length; i++) {
            FileDatasetDetailBean fddb = new FileDatasetDetailBean();
            fddb.setColname(colnames[i]);
            fddb.setColtype(coltypes[i].equals("S") ? "字符型" : "数值型");
            fddb.setMissingnum(missingnum[i]);
            fddb.setMissingratio(df.format(missingratio[i] * 100) + "%");
            fddBeans.add(fddb);
        }
        return SUCCESS;
    }

    public String delMissing() {
        StaticData sd = StaticData.getInstance();
        sd.setAr();
        Rengine c = sd.re;
        c.eval("data<-data[-c(" + ids.substring(0, ids.length() - 1) + "),]");
        Map<String, Object> session = ActionContext.getContext().getSession();
        String colnames[] = (String[]) session.get("colnames");
        String coltypes[] = (String[]) session.get("coltypes");
        int missingnum[] = new int[colnames.length];
        double missingratio[] = new double[colnames.length];
        totalrow = c.eval("length(data[,1])").asInt();
        DecimalFormat df = new DecimalFormat("##.##");
        for (int i = 0; i < colnames.length; i++) {
            missingnum[i] = c.eval("sum(is.na(data[," + (i + 1) + "]))").asInt();
            missingratio[i] = (double) missingnum[i] / (double) totalrow;
        }


        for (int i = 0; i < colnames.length; i++) {
            FileDatasetDetailBean fddb = new FileDatasetDetailBean();
            fddb.setColname(colnames[i]);
            fddb.setColtype(coltypes[i].equals("S") ? "字符型" : "数值型");
            fddb.setMissingnum(missingnum[i]);
            fddb.setMissingratio(df.format(missingratio[i] * 100) + "%");
            fddBeans.add(fddb);
        }
        return SUCCESS;
    }

    public String showMissing() {
        StaticData sd = StaticData.getInstance();
        sd.setAr();
        Rengine c = sd.re;
        Map<String, Object> session = ActionContext.getContext().getSession();
        String missing = (String) session.get("missing");
        String colnames[] = (String[]) session.get("colnames");
        System.out.println(missing);
        String result ;
        if(missing.equals("无缺失值")){
        	result="无缺失值，请跳过缺失值处理，进行其他操作";
        	session.remove("missingresult");
        	session.put("missingresult",result);
        	return SUCCESS;
        }
        result = "有缺失值";
        session.remove("missingresult");
    	session.put("missingresult",result);
        if (c.eval("{data}") == null || colnames == null) {
        } else if (c.eval("{data}") != null && colnames != null) {
            totalrow = c.eval("length(data[,1])").asInt();
            for (int i = 0; i < totalrow; i++) {
                for (int j = 0; j < colnames.length; j++) {
                    String temp = c.eval("as.character(data[" + (i + 1) + "," + (j + 1) + "])").asString();
                    if (temp == null) {
                        String misstemp[] = new String[colnames.length + 1];
                        for (int k = 0; k < colnames.length + 1; k++) {
                            if (k == 0) {
                                misstemp[k] = (i + 1) + "";//第一个放第几行有缺失值
                            } else {
                                misstemp[k] = c.eval("as.character(data[" + (i + 1) + "," + k + "])").asString();
                            }
                        }
                        missdata.add(misstemp);
                        break;
                    }
                }
            }
        }
        return SUCCESS;
    }
    public String judgeMissing() {
        hasmissing = "false";
        StaticData sd = StaticData.getInstance();
        sd.setAr();
        Rengine c = sd.re;
        Map<String, Object> session = ActionContext.getContext().getSession();
        String colnames[] = (String[]) session.get("colnames");
        if (c.eval("{data}") == null || colnames == null) {
        } else if (c.eval("{data}") != null && colnames != null) {
            totalrow = c.eval("length(data[,1])").asInt();
            //查找存在缺失值的数据集，并存在缺失值的数据集+id存储为misstemp中，压入missdata
            for (int i = 0; i < totalrow; i++) {
                for (int j = 0; j < colnames.length; j++) {
                    String temp = c.eval("as.character(data[" + (i + 1) + "," + (j + 1) + "])").asString();
                    if (temp == null) {
                        hasmissing = "true";
                        String misstemp[] = new String[colnames.length + 1];
                        for (int k = 0; k < colnames.length + 1; k++) {
                            if (k == 0) {
                                misstemp[k] = (i + 1) + "";//第一个放第几行有缺失值
                            } else {
                                misstemp[k] = c.eval("as.character(data[" + (i + 1) + "," + k + "])").asString();
                            }
                        }
                        System.out.println("i:"+i+"j:"+j);
                        for(int a=0;a<misstemp.length;a++){
                        	System.out.println(misstemp[a]);
                        }
                        missdata.add(misstemp);
                        break;
                    }
                }
            }
        }
        return SUCCESS;
    }

    public String dealMissing() {
        StaticData sd = StaticData.getInstance();
        sd.setAr();
        Rengine c = sd.re;
        String colids[] = ids.split(",");
        System.out.println("ids"+ids);
        for(int i =0 ;i<colids.length;i++)
        {
        	System.out.println(colids[i]);
        }
        for (int i = 0; i < colids.length; i++) {
            if (method.equals("prior")) {
            	System.out.println(c.eval("data[," + colids[i] + "]"));
                c.eval("data[," + colids[i] + "]<-na.locf(data[," + colids[i] + "],fromLast=F)");//将缺失值替换为离它最近的值
                System.out.println(c.eval("data[," + colids[i] + "]"));
            } else if (method.equals("mean")) {
                c.eval("{data[," + colids[i] + "]<-as.double(as.character(data[," + colids[i] + "]));" +
                        "data[," + colids[i] + "][which(is.na(data[," + colids[i] + "]))]<-mean(data[," + colids[i] + "][-which(is.na(data[," + colids[i] + "]))]);" +
                        "}");//将缺失值使用样本均值替换
            } else if (method.equals("spline")) {
                c.eval("{data[," + colids[i] + "]<-as.double(as.character(data[," + colids[i] + "]));" +
                        "data[," + colids[i] + "]<-na.spline(data[," + colids[i] + "],na.rm=TRUE);" +
                        "}");//使用spline方法替换缺失值
            }
        }
        Map<String, Object> session = ActionContext.getContext().getSession();
        String colnames[] = (String[]) session.get("colnames");
        for(int i=0;i<colnames.length;i++){
        	System.out.println(colnames[i]);
        }
        String coltypes[] = (String[]) session.get("coltypes");
        int missingnum[] = new int[colnames.length];
        double missingratio[] = new double[colnames.length];
        totalrow = c.eval("length(data[,1])").asInt();
        DecimalFormat df = new DecimalFormat("##.##");
        for (int i = 0; i < colnames.length; i++) {
            missingnum[i] = c.eval("sum(is.na(data[," + (i + 1) + "]))").asInt();
            missingratio[i] = (double) missingnum[i] / (double) totalrow;
        }


        for (int i = 0; i < colnames.length; i++) {
            FileDatasetDetailBean fddb = new FileDatasetDetailBean();
            fddb.setColname(colnames[i]);
            fddb.setColtype(coltypes[i].equals("S") ? "字符型" : "数值型");
            fddb.setMissingnum(missingnum[i]);
            fddb.setMissingratio(df.format(missingratio[i] * 100) + "%");
            fddBeans.add(fddb);
        }
        System.out.println(c.eval("data"));
        return "success";
    }

    public String statInfo() {
        StaticData sd = StaticData.getInstance();
        sd.setAr();
        Rengine c = sd.re;
        String colid[] = ids.split(",");
        colors = new String[]{"#FF0000", "#EB4310", "#F6941D", "#FFFF00", "#CDD541",
                "#99CC33", "#3F9337", "#219167", "#24998D", "#1F9BAA",
                "#A1488E", "#C71585", "#BD2158", "#CCFFFF", "#FFCCCC",
                "#33FF99", "#FF95CA", "#00FFFF", "#FF5809", "#1AFD9C"};
      // c.eval("stat<-");
        Map<String, Object> session = ActionContext.getContext().getSession();
        String coltypes[] = (String[]) session.get("coltypes");
        System.out.println(ids);
        //String colids[] = ids.split(",");
        int[] col = new int[colid.length];
        for(int i=0;i<colid.length;i++){
        	col[i] = Integer.parseInt(colid[i])-1;
        }
        String colnames[] = (String[]) session.get("colnames");
        //String index="";
        int cou=0;
        
        for(int i=0;i<col.length;i++){
        	System.out.println(i);
        	System.out.println(coltypes[i]);
        	if(coltypes[col[i]]=="N"){
        		
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
        	if(coltypes[col[i]]=="N"){
        		
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
        for(int i=0;i<colid.length;i++){
        	col[i] = Integer.parseInt(colid[i]);
        }
        for(int i=0;i<col.length;i++){
        	for(int j=0;j<delete.length;j++){
        		if(col[i]==(delete[j]+1)){
        			col[i]=0;
        			break;
        		}
        		
        	}
        }
        String idscopy = ids;
        ids ="";
        for(int i=0;i<col.length;i++){
        	if(col[i]!=0){
        		ids+=col[i]+",";
        	}
        }
        if(ids.length()==0){
        	result="该数据集不存在可以进行该分析的变量，本分析针对数值型变量，请重新选择数据集";
        	return SUCCESS;
        }
        ids=ids.substring(0, ids.length()-1);
        System.out.println(ids);
        if(ids.equals(idscopy)){
    		result = "成功";
    	}
    	else {
    		result="其他符合要求变量已成功加入分析算法中，结果如下";
    	}
        String[] colids = ids.split(",");
        if (method.equals("bar")) {
            for (int i = 0; i < colids.length; i++) {
                statdata.add(c.eval("data[," + colids[i] + "]").asDoubleArray());
            }
        } else if (method.equals("breakline")) {
            for (int i = 0; i < colids.length; i++) {
                statdata.add(c.eval("data[," + colids[i] + "]").asDoubleArray());
            }
        } else if (method.equals("scatter")) {
            for (int i = 0; i < colids.length; i++) {
                for (int j = 0; j < colids.length; j++) {
                    if (i != j) {
                        int[] temp = new int[2];
                        temp[0] = Integer.parseInt(colids[i]);
                        temp[1] = Integer.parseInt(colids[j]);
                        varname.add(temp);
                        scatterdata.add(c.eval("as.matrix(data[,c(" + colids[i] + "," + colids[j] + ")])").asDoubleMatrix());
                    }
                }
            }
        } else if (method.equals("scatter3d")) {
            for (int i = 0; i < colids.length; i++) {
                for (int j = 0; j < colids.length; j++) {
                    for (int k = 0; k < colids.length; k++) {
                        if (i != j && i != k && j != k && i < j && j < k) {
                            int[] temp = new int[3];
                            temp[0] = Integer.parseInt(colids[i]);
                            temp[1] = Integer.parseInt(colids[j]);
                            temp[2] = Integer.parseInt(colids[k]);
                            varname.add(temp);
                            scatterdata3d.add(c.eval("as.matrix(data[,c(" + colids[i] + "," + colids[j] + "," + colids[k] + ")])").asDoubleMatrix());
                        }
                    }

                }
            }
        } else if (method.equals("box")) {
            double fivearray[];
            double outarray[];
            double fivenum[][] = new double[colids.length][5];
            for (int i = 0; i < colids.length; i++) {
                fivearray = c.eval("fivenum(data[," + colids[i] + "])").asDoubleArray();
                outarray = c.eval("boxplot.stats(data[," + colids[i] + "])$out").asDoubleArray();
                fivenum[i] = fivearray;
                System.out.println(outarray.length);
                if (outarray.length > 0) {
                    double outpoint[][] = new double[outarray.length][2];
                    for (int j = 0; j < outarray.length; j++) {
                        outpoint[j] = new double[]{i, outarray[j]};
                    }
                    outlier.add(outpoint);
                }
            }

            scatterdata.add(fivenum);
        }

        return SUCCESS;
    }

    public String resetBar() {
        StaticData sd = StaticData.getInstance();
        sd.setAr();
        Rengine c = sd.re;
        String colids[] = ids.split(",");
        for (int i = 0; i < colids.length; i++) {
            statdata.add(c.eval("data[," + colids[i] + "]").asDoubleArray());
        }
        return SUCCESS;
    }

    public String sortHighToLow() {
        StaticData sd = StaticData.getInstance();
        sd.setAr();
        Rengine c = sd.re;
        String colids[] = ids.split(",");
        double[] strVoid = null;
        for (int i = 0; i < colids.length; i++) {
            strVoid = c.eval("data[," + colids[i] + "]").asDoubleArray();
            statdata.add(new QuickSort().quickSort(strVoid, 0, strVoid.length - 1));
        }
        return SUCCESS;
    }

    public String sortLowToHigh() {
        StaticData sd = StaticData.getInstance();
        sd.setAr();
        Rengine c = sd.re;
        String colids[] = ids.split(",");
        double[] strVoid = null;
        for (int i = 0; i < colids.length; i++) {
            strVoid = c.eval("data[," + colids[i] + "]").asDoubleArray();
            statdata.add(new QuickSort().quickSort1(strVoid, 0, strVoid.length - 1));
        }
        return SUCCESS;
    }


    public String getIds() {
        return ids;
    }

    public void setIds(String ids) {
        this.ids = ids;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public int getTotalrow() {
        return totalrow;
    }

    public void setTotalrow(int totalrow) {
        this.totalrow = totalrow;
    }

    public List<FileDatasetDetailBean> getFddBeans() {
        return fddBeans;
    }

    public void setFddBeans(List<FileDatasetDetailBean> fddBeans) {
        this.fddBeans = fddBeans;
    }

    public List<double[]> getStatdata() {
        return statdata;
    }

    public void setStatdata(List<double[]> statdata) {
        this.statdata = statdata;
    }

    public List<double[][]> getScatterdata() {
        return scatterdata;
    }

    public void setScatterdata(List<double[][]> scatterdata) {
        this.scatterdata = scatterdata;
    }

    public List<int[]> getVarname() {
        return varname;
    }

    public void setVarname(List<int[]> varname) {
        this.varname = varname;
    }

    public List<double[][]> getOutlier() {
        return outlier;
    }

    public void setOutlier(List<double[][]> outlier) {
        this.outlier = outlier;
    }

    public String[] getColors() {
        return colors;
    }

    public void setColors(String[] colors) {
        this.colors = colors;
    }

    public List<String[]> getMissdata() {
        return missdata;
    }

    public void setMissdata(List<String[]> missdata) {
        this.missdata = missdata;
    }

    public String getMissinput() {
        return missinput;
    }

    public void setMissinput(String missinput) {
        this.missinput = missinput;
    }

    public String getHasmissing() {
        return hasmissing;
    }

    public void setHasmissing(String hasmissing) {
        this.hasmissing = hasmissing;
    }

    public List<double[][]> getScatterdata3d() {
        return scatterdata3d;
    }

    public void setScatterdata3d(List<double[][]> scatterdata3d) {
        this.scatterdata3d = scatterdata3d;
    }
	public String getDataStart() {
		return dataStart;
	}
	public void setDataStart(String dataStart) {
		this.dataStart = dataStart;
	}
	public String getDataEnd() {
		return dataEnd;
	}
	public void setDataEnd(String dataEnd) {
		this.dataEnd = dataEnd;
	}
	public String[][] getDatashow() {
		return datashow;
	}
	public void setDatashow(String[][] datashow) {
		this.datashow = datashow;
	}
	public String[] getDatacolnames() {
		return datacolnames;
	}
	public void setDatacolnames(String[] datacolnames) {
		this.datacolnames = datacolnames;
	}
	public String getStarts() {
		return starts;
	}
	public void setStarts(String starts) {
		this.starts = starts;
	}
	public String getEnds() {
		return ends;
	}
	public void setEnds(String ends) {
		this.ends = ends;
	}
	public String getIndexs() {
		return indexs;
	}
	public void setIndexs(String indexs) {
		this.indexs = indexs;
	}
	public String getNumbers() {
		return numbers;
	}
	public void setNumbers(String numbers) {
		this.numbers = numbers;
	}
	public String[][] getStart() {
		return start;
	}
	public void setStart(String[][] start) {
		this.start = start;
	}
	public String[][] getEnd() {
		return end;
	}
	public void setEnd(String[][] end) {
		this.end = end;
	}
	public String[] getIndex() {
		return index;
	}
	public void setIndex(String[] index) {
		this.index = index;
	}
	public int[] getNumber() {
		return number;
	}
	public void setNumber(int[] number) {
		this.number = number;
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
